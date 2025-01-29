# Use the rocker/rstudio base image
FROM rocker/rstudio:latest

# Install system dependencies
RUN apt-get update && apt-get install -y \
    sudo \
    pandoc \
    pandoc-citeproc \
    libcurl4-openssl-dev \
    libssl-dev \
    libxml2-dev \
    libgit2-dev \
    wget \
    curl \
    git \
    && rm -rf /var/lib/apt/lists/*

# Install Quarto
RUN wget https://quarto.org/download/latest/quarto-linux-amd64.deb
RUN dpkg -i quarto-linux-amd64.deb
RUN rm quarto-linux-amd64.deb

# Install TinyTeX (LaTeX distribution)
RUN /bin/bash -c "wget -qO- 'https://yihui.org/tinytex/install-bin-unix.sh' | sh"
ENV PATH="/root/bin:${PATH}"
ENV PATH="/root/.TinyTeX/bin/linux/x86_64-linuxmusl:${PATH}"

# Install additional LaTeX packages (as needed)
RUN tlmgr install needed-package-1 needed-package-2

# Install R packages required for your thesis
RUN Rscript -e "install.packages(c('tidyverse', 'bookdown', 'yourpackage'), repos='https://cloud.r-project.org')"

# Expose ports (if necessary)
EXPOSE 8787

# Set working directory
WORKDIR /home/rstudio

# Copy your thesis project into the container (optional)
# COPY . /home/rstudio/your-thesis-project

# Set default command
CMD ["bash"]