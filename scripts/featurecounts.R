# Copy all bam files from./fastq to ./bam
# setwd("/wehisan/general/academic/lab_smyth/kochann")
# setwd("./eqtluchicagoedu/RNA_Seq_data/unmapped_reads/bam")

date <- Sys.Date(); sink(paste0(date, "-alignment.R.log"), split = TRUE)

library(Rsubread)

files <- dir(pattern = "bam")

BAM <- files[!grepl(".indel", files)]
counts <- featureCounts(BAM, annot.inbuilt = "hg19")

propmap <- propmapped(BAM)
ann <- getInBuiltAnnotation("hg19")

d <- list(count = counts, propmap = propmap, ann = ann)
save(d, file = paste0("../RData", date, "yoruba-rsubread-hg19-gene.RData"))

print(sessionInfo())

sink()
