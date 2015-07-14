from fedora:21

RUN yum install -y wget make tar git \
      mingw32-gcc mingw32-gcc-c++ mingw32-gcc-gfortran mingw32-libxml2 \
      mingw32-dlfcn mingw32-winpthreads mingw32-curl mingw32-readline \
      mingw32-bintools mingw32-nsis\
      mingw64-gcc mingw64-gcc-c++ mingw64-gcc-gfortran mingw64-libxml2 \
      mingw64-dlfcn mingw64-winpthreads mingw64-curl mingw64-readline \
      mingw64-bintools \
      mingw32-libxml2-static mingw64-libxml2-static \
      mingw32-zlib-static mingw64-zlib-static \
      java-devel libxml2-devel binutils rsync mono-devel; \ 
    wine cmd /c echo test >/dev/null 2>&1 < /dev/null; \
    ln -sf /usr/i686-w64-mingw32/sys-root/mingw/bin/*.dll ~/.wine/drive_c/windows/syswow64/; \
    ln -sf  /usr/x86_64-w64-mingw32/sys-root/mingw/bin/*.dll ~/.wine/drive_c/windows/system32; \
    yum install -y ftp://ftp.pbone.net/mirror/ftp5.gwdg.de/pub/opensuse/repositories/home:/GRNET:/synnefo/Fedora_18/x86_64/winexe-1.00-9.1.x86_64.rpm



