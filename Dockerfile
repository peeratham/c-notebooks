# Use a standard Jupyter base image
FROM jupyter/minimal-notebook

# Switch to the root user to install system-level packages
USER root

# Update package lists and install the GCC compiler
RUN apt-get update && \
    apt-get install -y gcc && \
    rm -rf /var/lib/apt/lists/*

# Switch back to the default non-root notebook user
USER $NB_UID

# Install and enable the Jupyter C kernel for the user
RUN pip install jupyter-c-kernel && \
    python3 -m jupyter_c_kernel.install --user
