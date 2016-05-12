FROM mdsplus/docker:rhel5
# To build docker image:
#
#    docker build -t mdsplus/docker:build_rhel5 .
#
#
#    To build MDSplus for rhel65use the following command:
#
#    docker run --rm \
#                [-v /your-buildroot-dir:/buildroot ] \
#                [-v /your-source-dir:/source ] \
#                [-v /your-installer-dir:/source ] \
#                mdsplus:build_rhel5 build|build_latest_release  \
#                [branch/tag]
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
#    It is recommended to use the --rm option unless you are interested in looking inside the docker container after it completes.
#
#

MAINTAINER Tom Fredian, version: 0.1


COPY build* /usr/local/bin/
RUN ln -sf /usr/local/bin/build.conf /etc/profile.d/mdsplus-build.sh
ENTRYPOINT ["build_mdsplus"]
