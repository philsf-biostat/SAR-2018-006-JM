source("scripts/input.R")
library(ggplot2)

# data viz ----------------------------------------------------------------

lwd <- 0.4
al <- 0.6
psz <- 1

# facets plot
ggplot(kinetics, aes(x = Coleta)) +
  geom_smooth(aes(y = Titulacao, col = "Titulacao"), se = F, span = 1, lwd = lwd) +
  geom_jitter(aes(y = Titulacao, shape = "Titulacao", col = "Titulacao"), width = .1, alpha = al, size = psz) +
  # geom_line(data = sar01b, aes(y = Titulacao)) +
  geom_smooth(aes(y = qPCR, col = "qPCR"), se = F, span = 1, lwd = lwd) +
  geom_jitter(aes(y = qPCR, shape = "qPCR", col = "qPCR"), width = .1, alpha = al, size = psz) +
  # geom_line(data = sar01b, aes(y = qPCR)) +
  scale_x_continuous(breaks = kin.sar.01$Coleta) +
  scale_shape(name = "Technique") +
  xlab("Time of ... (h)") + ylab("Copies/PCR (log10)") +
  scale_color_discrete(name = "Technique") +
  theme(legend.position = "bottom") +
  facet_grid(Virus~MOI)
ggsave("figures/kinetics.png", width = 7, height = 7)
