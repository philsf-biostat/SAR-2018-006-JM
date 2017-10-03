library(data.table)

process.data <- function(dataframe) {
  DT <- data.table(dataframe)
  DT <- transform(DT, Sample = factor(Sample))
  levels(DT$Sample) <- c("bulk mono", "vacina formulada", "vacina liofilizada")
  DT$form <- 0
  DT$liof <- 0
  DT[Sample == "vacina formulada"]$form <- 1
  DT[Sample == "vacina liofilizada"]$liof <- 1
  DT <- transform(DT, form = factor(form), liof = factor(liof))
  DT
}
