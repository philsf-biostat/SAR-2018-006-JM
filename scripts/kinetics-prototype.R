source("scripts/input.R")
sar01 <- read_excel("dataset/Dados_PCR_Tit.xlsx",1)
library(data.table)
sar01 <- data.table(sar01)
sar01b <- sar01[,.(Titulacao = mean(Titulacao), qPCR = mean(qPCR)), by = .(Coleta)]

library(ggplot2)
# mean dots
ggplot(sar01b, aes(x = Coleta)) +
  geom_point(aes(y = Titulacao, shape = "Titulacao")) +
  geom_line(aes(y = Titulacao)) +
  geom_point(aes(y = qPCR, shape = "qPCR")) +
  geom_line(aes(y = qPCR)) +
  scale_x_continuous(breaks = sar01$Coleta) +
  scale_shape(name = "Technique") +
  theme(legend.position = "bottom")
  
# individual dots
ggplot(sar01, aes(x = Coleta)) +
  geom_jitter(aes(y = Titulacao, shape = "Titulacao"), alpha = .4, width = .1) +
  geom_line(data = sar01b, aes(y = Titulacao)) +
  geom_jitter(aes(y = qPCR, shape = "qPCR"), alpha = .4, width = .1) +
  geom_line(data = sar01b, aes(y = qPCR)) +
  scale_x_continuous(breaks = sar01$Coleta) +
  scale_shape(name = "Technique") +
  scale_color_discrete(name = "Experiment") +
  theme(legend.position = "bottom")

