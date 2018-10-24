FROM rocker/rstudio-stable:3.4.1

RUN R -e 'install.packages("testthat")'
RUN R -e 'install.packages("roxygen")'

COPY Rprofile .Rprofile
