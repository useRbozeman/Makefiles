logit <- function(p)
{
    if (p < 0 | p > 1)
    {
        stop("proportion must be between 0 and 1")
    }

	log( p / (1 - p) )
}
ilogit <- function(x)
{
	exp(x) / ( 1 + exp(x) )
}


diamond.data <- read.csv("./diamonds.csv")

pdf("./figure.pdf")

plot(jitter(diamond.data$sold, .2) ~ diamond.data$Carat, col = diamond.data$Color, pch = 16, cex = 2)

out <- glm(sold ~ Carat + I(Carat ^ 2) + Color, diamond.data, family = binomial)
cout <- coef(out)

x <- seq(0, 2, .05)

colD <- cbind(1, x, x^2, 0, 0, 0, 0, 0) %*% cout
colE <- cbind(1, x, x^2, 1, 0, 0, 0, 0) %*% cout
colF <- cbind(1, x, x^2, 0, 1, 0, 0, 0) %*% cout
colG <- cbind(1, x, x^2, 0, 0, 1, 0, 0) %*% cout
colH <- cbind(1, x, x^2, 0, 0, 0, 1, 0) %*% cout
colI <- cbind(1, x, x^2, 0, 0, 0, 0, 1) %*% cout

lines(ilogit(colD) ~ x, col = 1, lwd = 2)
lines(ilogit(colE) ~ x, col = 2, lwd = 2)
lines(ilogit(colF) ~ x, col = 3, lwd = 2)
lines(ilogit(colG) ~ x, col = 4, lwd = 2)
lines(ilogit(colH) ~ x, col = 5, lwd = 2)
lines(ilogit(colI) ~ x, col = 6, lwd = 2)

dev.off()
