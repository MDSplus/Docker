FROM mdsplus/docker:windows
# To build docker image:
#
#    docker build -t mdsplus/docker:build_windows .
#
#
#    To build MDSplus for Windows use the following command:
#
#    docker run --rm \
#               [-v /your-buildroot-dir:/buildroot ] \
#               [-v /your-source-dir:/source ] \
#               [-v /your-installer-dir:/installer ] \
#               [-v /mdsplus/certs:/certs ] \
#               [-v /your-linux-winbld-share-mount:/winbld ] \
#                -e "WINBLD_USER=VS-system-username%VS-system-password" \
#                -e "WINBLD_HOST=VS-system-hostname" \
#                -e "WINBLD_REMDIR=/your-VS-system-winbld-windows-dir" ] \
#               mdsplus/docker:build_windows build|build_latest_release [branch/tag]
#
#    Using the build option:
#
#    If you want the contents of an MDSplus build install include a directory specification using the -v /dir:/buildroot
#    option. If you want to build using your own copy of mdsplus sources use the -v /dir:/source option and do not
#    include the branch/tag parameter. If you do specify the branch/tag parameter the sources will be fetched
#    from the github MDSplus repository. For example, use alpha for the latest commit to the alpha branch or use
#    stable_release-7.0.6 to use the sources used to generate the stable release 7.0.6.
#
#    Using the build_latest_release option:
#
#    When using the build_latest_release option, specify either alpha or stable for the branch/tag command parameter.
#    The build script will then query github to find out the latest release for the specified branch using release tags.
#    The script will then determine if the installer already exists in the directory specified for the /installer directory.
#    If the installer does not exist, the script will fetch the sources for that release and build an installer for that
#    release. If a certs directory is specified the script will sign the installer with keys in that directory (used for
#    official MDSplus releases).
#
#    Visual Studio builds
#
#    Most of the MDSplus dll's built with mingw64 cross compilers on linux are compatible with applications written using
#    native Visual Studio projects. However, dll's which might throw c++ exceptions build with mingw64 are not compatible
#    with user applications build with Visual Studio. For that reason we are providing versions of these dll's built using
#    Visual Studio to include in the installer. These dll's will be named as xxxx-VS.dll (i.e. MdsObjectsCppShr-VS.dll).
#    To facilitate the VS builds you must specify a directory of a writable windows share on the linux side and three
#    environment variables (WINBLD_USER, WINBLD_HOST, WINBLD_REMDIR) which will be used to log into a Windows host and build
#    a Visual Studio project to build the VS compatible dll's and import libraries.
#
#    It is recommended to use the --rm option unless you are interested in looking inside the docker container after it completes.
#
#

MAINTAINER Tom Fredian, version: 0.1

#
# Since configure now builds test executables and executes them wine must have the mingw dll's
# installed in its drive_c/windows/... directories. Run wine to create ~/.wine and then add symlinks
#

COPY build* /usr/local/bin/

ENTRYPOINT ["build_mdsplus"]
