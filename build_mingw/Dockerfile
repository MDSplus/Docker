FROM mdsplus/docker:mingw
# To build docker image:
#
#    docker build -t mdsplus/docker:build_mingw .
#
#
#    To build MDSplus for Windows use the following command:
#
#    docker run [--rm] [-v /mybuildroot-dirspec:/buildroot ] \
#                [-v /mysource-dirspec:/source ] \
#                mdsplus:build_mingw build  \
#                [branch/tag]
#
#    If you want the contents of an MDSplus build install include a directory specification using the -v /dir:/buildroot
#    option. If you want to build using your own copy of mdsplus sources use the -v /dir:/source option and do not
#    include the branch/tag parameter. If you do specify the branch/tag parameter the sources will be fetched
#    from the github MDSplus repository. For example, use alpha for the latest commit to the alpha branch or use
#    stable_release-7.0.6 to use the sources used to generate the stable release 7.0.6. It is recommended to use the
#    --rm option unless you are interested in looking inside the docker container after it completes.
#
#

MAINTAINER Tom Fredian, version: 0.1

#
# Since configure now builds test executables and executes them wine must have the mingw dll's
# installed in its drive_c/windows/... directories. Run wine to create ~/.wine and then add symlinks
#

RUN wine cmd /c echo test >/dev/null 2>&1 < /dev/null; \
    ln -sf /usr/i686-w64-mingw32/sys-root/mingw/bin/*.dll ~/.wine/drive_c/windows/syswow64/; \
    ln -sf  /usr/x86_64-w64-mingw32/sys-root/mingw/bin/*.dll ~/.wine/drive_c/windows/system32

RUN yum install -y ftp://ftp.pbone.net/mirror/ftp5.gwdg.de/pub/opensuse/repositories/home:/GRNET:/synnefo/Fedora_18/x86_64/winexe-1.00-9.1.x86_64.rpm

COPY build_* /usr/local/bin/

ENTRYPOINT ["build_mdsplus"]
