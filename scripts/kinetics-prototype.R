source("scripts/input.R")
sar01 <- read_excel("dataset/Dados_PCR_Tit.xlsx",1)
library(data.table)
sar01 <- data.table(sar01)
sar01b <- sar01[,.(Titulacao = mean(Titulacao), qPCR = mean(qPCR)), by = .(Coleta)]

library(ggplot2)
ggplot(sar01b, aes(x = Coleta)) +
  geom_point(aes(y = Titulacao, shape = "Titulacao")) +
  geom_line(aes(y = Titulacao)) +
  geom_point(aes(y = qPCR, shape = "qPCR")) +
  geom_line(aes(y = qPCR)) +
  theme(legend.title = element_text("Technique"))
  
