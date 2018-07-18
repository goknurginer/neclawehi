setwd("/wehisan/general/academic/lab_smyth/kochann")
setwd("./eqtluchicagoedu/RNA_Seq_data/unmapped_reads/fastq")

date <- Sys.Date(); sink(paste0(date, "-alignment.R.log"), split = TRUE)

library(Rsubread)

files <- dir(pattern="fastq")
# paired-end
# files1 <- dir(pattern = "fastq.gz")[seq(1, length(f), by = 2)]
# files2 <- dir(pattern = "fastq.gz")[seq(2, 28, by = 2)] # this line is for paired-end alignment

align(index = "/usr/local/bioinfsoftware/subread/subread_index/hg19", readfile1 = files, nthreads = 5, unique = TRUE, input_format="gzFASTQ")

setwd("../bam")

files <- dir(pattern = "fastq.gz.subread.bam")

BAM <- files[!grepl(".indel", files)]
counts <- featureCounts(BAM, annot.inbuilt = "hg19")

propmap <- propmapped(BAM)
ann <- getInBuiltAnnotation("hg19")

d <- list(count = counts, propmap = propmap, ann = ann)
save(d, file = paste0("../RData", date, "yoruba-rsubread-hg19-gene.RData"))

print(sessionInfo())

sink()
