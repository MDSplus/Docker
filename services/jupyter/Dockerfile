from multiarch/alpine:x86_64-v3.3

ADD mdsplus@mdsplus.org-589e05b6.rsa.pub /etc/apk/keys/
ADD jupyter_notebook_config.py /etc/
ADD startup.py /home/nobody/.ipython/profile_default/startup/
ADD MDSplus-examples.ipynb /home/nobody/

RUN echo "http://www.mdsplus.org/dist/alpine/3.3/alpha" >> /etc/apk/repositories; \
    echo "http://dl-3.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories; \
    echo "http://dl-3.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories; \
    apk update; \
    apk add alpine-keys
    
RUN apk add python py-setuptools py2-numpy mdsplus-alpha-python \
        bash automake make \
        gcc g++ gfortran binutils libgcc libstdc++ libquadmath libgfortran \
        readline readline-dev python-dev git rsync py-pip libpng freetype-dev py-numpy-dev; \
    pip2 install --upgrade pip; \
    pip2 install --upgrade --force-reinstall --no-cache-dir jupyter; \
    pip2 install --upgrade matplotlib; \
    mkdir /notebooks

    
ENTRYPOINT source /usr/local/mdsplus/setup.sh; \
    if [ ! -r /notebooks/MDSplus-examples.ipynb ]; then cp /home/nobody/MDSplus-examples.ipynb /notebooks; fi; \
    chmod a+rw -R /notebooks; \
    chown -R nobody:nobody /home/nobody; \
    su nobody -s /bin/sh -c "HOME=/home/nobody jupyter notebook --config=/etc/jupyter_notebook_config.py"

#RUN cd /root; \
#    git clone http://github.com/MDSplus/jupyter; \
#    cd jupyter/tdi_kernel; \
#    source /usr/local/mdsplus/setup.sh; \
#    python setup.py install; \
#    python -m tdi_kernel.install; \
#    cd ../mdstcl_kernel; \
#    python setup.py install; \
#    python -m mdstcl_kernel.install; \
#    mkdir /notebooks
# old entry point
#    cd /usr/local/mdsplus/mdsobjects/python; \
#    python setup.py install; \
#    cd /root/jupyter; \
#    git pull -q; \
#    rsync -a /root/jupyter/samples /notebooks; \
#    chown -R nobody:nobody /notebooks/samples; \
#    chown -R nobody:nobody /usr/local/mdsplus/trees; \

