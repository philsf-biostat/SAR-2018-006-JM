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
