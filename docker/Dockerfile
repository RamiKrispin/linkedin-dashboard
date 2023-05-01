FROM rocker/rstudio:4.2



ENV QUARTO_VERSION=1.3.340

# Disabling the authentication step
ENV USER="rstudio"
CMD ["/usr/lib/rstudio-server/bin/rserver", "--server-daemonize", "0", "--auth-none", "1"]

# Copy files
RUN mkdir packages
COPY install_dependencies.sh packages/
COPY install_packages.R packages/
COPY packages.json packages/

# Install jq to parse json files
RUN bash packages/install_dependencies.sh $QUARTO_VERSION

EXPOSE 8787

