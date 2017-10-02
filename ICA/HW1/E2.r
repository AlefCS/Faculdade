library(mlbench)
library(e1071)
data("Glass")

par(mfrow = c(3, 3))

for (i in as.numeric(levels(Glass$Type))) {
  for (j in names(Glass[-10])) {
    hist(Glass[as.character(Glass$Type)==i, j], main=stringi::stri_join("Histograma de ", j, "|", i), xlab=stringi::stri_join("Glass[[", j, "]]"), col=colours()[i*90])
  }
  invisible(readline(prompt="Tecle [Enter] para continuar"))
}

meanD = data.frame()
for (i in levels(Glass$Type)) {
  aux = data.frame(list(RI=mean(Glass[as.character(Glass$Type)==i, "RI"]),
                        Na=mean(Glass[as.character(Glass$Type)==i, "Na"]),
                        Mg=mean(Glass[as.character(Glass$Type)==i, "Mg"]),
                        Al=mean(Glass[as.character(Glass$Type)==i, "Al"]),
                        Si=mean(Glass[as.character(Glass$Type)==i, "Si"]),
                        K =mean(Glass[as.character(Glass$Type)==i, "K" ]),
                        Ca=mean(Glass[as.character(Glass$Type)==i, "Ca"]),
                        Ba=mean(Glass[as.character(Glass$Type)==i, "Ba"]),
                        Fe=mean(Glass[as.character(Glass$Type)==i, "Fe"])))
  meanD = rbind(meanD, aux)
}
rownames(meanD) <- c("Tipo 1", "Tipo 2", "Tipo 3", "Tipo 5", "Tipo 6", "Tipo 7")

sdD = data.frame()
for (i in levels(Glass$Type)) {
  aux = data.frame(list(RI=sd(Glass[as.character(Glass$Type)==i, "RI"]),
                        Na=sd(Glass[as.character(Glass$Type)==i, "Na"]),
                        Mg=sd(Glass[as.character(Glass$Type)==i, "Mg"]),
                        Al=sd(Glass[as.character(Glass$Type)==i, "Al"]),
                        Si=sd(Glass[as.character(Glass$Type)==i, "Si"]),
                        K =sd(Glass[as.character(Glass$Type)==i, "K" ]),
                        Ca=sd(Glass[as.character(Glass$Type)==i, "Ca"]),
                        Ba=sd(Glass[as.character(Glass$Type)==i, "Ba"]),
                        Fe=sd(Glass[as.character(Glass$Type)==i, "Fe"])))
  sdD = rbind(sdD, aux)
}
rownames(sdD) <- c("Tipo 1", "Tipo 2", "Tipo 3", "Tipo 5", "Tipo 6", "Tipo 7")

skewnessD = data.frame()
for (i in levels(Glass$Type)) {
  aux = data.frame(list(RI=skewness(Glass[as.character(Glass$Type)==i, "RI"]),
                        Na=skewness(Glass[as.character(Glass$Type)==i, "Na"]),
                        Mg=skewness(Glass[as.character(Glass$Type)==i, "Mg"]),
                        Al=skewness(Glass[as.character(Glass$Type)==i, "Al"]),
                        Si=skewness(Glass[as.character(Glass$Type)==i, "Si"]),
                        K =skewness(Glass[as.character(Glass$Type)==i, "K" ]),
                        Ca=skewness(Glass[as.character(Glass$Type)==i, "Ca"]),
                        Ba=skewness(Glass[as.character(Glass$Type)==i, "Ba"]),
                        Fe=skewness(Glass[as.character(Glass$Type)==i, "Fe"])))
  skewnessD = rbind(skewnessD, aux)
}
rownames(skewnessD) <- c("Tipo 1", "Tipo 2", "Tipo 3", "Tipo 5", "Tipo 6", "Tipo 7")

meanD; sdD; skewnessD
