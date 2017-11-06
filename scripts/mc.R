source("scripts/input.R")
library(MethComp)
library(ggplot2)

# R and R2 ----------------------------------------------------------------

kinetics[Titulacao>0, .(R = cor(Titulacao, qPCR), R2=cor(Titulacao, qPCR)^2), by = .(MOI, Virus)]

# data visualization ------------------------------------------------------

mc.dem <- (kinetics[Titulacao>0, 
                     .( Intercept = Deming(Titulacao, qPCR)[1],
                        Slope = Deming(Titulacao, qPCR)[2] ),
                     by = .(MOI, Virus)])

ggplot(kinetics[Titulacao>0], aes(Titulacao, qPCR, col = factor(Coleta))) +
  scale_color_discrete(name = "Time (h)") +
  theme(legend.position = "bottom") +
  geom_abline(aes(intercept = Intercept, slope = Slope), mc.dem) +
  facet_grid(Virus ~ MOI) +
  # geom_smooth(method = "Deming") +
  xlab("PFU/ml (log10)") + ylab("Copies/PCR (log10)") +
  geom_point()
ggsave("figures/mc.png", width = 7, height = 7)
