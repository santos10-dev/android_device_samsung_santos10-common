/*
 * Copyright (C) 2010, 2011 Alexey Roslyakov
 *
 * Author: Alexey Roslyakov <alexey.roslyakov@newsycat.com>
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#include <binder/IBinder.h>
#include <binder/IInterface.h>
#include <binder/IServiceManager.h>
#include <utils/Log.h>

#include <errno.h>
#include <poll.h>
#include <string.h>
#include <unistd.h>
#include <linux/netlink.h>
#include <sys/socket.h>
#include <sys/un.h>

namespace android {

class IMultiDisplayComposer: public IInterface {
public:
    DECLARE_META_INTERFACE(MultiDisplayComposer);

    virtual int A() = 0;
    virtual int B() = 0;
    virtual int C() = 0;
    virtual int D() = 0;
    virtual int E() = 0;
    virtual int F() = 0;
    virtual int G() = 0;
    virtual int notifyHotPlug(int, int) = 0;
};

}; // namespace android

#define UEVENT_BUFFER_SIZE 4096

static int open_uevent()
{
    struct sockaddr_nl addr;
    int sz = UEVENT_BUFFER_SIZE;
    int s;

    memset(&addr, 0, sizeof(addr));
    addr.nl_family = AF_NETLINK;
    addr.nl_groups = 0xffffffff;

    /*
     *       netlink(7) on nl_pid:
     *       If the application sets it to 0, the kernel takes care of assigning it.
     *       The  kernel assigns the process ID to the first netlink socket the process
     *       opens and assigns a unique nl_pid to every netlink socket that the
     *       process subsequently creates.
     */
    addr.nl_pid = getpid();

    s = socket(PF_NETLINK, SOCK_DGRAM, NETLINK_KOBJECT_UEVENT);
    if (s < 0) {
        ALOGE("%s socket failed: %s", __func__, strerror(errno));
        return -1;
    }

    setsockopt(s, SOL_SOCKET, SO_RCVBUFFORCE, &sz, sizeof(sz));

    if (bind(s, (struct sockaddr *) &addr, sizeof(addr)) < 0) {
        ALOGE("%s bind failed: %s", __func__, strerror(errno));
        close(s);
        return -1;
    }

    return s;
}

int uevent_next_event(int fd, char* buffer, int buffer_length)
{
    while (1) {
        struct pollfd fds;
        int nr;

        fds.fd = fd;
        fds.events = POLLIN;
        fds.revents = 0;
        nr = poll(&fds, 1, -1);

        if (nr > 0 && fds.revents == POLLIN) {
            int count = recv(fd, buffer, buffer_length, 0);
            if (count > 0)
                return count;
            ALOGE("%s recv failed: %s", __func__, strerror(errno));
        }
    }

    return 0;
}

int main(void)
{
    android::sp<android::IServiceManager> sm = android::defaultServiceManager();
    if (sm == NULL)
        return -1;

    // Try for 10 seconds
    int retries = 10;
    android::sp<android::IBinder> service = NULL;
    while (retries > 0 && service == NULL) {
        service = sm->getService(android::String16("display.intel.mds"));
        retries--;
        usleep(1000000);
    }

    if (service == NULL)
        return -1;

    android::sp<android::IMultiDisplayComposer> composer = android::interface_cast<android::IMultiDisplayComposer>(service);

    char msg[UEVENT_BUFFER_SIZE];
    const char *envelope = "change@/devices/pci0000:00/0000:00:02.0/drm/card0";
    int fd = open_uevent();
    if (fd < 0)
        return -1;

    while(1) {
        int count = uevent_next_event(fd, msg, sizeof(msg));
        if (!count) {
            close(fd);
            return -1;
        }

	if (strncmp(msg, envelope, strlen(envelope)) == 0)
	    composer->notifyHotPlug(2, 1);
    }

    return 0;
}
