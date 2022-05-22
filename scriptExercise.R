##################################################
# Script for exercise part of teaching demonstration
# Author: Anita Lerch
# May 22, 2022
##################################################

# Install software if missing
if(!("dada2" %in% installed.packages() & "Biostrings" %in% installed.packages())){
  if (!requireNamespace("BiocManager", quietly = TRUE))
    install.packages("BiocManager")
  BiocManager::install(c("dada2","Biostrings"))
}

# Set working directory 
# setwd("~/Repos/TeachingDemonstration/")

# Load software
source("dadaWrapper.R")

# Load sequence reads
rawReads <- list.files("reads", full.names=T)

## Quality control and preprocessing skipped in exercise!

# Align sequence reads; align sequence reads to each other for reference free alignment
alnObj <- alignment(rawReads)

# Extract haplotypes and counts
hapTab <- getHaplotypes(alnObj)
hapTab$haplotypes
hapTab$counts

# Assign known haplotypes
assignStrain(haplotypes=hapTab$haplotypes, refFn="refSeq.fasta")
