library(readxl)
source("scripts/process.data.R")

cax <- read_excel("dataset/FAST- teste bulk mono x for x liof CAX 19-12_data.xls", 3)
cax <- process.data(cax)

rub <- read_excel("dataset/FAST- teste bulk mono x for x liof RUB 19-12_data.xls", 3)
rub <- process.data(rub)

sar <- read_excel("dataset/FAST- teste bulk mono x for x liof SAR 19-12_data.xls", 3)
sar <- process.data(sar)
