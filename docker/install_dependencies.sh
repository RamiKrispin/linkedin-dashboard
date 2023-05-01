#!/bin/bash

# Install dependencies
apt-get update && apt-get install -y --no-install-recommends \
    jq \
    libxml2-dev \
    zlib1g \
    g++-11 \
    libz-dev \
    freetype2-demos \
    libpng-dev \
    libtiff-dev \
    libjpeg-dev \
    make \
    fontconfig \
    libfribidi-dev \
    libharfbuzz-dev \
    libfontconfig1-dev \
    git \
    vim \
    curl \
    && rm -rf /var/lib/apt/lists/*

# Install R packages
Rscript packages/install_packages.R

# Installing Quarto
QUARTO_VERSION=$1
TEMP_QUARTO="$(mktemp)" &&
wget -O "$TEMP_QUARTO" https://github.com/quarto-dev/quarto-cli/releases/download/v$QUARTO_VERSION/quarto-${QUARTO_VERSION}-linux-amd64.deb &&
sudo dpkg -i "$TEMP_QUARTO"
rm -f "$TEMP_QUARTO"