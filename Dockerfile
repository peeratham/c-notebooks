FROM jupyter/minimal-notebook

USER root
RUN apt-get update && \
    apt-get install -y gcc python3-pip && \
    rm -rf /var/lib/apt/lists/*

USER $NB_UID
RUN pip install jupyter-c-kernel && \
    python3 -m jupyter_c_kernel.install --user
