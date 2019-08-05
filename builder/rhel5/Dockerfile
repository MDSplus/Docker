FROM mdsplus/builder:rhel5_root
MAINTAINER Tom Fredian, version: 0.1


# Perl TAP Parser for tests 
RUN curl -L http://cpanmin.us | perl - --self-upgrade; \
    cpanm TAP::Parser

RUN easy_install nose 
#    pip install --upgrade setuptools nose tap tap.py

