source("scripts/modelos.R")

par(mfrow = c(2,2))
plot(modelo.cax)
plot(modelo.rub)
plot(modelo.sar)

png("teste.png", 900,400)
par(mfrow = c(1,3))
with(cax, boxplot(log10(Quantity) ~ Sample))
title(sub = "CAX")
with(rub, boxplot(log10(Quantity) ~ Sample))
title(sub = "RUB")
with(sar, boxplot(log10(Quantity) ~ Sample))
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
with(cax, by(log10(Quantity), Sample, function(x) {qqnorm(x, main = "CAX"); qqline(x)}))
with(rub, by(log10(Quantity), Sample, function(x) {qqnorm(x, main = "RUB"); qqline(x)}))
with(sar, by(log10(Quantity), Sample, function(x) {qqnorm(x, main = "SAR"); qqline(x)}))
dev.off()

library(ggplot2)
ggplot(cax, aes(Sample, Quantity)) +
  scale_y_log10() +
  geom_point(alpha = .4)
ggplot(rub, aes(Sample, Quantity)) +
  scale_y_log10() +
  geom_point(alpha = .4)
ggplot(sar, aes(Sample, Quantity)) +
  scale_y_log10() +
  geom_point(alpha = .4)

## Normality
cax[, .(Shapiro.pv = shapiro.test(log10(Quantity))$p.value, Significant = shapiro.test(log10(Quantity))$p.value < .05), by = Sample]
rub[, .(Shapiro.pv = shapiro.test(log10(Quantity))$p.value, Significant = shapiro.test(log10(Quantity))$p.value < .05), by = Sample]
sar[, .(Shapiro.pv = shapiro.test(log10(Quantity))$p.value, Significant = shapiro.test(log10(Quantity))$p.value < .05), by = Sample]

library(psych)
with(cax, describeBy(log10(Quantity), Sample))
with(rub, describeBy(log10(Quantity), Sample))
with(sar, describeBy(log10(Quantity), Sample))

cax.tab <- CreateTableOne(data = transform(cax, Quantity = log10(Quantity)), vars = c("Quantity"), strata = "Sample")
rub.tab <- CreateTableOne(data = transform(rub, Quantity = log10(Quantity)), vars = c("Quantity"), strata = "Sample")
sar.tab <- CreateTableOne(data = transform(sar, Quantity = log10(Quantity)), vars = c("Quantity"), strata = "Sample")
sar.tabnn <- CreateTableOne(data = sar, vars = c("Quantity"), strata = "Sample")

