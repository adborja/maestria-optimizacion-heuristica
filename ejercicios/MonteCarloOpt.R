# install.packages('mcGlobaloptim')

library(mcGlobaloptim)

esfera <- function(x) {
  x ^ 2
}

plot(esfera, -100, 100, n = 1000, main = "minimizando funcion esfera")
(minfw <- multiStartoptim(objectivefn = esfera,
                          lower = -100,
                          upper = 100,
                          method = 'nlminb',
                          nbtrials = 500,
                          typerunif = "sobol",
                          verb = TRUE))

points(minfw$res$par, minfw$res$objective, pch = 8, lwd = 2, col = "red", cex = 2)

