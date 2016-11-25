FROM nvidia/cuda:8.0-cudnn5-devel
MAINTAINER justin@bulletprooftiger.com

#RUN apt-get update && apt-get install -y \
  #git \
  #python2.7 \
  #python-pip \
  #python-dev \
  #libhdf5-dev \
  #python-numpy \
  #python-scipy \
  #python-matplotlib \
  #ipython \
  #ipython-notebook \
  #python-pandas \
  #python-sympy \
  #python-nose

#RUN pip install --upgrade https://storage.googleapis.com/tensorflow/linux/gpu/tensorflow-0.10.0rc0-cp27-none-linux_x86_64.whl

RUN apt-get update && apt-get install -y \
  curl \
  libgtk2.0-0

RUN curl https://repo.continuum.io/archive/Anaconda3-4.2.0-Linux-x86_64.sh > Anaconda.sh
RUN bash Anaconda.sh -b
RUN mkdir /work
WORKDIR /work

ENV PATH /root/anaconda3/bin:$PATH

RUN conda create -y --name=venv python=3 anaconda
RUN /bin/bash -c "source activate venv && conda install -c https://conda.anaconda.org/menpo -y opencv3"
RUN /root/anaconda3/envs/venv/bin/pip install moviepy
RUN /root/anaconda3/envs/venv/bin/pip install --upgrade pip
RUN /root/anaconda3/envs/venv/bin/pip install https://storage.googleapis.com/tensorflow/linux/gpu/tensorflow-0.11.0-cp35-cp35m-linux_x86_64.whl
