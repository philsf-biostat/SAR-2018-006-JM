library(readxl)
source("scripts/process.data.R")

cax <- read_excel("dataset/FAST- teste bulk mono x for x liof CAX 19-12_data.xls", 3)
cax <- process.data(cax)

rub <- read_excel("dataset/FAST- teste bulk mono x for x liof RUB 19-12_data.xls", 3)
rub <- process.data(rub)

sar <- read_excel("dataset/FAST- teste bulk mono x for x liof SAR 19-12_data.xls", 3)
sar <- process.data(sar)

cax$Virus <- "Mumps"
rub$Virus <- "Rubella"
sar$Virus <- "Measles"
virs <- rbind(cax, rub, sar)

# kinetics ----------------------------------------------------------------

kin.sar.01 <- data.table(read_excel("dataset/Dados_PCR_Tit.xlsx", "SARAMPO MOI 0,01"))
kin.cax.01 <- data.table(read_excel("dataset/Dados_PCR_Tit.xlsx", "CAXUMBA MOI 0,01"))
kin.sar.001 <- data.table(read_excel("dataset/Dados_PCR_Tit.xlsx", "SARAMPO MOI 0,001"))
kin.cax.001 <- data.table(read_excel("dataset/Dados_PCR_Tit.xlsx", "CAXUMBA MOI 0,001"))

kin.sar.01$Virus <- "Measles"
kin.cax.01$Virus <- "Mumps"
kin.sar.001$Virus <- "Measles"
kin.cax.001$Virus <- "Mumps"

kin.sar.01$MOI <- "MOI 0.01"
kin.cax.01$MOI <- "MOI 0.01"
kin.sar.001$MOI <- "MOI 0.001"
kin.cax.001$MOI <- "MOI 0.001"

kinetics <- rbind(kin.sar.01,kin.cax.01,kin.sar.001, kin.cax.001)
kinetics$Virus <- factor(kinetics$Virus)
kinetics$MOI <- factor(kinetics$MOI, levels = c("MOI 0.01", "MOI 0.001"))
