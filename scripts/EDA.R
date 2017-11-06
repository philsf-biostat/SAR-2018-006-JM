source("scripts/modelos.R")

par(mfrow = c(2,2))
plot(modelo.cax)
plot(modelo.rub)
plot(modelo.sar)

png("teste.png", 900,400)
par(mfrow = c(1,3))
with(cax, boxplot(Quantity ~ Sample))
title(sub = "CAX")
with(rub, boxplot(Quantity ~ Sample))
title(sub = "RUB")
with(sar, boxplot(Quantity ~ Sample))
title(sub = "SAR")
dev.off()

png("teste2.png", 900, 400)
par(mfrow = c(1,3))
with(cax[Sample == "vacina liofilizada"], hist(log10(Quantity)))
title(sub = "CAX lio")
with(rub[Sample == "vacina formulada"], hist(log10(Quantity)))
title(sub = "RUB form")
with(sar[Sample == "vacina formulada"], hist(log10(Quantity)))
title(sub = "SAR form")
dev.off()

png("teste3.png", 900, 900)
par(mfrow = c(3,3))
with(cax, by(Quantity, Sample, function(x) {qqnorm(x, main = "CAX"); qqline(x)}))
with(rub, by(Quantity, Sample, function(x) {qqnorm(x, main = "RUB"); qqline(x)}))
with(sar, by(Quantity, Sample, function(x) {qqnorm(x, main = "SAR"); qqline(x)}))
dev.off()

library(ggplot2)
# ggplot(cax, aes(Sample, Quantity)) +
  # scale_y_log10() +
ggplot(cax, aes(Sample, log10(Quantity))) +
  geom_point(alpha = .4) +
  ggtitle("Mumps")
# ggplot(rub, aes(Sample, Quantity)) +
  # scale_y_log10() +
ggplot(rub, aes(Sample, log10(Quantity))) +
  geom_point(alpha = .4) +
  ggtitle("Rubella")
# ggplot(sar, aes(Sample, Quantity)) +
  # scale_y_log10() +
ggplot(sar, aes(Sample, log10(Quantity))) +
  geom_point(alpha = .4) +
  ggtitle("Measles")

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
with(cax, leveneTest(Quantity ~ Sample))
with(rub, leveneTest(Quantity ~ Sample))
with(sar, leveneTest(Quantity ~ Sample))

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

