library(mlbench)
library(e1071)
data("Glass")

par(mfrow = c(3, 3))

for (i in names(Glass[-10])) {
  hist(Glass[[i]], main=stringi::stri_join("Histograma de ", i), xlab=stringi::stri_join("Glass[[", i, "]]"))
}

meanD = list(RI=mean(Glass$RI),
             Na=mean(Glass$Na), Mg=mean(Glass$Mg), Al=mean(Glass$Al), Si=mean(Glass$Si),
             K=mean(Glass$K), Ca=mean(Glass$Ca), Ba=mean(Glass$Ba), Fe=mean(Glass$Fe))
meanD = data.frame(meanD)

sdD = list(RI=sd(Glass$RI),
           Na=sd(Glass$Na), Mg=sd(Glass$Mg), Al=sd(Glass$Al), Si=sd(Glass$Si),
           K=sd(Glass$K), Ca=sd(Glass$Ca), Ba=sd(Glass$Ba), Fe=sd(Glass$Fe))
sdD = data.frame(sdD)

skewnessD = list(RI=skewness(Glass$RI),
                 Na=skewness(Glass$Na), Mg=skewness(Glass$Mg), Al=skewness(Glass$Al), Si=skewness(Glass$Si),
                 K=skewness(Glass$K), Ca=skewness(Glass$Ca), Ba=skewness(Glass$Ba), Fe=skewness(Glass$Fe))
skewnessD = data.frame(skewnessD)

meanD
sdD
skewnessD
