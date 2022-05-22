##################################################
# Instalation script for teaching demonstration
# Author: Anita Lerch
# May 22, 2022
##################################################

if(!requireNamespace("BiocManager", quietly = TRUE))
  install.packages("BiocManager")
BiocManager::install(c("dada2","Biostrings"))

library(dada2)
library(Biostrings)
