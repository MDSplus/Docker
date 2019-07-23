from fedora:28

RUN dnf -y update;\
    dnf -y install wget make tar git psmisc\
      mingw32-gcc mingw32-gcc-c++ mingw32-gcc-gfortran mingw32-libxml2 \
      mingw32-dlfcn mingw32-winpthreads mingw32-curl mingw32-readline \
      mingw32-nsis\
      mingw64-gcc mingw64-gcc-c++ mingw64-gcc-gfortran mingw64-libxml2 \
      mingw64-dlfcn mingw64-winpthreads mingw64-curl mingw64-readline \
      mingw32-libxml2-static mingw64-libxml2-static \
      mingw32-zlib-static mingw64-zlib-static \
      java-devel libxml2-devel binutils rsync mono-devel osslsigncode;


RUN dnf -y install 'dnf-command(config-manager)'; \
    dnf config-manager --add-repo https://dl.winehq.org/wine-builds/fedora/26/winehq.repo; \
    dnf -y install winehq-staging wine-filesystem; \
    wine cmd /c echo test >/dev/null 2>&1 < /dev/null; \
    ln -sf /usr/i686-w64-mingw32/sys-root/mingw/bin/*.dll ~/.wine/drive_c/windows/syswow64/; \
    ln -sf /usr/x86_64-w64-mingw32/sys-root/mingw/bin/*.dll ~/.wine/drive_c/windows/system32;

# for unit testing
RUN dnf install -y perl-Test-Harness.noarch openssh-server gdb gdb-gdbserver; \
    dnf clean all;

ADD python27.tar /

# for Visual Studio compiles

ADD MVS.tgz /
ADD WK.tgz /
   
