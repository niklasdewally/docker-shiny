# Dockerfile for running a shiny app server.
# Usage: bind app directory to /srv/shiny-server
# Inspired by and modified from:
# https://blog.sellorm.com/2021/04/25/shiny-app-in-docker/
# https://github.com/hvalev/shiny-server-arm-docker

FROM hvalev/shiny-server-arm:latest
 
# Dependencies needed to compile tidyverse packages
RUN apt-get update && apt-get install -y \
    libcurl4-gnutls-dev \
    libssl-dev \
    libicu-dev \
    g++
  
# R packages to install
# https://github.com/gagolews/stringi/INSTALL
RUN R -e "install.packages(\"stringi\", configure.args=\"--disable-cxx11\",repos=\"https://cran.rstudio.com\")"
RUN R -e 'install.packages(c(\
              "shiny", \
              "shinydashboard", \
              "vctrs", \
              "tidyverse", \
              "scales" \
            ), \
        repos="https://cran.rstudio.com" \
          )'

# Override default runpoint of hvalev/shiny-server-arm
ENTRYPOINT ["/bin/sh","-c"]
CMD ["/usr/bin/shiny-server"]
