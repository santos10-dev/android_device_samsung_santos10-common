#!/system/bin/sh
if test ! -f /data/swap; then
  dd if=/dev/zero of=/data/swap bs=1m count=512;
  chmod 644 /data/swap;
fi
mkswap /data/swap
swapon /data/swap
