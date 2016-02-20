diamond.data <- read.csv("./diamonds.csv")

head(diamond.data)

diamond.data$Carat_break <- cut(diamond.data$Carat, breaks = (1:12) * 0.1)
carat_table <- with(diamond.data, table(Carat_break, sold))

library(xtable)

mycap <- "Breakdown of whether or not diamond sold by carat category"

colnames(carat_table) <- c("Not sold", "Sold")

xtab <- xtable(carat_table, caption = mycap, label = "tab:carat")

latex_out <- print(xtab, comment = FALSE, caption.placement = "top", include.rownames = TRUE,
                 sanitize.text.function = function(x) {x})

cat(latex_out, file = "table.tex")
