#include <cstdint>

extern "C" {
    /* status_t Parcel::writeInt32 */
    int32_t _ZN7android6Parcel10writeInt32Ei(int32_t val);

    int32_t _ZN7android6Parcel11writeIntPtrEi(intptr_t val) {
        return _ZN7android6Parcel10writeInt32Ei((int32_t) val);
    }
}
