from multiarch/alpine:x86_64-v3.3

ADD mdsplus@mdsplus.org-589e05b6.rsa.pub /etc/apk/keys/
ADD jupyter_notebook_config.py /etc/

RUN echo "http://www.mdsplus.org/dist/alpine/3.3/alpha" >> /etc/apk/repositories; \
    echo "http://dl-3.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories; \
    echo "http://dl-3.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories; \
    apk update; \
    apk add alpine-keys
    
RUN apk add python py-setuptools py2-numpy mdsplus-alpha-python
RUN apk add bash automake make \
       gcc g++ gfortran binutils libgcc libstdc++ libquadmath libgfortran \
       readline readline-dev python-dev

RUN apk add py-pip; \
    pip2 install --upgrade pip; \
    pip2 install --upgrade --force-reinstall --no-cache-dir jupyter
    
RUN apk add git rsync; \
    cd /root; \
    git clone http://github.com/MDSplus/jupyter; \
    cd jupyter/tdi_kernel; \
    source /usr/local/mdsplus/setup.sh; \
    python setup.py install; \
    python -m tdi_kernel.install; \
    mkdir /notebooks
    
ENTRYPOINT source /usr/local/mdsplus/setup.sh; \
    rsync -a /root/jupyter/tdi_kernel/samples /notebooks; \
    chown -R nobody:nobody /notebooks/samples; \
    chmod a+r -R /notebooks; \
    mkdir -p /home/nobody; \
    chown -R nobody:nobody /home/nobody; \
    su nobody -s /bin/sh -c "HOME=/home/nobody jupyter notebook --config=/etc/jupyter_notebook_config.py"



