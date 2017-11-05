source("scripts/input.R")

modelo.cax <- lm(data = cax, log10(Quantity) ~ Sample)
modelo.rub <- lm(data = rub, log10(Quantity) ~ Sample)
modelo.sar <- lm(data = sar, log10(Quantity) ~ Sample)

summary(modelo.cax)
summary(modelo.rub)
summary(modelo.sar)

anova.cax <- aov(data = cax, log10(Quantity) ~ Sample)
anova.rub <- aov(data = rub, log10(Quantity) ~ Sample)
anova.sar <- aov(data = sar, log10(Quantity) ~ Sample) # violação de normalidade
kw.sar <- kruskal.test(data = sar, Quantity ~ factor(Sample))

# Residuals
resid.cax.p <- format.pval(shapiro.test(resid(modelo.cax))$p.value, digits = 2, eps = .001)
resid.rub.p <- format.pval(shapiro.test(resid(modelo.rub))$p.value, digits = 2, eps = .001)
resid.sar.p <- format.pval(shapiro.test(resid(modelo.sar))$p.value, digits = 2, eps = .001)

# modelos mistos (failed attempt)
# lme(log10(Quantity) ~ Sample, data = cax, random = ~1 | Sample)
# lme(log10(Quantity) ~ Sample, data = rub, random = ~1 | Sample)
# lme(log10(Quantity) ~ Sample, data = sar, random = ~1 | Sample)
