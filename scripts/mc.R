library(MethComp)

mc.cax.01 <- with(kin.cax.01, Deming(Titulacao, qPCR))

ggplot(kinetics[Titulacao>0], aes(Titulacao, qPCR)) +
  # geom_abline(intercept = mc.cax.01[1], slope = mc.cax.01[2]) +
  facet_grid(Virus ~ MOI) +
  geom_smooth(method = "Deming") +
  xlab("PFU/ml (log10)") + ylab("Copies/PCR (log10)") +
  geom_point()
