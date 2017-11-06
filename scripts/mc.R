source("scripts/input.R")
library(MethComp)
library(ggplot2)

# R and R2 ----------------------------------------------------------------

kinetics[Titulacao>0, .(R = cor(Titulacao, qPCR), R2=cor(Titulacao, qPCR)^2), by = .(MOI, Virus)]

# data visualization ------------------------------------------------------

mc.cax.01 <- with(kin.cax.01[Titulacao>0], Deming(Titulacao, qPCR))
mc.cax.001 <- with(kin.cax.001[Titulacao>0], Deming(Titulacao, qPCR))
mc.sar.01 <- with(kin.sar.01[Titulacao>0], Deming(Titulacao, qPCR))
mc.sar.001 <- with(kin.sar.001[Titulacao>0], Deming(Titulacao, qPCR))
mc.dem <- data.frame(rbind(mc.cax.01, mc.sar.01, mc.cax.001, mc.sar.001))
mc.dem$Virus <- rep(c("Mumps", "Measles"), 2)
mc.dem$MOI <- c("MOI 0.01", "MOI 0.01", "MOI 0.001", "MOI 0.001")
mc.dem$Virus <- factor(mc.dem$Virus)
mc.dem$MOI <- factor(mc.dem$MOI, levels = c("MOI 0.01", "MOI 0.001"))

ggplot(kinetics[Titulacao>0], aes(Titulacao, qPCR, col = factor(Coleta))) +
  scale_color_discrete(name = "Time (h)") +
  theme(legend.position = "bottom") +
  geom_abline(aes(intercept = Intercept, slope = Slope), mc.dem) +
  facet_grid(Virus ~ MOI) +
  # geom_smooth(method = "Deming") +
  xlab("PFU/ml (log10)") + ylab("Copies/PCR (log10)") +
  geom_point()
ggsave("figures/mc.png", width = 7, height = 7)
