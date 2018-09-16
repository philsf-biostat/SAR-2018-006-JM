library(readxl)
source("scripts/process.data.R")

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
