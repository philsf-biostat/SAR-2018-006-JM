source("scripts/input.R")

anova.cax <- aov(data = cax, Quantity ~ Sample)
anova.rub <- aov(data = rub, Quantity ~ Sample)
anova.sar <- aov(data = sar, Quantity ~ Sample) # violação de normalidade
kw.sar <- kruskal.test(data = sar, 10^Quantity ~ factor(Sample))

# Residuals
resid.cax.p <- format.pval(shapiro.test(resid(modelo.cax))$p.value, digits = 2, eps = .001)
resid.rub.p <- format.pval(shapiro.test(resid(modelo.rub))$p.value, digits = 2, eps = .001)
resid.sar.p <- format.pval(shapiro.test(resid(modelo.sar))$p.value, digits = 2, eps = .001)

# modelos mistos (failed attempt)
# lme(Quantity ~ Sample, data = cax, random = ~1 | Sample)
# lme(Quantity ~ Sample, data = rub, random = ~1 | Sample)
# lme(Quantity ~ Sample, data = sar, random = ~1 | Sample)
