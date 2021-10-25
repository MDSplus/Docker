from mdsplus/builder:ubuntu14-32

ADD rootfs.tar.gz /raspberrypi-rootfs
ADD gcc-arm-raspbian.tar.gz /
RUN chmod -R a+rx /gcc-linaro-arm-linux-gnueabihf-raspbian\
 && ln -sf /gcc-linaro-arm-linux-gnueabihf-raspbian/arm-linux-gnueabihf/include /usr/include/arm-linux-gnueabihf\
 && mkdir -p /raspberrypi-include\
 && ln -sf /raspberrypi-rootfs/usr/include/Mrm /raspberrypi-include/\
 && ln -sf /raspberrypi-rootfs/usr/include/X11 /raspberrypi-include/\
 && ln -sf /raspberrypi-rootfs/usr/include/Xm /raspberrypi-include/\
 && ln -sf /raspberrypi-rootfs/usr/include/readline /raspberrypi-include/\
 && ln -sf /raspberrypi-rootfs/usr/include/curl /raspberrypi-include/\
 && ln -sf /raspberrypi-rootfs/usr/include/zlib.h /raspberrypi-include/\
 && ln -sf /raspberrypi-rootfs/usr/include/zconf.h /raspberrypi-include/\
 && ln -sf /usr/include/sybdb.h /raspberrypi-include/\
 && ln -sf /usr/include/syberror.h /raspberrypi-include/\
 && ln -sf /usr/include/sybfront.h /raspberrypi-include/\
 && ln -sf /usr/include/tds_sysdep_public.h /raspberrypi-include/\
# cleanup
 && rm -rf /tmp/*
CMD /bin/bash
