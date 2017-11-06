source("scripts/input.R")

# analysis code -----------------------------------------------------------

# Levene
library(car)
leveneTest(Quantity ~ Sample, center = mean, data = sar) # Measles
leveneTest(Quantity ~ Sample, center = mean, data = cax) # Mumps
leveneTest(Quantity ~ Sample, center = mean, data = rub) # Rubella

# Welch ANOVA
oneway.test(Quantity ~ Sample, var.equal = F, data = sar) # Measles
oneway.test(Quantity ~ Sample, var.equal = F, data = cax) # Mumps
oneway.test(Quantity ~ Sample, var.equal = F, data = rub) # Rubella

# UserFriendlyScience
library(userfriendlyscience)
with(sar, oneway(Quantity, Sample, levene = T, corrections = T, posthoc = "games-howell", etasq = F, digits = 4)) # Measles
with(cax, oneway(Quantity, Sample, levene = T, corrections = T, posthoc = "games-howell", etasq = F, digits = 4)) # Mumps
with(rub, oneway(Quantity, Sample, levene = T, corrections = T, posthoc = "games-howell", etasq = F, digits = 4)) # Rubella

library(ggplot2)
ggplot(virs, aes(Sample, Quantity)) +
  # geom_boxplot() +
  geom_point(alpha = .25) +
  xlab("") + ylab("Copies/PCR (log10)") +
  ylim(c(0,10)) +
  # ggtitle("Potency") +
  # theme(legend.position = "bottom", legend.title = element_blank()) +
  facet_wrap(~ Virus)
ggsave("figures/potency.png", width = 7, height = 7)


# obsolete ----------------------------------------------------------------

# anova.cax <- aov(data = cax, Quantity ~ Sample)
# anova.rub <- aov(data = rub, Quantity ~ Sample)
# anova.sar <- aov(data = sar, Quantity ~ Sample) # violação de normalidade
# kw.sar <- kruskal.test(data = sar, 10^Quantity ~ factor(Sample))

# Residuals
# resid.cax.p <- format.pval(shapiro.test(resid(anova.cax))$p.value, digits = 2, eps = .001)
# resid.rub.p <- format.pval(shapiro.test(resid(anova.rub))$p.value, digits = 2, eps = .001)
# resid.sar.p <- format.pval(shapiro.test(resid(anova.sar))$p.value, digits = 2, eps = .001)

# TukeyHSD(anova.cax)
# TukeyHSD(anova.rub)
# TukeyHSD(anova.sar)

# with(cax, pairwise.t.test(Quantity, Sample, p.adjust.method = "bonf"))
# with(rub, pairwise.t.test(Quantity, Sample, p.adjust.method = "bonf"))
# with(sar, pairwise.wilcox.test(10^Quantity, Sample, p.adjust.method = "bonf"))

# modelos mistos (failed attempt)
# lme(Quantity ~ Sample, data = cax, random = ~1 | Sample)
# lme(Quantity ~ Sample, data = rub, random = ~1 | Sample)
# lme(Quantity ~ Sample, data = sar, random = ~1 | Sample)
