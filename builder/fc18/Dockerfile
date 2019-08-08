FROM mdsplus/builder:fc18_root

MAINTAINER Tom Fredian, version: 0.1


#
# Testing package adds ...
#
RUN yum install -y \
                   perl-Test-Harness.noarch \
                   valgrind valgrind.i686

# python tests
RUN easy_install-2.7 pip; \
    pip2 install --upgrade setuptools nose tap tap.py


# to run debugger in container
# RUN yum install -y \
#                    gdb gdb-gdbserver \
#                    openssh openssh-server
