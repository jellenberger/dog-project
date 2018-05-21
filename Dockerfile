# Start from a core stack version
FROM jupyter/minimal-notebook

# Switch to the non-root user for conda environment creation
USER $NB_UID

# Copy environment file and create environment
COPY appenv.yml /home/jovyan/appenv.yml
RUN conda update -n base conda && \
    conda config --add channels conda-forge && \
    conda env create -n appenv -f appenv.yml && \
    rm -rf /opt/conda/pkgs/*

# 'Activate' the appenv environment by prepending to path
ENV PATH /opt/conda/envs/appenv/bin:$PATH