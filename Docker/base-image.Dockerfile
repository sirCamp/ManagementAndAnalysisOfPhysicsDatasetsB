FROM python:3.8.9-buster

ARG shared_workspace=/opt/workspace
ENV SHARED_WORKSPACE=${shared_workspace}
RUN apt-get update \
    && apt-get install graphviz -yq \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN curl -sL https://deb.nodesource.com/setup_14.x -o nodesource_setup.sh && \
    bash nodesource_setup.sh &&  \
    apt-get install nodejs -y

# Layer python
RUN pip3 install  pandas \
   numpy \
   "dask[complete]" \
   "dask[array]"    \
   "dask[dataframe]"  \
   "dask[diagnostics]"  \
   "dask[distributed]"  \
   dask-ml \
   scikit-learn \
   numba \
   notebook \
   jupyterlab \
   matplotlib \
   Pillow \
   seaborn \
   graphviz \
   xgboost \
   joblib \
   pyarrow \
   tensorflow==2.4.1 \
   keras \
   torch \
   scikeras==0.3.3 \
   jupyter-server-proxy \
   dask_labextension \
   jupyterlab-lsp

RUN jupyter labextension install dask-labextension
RUN jupyter labextension install @jupyterlab/server-proxy

# -- Install proc tools
RUN apt-get update && apt-get install -y procps && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

SHELL ["/bin/bash", "-c"]
