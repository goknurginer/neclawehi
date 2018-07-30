

setwd("C:/Users/kochan.n/Desktop/Goknur_Necla_18072018/neclawehi/TCGA")
Targets <- read.csv("Targets.txt", sep="")
Counts <- read.csv("150415-TCGA_Subtypes882_Counts.txt", sep="")
geneid <- Counts[,1]

Counts <- Counts[,-1]

colnames(Counts) <- Targets$PatientID
