library(data.table)

process.data <- function(dataframe) {
  DT <- data.table(dataframe)
  DT <- transform(DT, Quantity = log10(Quantity), Sample = factor(Sample))
  levels(DT$Sample) <- c("bulk mono", "vacina formulada", "vacina liofilizada")
  DT
}
