FROM rocker/rstudio-stable:3.4.1

COPY Rprofile .Rprofile
RUN R -e 'install.packages("testthat")'
RUN R -e 'install.packages("roxygen2")'

