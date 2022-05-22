##################################################
# Wrapper functions for teaching demonstration
# Author: Anita Lerch
# May 22, 2022
##################################################

library(dada2)
library(Biostrings)

qualityControl <- function(inFn){
  suppressWarnings(plotQualityProfile(inFn, aggregate=T))
}

preprocessing <- function(inFn, outFn, truncLen){
  dir.create("filtered", showWarnings=F)
  outFn <- file.path("filtered", basename(inFn))
  filterAndTrim(inFn, outFn, truncLen=truncLen, maxEE=c(2))
  return(outFn)
}

alignment <- function(inFn){
  err <- learnErrors(inFn, multithread=F)
  dada(inFn, err=err, multithread=F)
}

getHaplotypes <- function(alnObj){
  seqtab <- makeSequenceTable(alnObj)
  counts <- removeBimeraDenovo(seqtab, method="consensus", multithread=F, verbose=F)
  haplotypes <- DNAStringSet(colnames(counts))
  oIdx <- order(haplotypes)
  haplotypes <- haplotypes[oIdx]
  counts <- counts[,oIdx]
  names(haplotypes) <- paste("HapId", 1:length(haplotypes), sep="")
  colnames(counts) <- names(haplotypes)
  rownames(counts) <- sub(".fastq.gz","", rownames(counts))
  return(list(haplotypes=haplotypes, counts=counts))
}

assignStrain <- function(haplotypes, refFn){
  refSeq <- readDNAStringSet(refFn)
  refSeq <- narrow(refSeq, 1, width(haplotypes)[1])
  refName <- unlist(lapply(haplotypes, function(hap){
    paste(names(refSeq)[hap==refSeq], collapse=";")
  }))
  return(refName)
}

