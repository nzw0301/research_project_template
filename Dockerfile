FROM ubuntu:16.04

USER root

RUN apt-get update && \
    apt-get -y upgrade && \
    apt-get -y install \
        wget \
        unzip \
        emacs \
        git \
        build-essential \
        bzip2 \
        ca-certificates \
        sudo \
        locales \
        curl && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN echo "en_US.UTF-8 UTF-8" > /etc/locale.gen && \
    locale-gen

# install pyenv
ENV PYENV_ROOT /root/.pyenv
ENV PATH $PYENV_ROOT/shims:$PYENV_ROOT/bin:$PATH
RUN curl -L https://raw.githubusercontent.com/yyuu/pyenv-installer/master/bin/pyenv-installer | bash

# install miniconda3 and packages
RUN pyenv install miniconda3-latest
RUN pyenv global miniconda3-latest

RUN conda install --yes \
    'python=3.6.4' \
    'jupyter=1.0.0' \
    'pandas=0.22.0' \
    'numpy=1.14.0' \
    'scipy=1.0.0' \
    'scikit-learn=0.19.1' \
    'matplotlib=2.1.2' \
    'hdf5=1.10.1' \
    'gensim=3.1.0' \
    'seaborn=0.8.1' && \
    conda clean -tipsy

# RUN pyenv install miniconda2-latest

# julia
RUN cd /usr/local/bin && \
    wget "https://julialang-s3.julialang.org/bin/linux/x64/0.6/julia-0.6.2-linux-x86_64.tar.gz" && \
    tar -xvf julia-0.6.2-linux-x86_64.tar.gz && \
    rm julia-0.6.2-linux-x86_64.tar.gz
RUN echo "PATH=$PATH:/usr/local/bin/julia-d386e40c17/bin" >> ~/.bashrc
