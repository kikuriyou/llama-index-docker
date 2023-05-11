FROM python:3.9.10-buster as python-base

ARG DEBIAN_FRONTEND=noninteractive

FROM python-base as initial
RUN apt-get update && \
    apt-get install -y \
    tzdata \
&&  ln -sf /usr/share/zoneinfo/Asia/Tokyo /etc/localtime \
&&  apt-get clean \
&&  rm -rf /var/lib/apt/lists/*

ENV TZ=Asia/Tokyo

# JupyterLab packages
FROM initial as jupyterlab-base
RUN python3 -m pip install --upgrade pip \
&&  pip install --no-cache-dir \
    black \
    jupyterlab \
    jupyterlab_code_formatter \
    jupyterlab-git \
    lckr-jupyterlab-variableinspector \
    jupyterlab_widgets \
    ipywidgets \
    import-ipynb

# python packages
FROM jupyterlab-base as jupyterlab-development
RUN pip install --no-cache-dir \
    numpy \
    pandas \
    scipy \
    scikit-learn \
    matplotlib \
    google-cloud-storage \
    google-cloud-bigquery \
    google-cloud-bigquery-storage \
    google-cloud-aiplatform \
    boto3 \
    langchain \
    openai \
    llama-index==0.6.5 \
    faiss-cpu