from fedora:39

ADD python27.tar /
ADD MVS.tgz /
ADD WK.tgz /  
RUN dnf -y install 'dnf-command(config-manager)'\
 && dnf config-manager --add-repo https://dl.winehq.org/wine-builds/fedora/39/winehq.repo\
# please dont just add packages but format them using this recipe:
# $list | tr ' ' '\n'| sort | uniq | sed -E 's/.*/\t\0\\/g'
 && dnf -y install\
	binutils\
	diffutils\
	git\
	java-devel\
	libxml2-devel\
	make\
	mingw32-curl\
	mingw32-dlfcn\
	mingw32-gcc\
	mingw32-gcc-c++\
	mingw32-gcc-gfortran\
	mingw32-gdb\
	mingw32-libxml2\
	mingw32-libxml2-static\
	mingw32-nsis\
	mingw32-readline\
	mingw32-winpthreads\
	mingw32-zlib-static\
	mingw64-curl\
	mingw64-dlfcn\
	mingw64-gcc\
	mingw64-gcc-c++\
	mingw64-gcc-gfortran\
	mingw64-gdb\
	mingw64-libxml2\
	mingw64-libxml2-static\
	mingw64-readline\
	mingw64-winpthreads\
	mingw64-zlib-static\
	mingw-w64-tools\
	mono-devel\
	openssh-server\
	osslsigncode\
	perl-Test-Harness.noarch\
	psmisc\
	rsync\
	tar\
	wget\
	wine-filesystem\
	winehq-stable\
 && wine cmd /c echo test >/dev/null 2>&1 < /dev/null\
 && ln -sf /usr/i686-w64-mingw32/sys-root/mingw/bin/*.dll ~/.wine/drive_c/windows/syswow64/\
 && ln -sf /usr/x86_64-w64-mingw32/sys-root/mingw/bin/*.dll ~/.wine/drive_c/windows/system32/\
# cleanup
 && rm -rf /tmp/*\
 && dnf clean all
