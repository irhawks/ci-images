#!/bin/bash

apt install -yq libudunits2-dev libv8-dev
apt install -yq libcairo2-dev libcurl4-openssl-dev 
Rscript -e install.packages('geosphere')
