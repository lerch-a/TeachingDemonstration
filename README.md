# Teaching Demonstration

## Install
The R/Bioconducter package dada2 and Biostrings are used for the teaching demonstration. To install this package open an R command line and run the following line of code:
```{r}
if(!requireNamespace("BiocManager", quietly = TRUE))
  install.packages("BiocManager")
BiocManager::install(c("dada2","Biostrings"))
```

After installing the package check if the packages can be loaded with
```{r}
library(dada2)
library(Biostrings)
```

## Download data and sripts
To get the data and scripts needed for the teaching demonstration, go to the green "Code" button and chose "download ZIP". After downloading uncompress the zip file.


## Run scripts
To execute the scripts, open RStudio or R and change the working directory to the "TeachingDemonstration" folder with
```{r}
setwd("path/to/TeachingDemonstration")
```

Then open scripts "scriptTheory.R" or "scriptExercise.R" and copy&paste the code in the R command prompt 

