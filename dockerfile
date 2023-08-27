FROM continuumio/miniconda3:main



# Set environment variables to non-interactive mode and disable conda's auto-activation
ENV CONDA_AUTO_UPDATE_CONDA=false
ENV CONDA_INSTALL_PACKAGES=""

# Create a Conda environment called "root"
#RUN conda create -n root

# Activate the "root" environment by default
#RUN echo "conda activate root" >> ~/.bashrc

# Set the default shell to bash
SHELL ["/bin/bash", "--login", "-c"]

WORKDIR /lab

COPY ngsconda.yml .

RUN conda env update -n root -f ngsconda.yml \
    && conda clean -a

RUN pip install multiqc

# Start a bash shell by default
CMD ["bash"]





