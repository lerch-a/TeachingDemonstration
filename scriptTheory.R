##################################################
# Script for theory part of teaching demonstration
# Author: Anita Lerch
# May 22, 2022
##################################################

# Set working directory 
# setwd("~/Repos/TeachingDemonstration/")

# Load software
source("dadaWrapper.R")

# Load sequence reads
rawReads <- list.files("reads", full.names=T)

# Run quality control
qualityControl(rawReads)

# Preprocess sequence reads; trim reads to remove low quality basecalls
filtReads <- preprocessing(rawReads, filtReads, truncLen=150)

# Align sequence reads; align sequence reads to each other for reference free alignment
alnObj <- alignment(filtReads)

# Extract haplotypes and counts
hapTab <- getHaplotypes(alnObj)
hapTab$haplotypes
hapTab$counts

# Assign known haplotypes
assignStrain(haplotypes=hapTab$haplotypes, refFn="refSeq.fasta")
