FROM rocker/rstudio-stable:3.4.1

COPY Rprofile ~/.Rprofile

RUN apt update && apt install -yq libxml2-dev 
RUN R -e 'install.packages("testthat")'
RUN R -e 'install.packages("roxygen2")'


