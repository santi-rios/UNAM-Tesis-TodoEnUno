# Base image (Ubuntu with R and LaTeX dependencies)
FROM rocker/verse:4.3.1

# Install Quarto
ARG QUARTO_VERSION=1.4.549
RUN wget -O quarto.deb "https://github.com/quarto-dev/quarto-cli/releases/download/v${QUARTO_VERSION}/quarto-${QUARTO_VERSION}-linux-amd64.deb" && \
    dpkg -i quarto.deb && \
    rm quarto.deb

# Install LaTeX packages (adjust to your university's requirements)
RUN tlmgr install \
    microtype \
    babel \
    geometry \
    fancyhdr \
    sectsty \
    setspace \
    tocloft \
    xcolor \
    hyperref \
    bookmark

# Install R packages (if needed)
RUN Rscript -e "install.packages(c('rmarkdown', 'knitr', 'bookdown', 'tidyverse'))"

# Clean up
RUN apt-get clean && rm -rf /var/lib/apt/lists/*