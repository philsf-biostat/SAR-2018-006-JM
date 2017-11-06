source("scripts/modelos.R")

library(ggplot2)
ggplot(cax, aes(Sample, Quantity)) +
  geom_point(alpha = .25) +
  xlab("Mumps") + ylab("Copies/PCR (log10)") +
  ggtitle("Potency")
ggplot(rub, aes(Sample, Quantity)) +
  geom_point(alpha = .25) +
  xlab("Rubella") + ylab("Copies/PCR (log10)") +
  ggtitle("Potency")
ggplot(sar, aes(Sample, Quantity)) +
  geom_point(alpha = .25) +
  xlab("Measles") + ylab("Copies/PCR (log10)") +
  ggtitle("Potency")

## Normality
cax[, .(Shapiro.pv = shapiro.test(Quantity)$p.value, Significant = shapiro.test(Quantity)$p.value < .05), by = Sample]
rub[, .(Shapiro.pv = shapiro.test(Quantity)$p.value, Significant = shapiro.test(Quantity)$p.value < .05), by = Sample]
sar[, .(Shapiro.pv = shapiro.test(Quantity)$p.value, Significant = shapiro.test(Quantity)$p.value < .05), by = Sample]

## homogeneity of variances
# Bartlett
with(cax, bartlett.test(Quantity ~ Sample))
with(rub, bartlett.test(Quantity ~ Sample))
with(sar, bartlett.test(Quantity ~ Sample))

# Levene
library(car)
with(cax, leveneTest(Quantity ~ Sample, center = mean))
with(rub, leveneTest(Quantity ~ Sample, center = mean))
with(sar, leveneTest(Quantity ~ Sample, center = mean))

# Fligner
with(sar, fligner.test(Quantity ~ Sample))
with(rub, fligner.test(Quantity ~ Sample))
with(cax, fligner.test(Quantity ~ Sample))

library(psych)
with(cax, describeBy(Quantity, Sample))
with(rub, describeBy(Quantity, Sample))
with(sar, describeBy(Quantity, Sample))

library(tableone)
cax.tab <- CreateTableOne(data = transform(cax, Quantity = Quantity), vars = c("Quantity"), strata = "Sample")
rub.tab <- CreateTableOne(data = transform(rub, Quantity = Quantity), vars = c("Quantity"), strata = "Sample")
sar.tab <- CreateTableOne(data = transform(sar, Quantity = Quantity), vars = c("Quantity"), strata = "Sample")
sar.tabnn <- CreateTableOne(data = sar, vars = c("Quantity"), strata = "Sample")

