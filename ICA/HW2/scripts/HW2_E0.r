## 1. Cálculo da skewness dos dados originais
previousSkewness = vector("list", length(solTrainX))

for(i in 1:length(solTrainX)) {
  previousSkewness[[i]] = skewness(solTrainX[[i]])
}

previousSkewness = data.frame(previousSkewness)
colnames(previousSkewness) = names(solTrainX)

## 2. Aplicando transformação Yeo-Johnson
ppParams = preProcess(solTrainX, method = "YeoJohnson")
solTrainXtrans = predict(ppParams, solTrainX)
ppParams = preProcess(solTestX, method = "YeoJohnson")
solTestXtrans = predict(ppParams, solTestX)

## 3.1. Cálculo da skewness dos dados transformados
transSkewness = vector("list", length(solTrainXtrans))

for(i in 1:length(solTrainXtrans)) {
  transSkewness[[i]] = skewness(solTrainXtrans[[i]])
}

transSkewness = data.frame(transSkewness)
colnames(transSkewness) = names(solTrainXtrans)

## 3.2. Mostrar a diferença entre previousSkewness e transSkewness no LaTeX
toConvertTex = as.data.frame(previousSkewness[previousSkewness != transSkewness])
toConvertTex$transSkewness = transSkewness[previousSkewness != transSkewness]
colnames(toConvertTex) = c("previousSkewness", "transSkewness")
rownames(toConvertTex) = names(previousSkewness)[which(previousSkewness != transSkewness)]

xtable(toConvertTex)

## 4. Média dos valores absolutos de skewness
mean(abs(previousSkewness[previousSkewness != transSkewness]))
mean(abs(transSkewness[previousSkewness != transSkewness]))

## 5. Plot dos histogramas
par(mfrow = c(2, 2))
nomes = names(solTrainX)

cores = sample(colours(), 20)

for (i in seq(209, 228, 2)) {
  hist(solTrainX[[i]], main=stringi::stri_join("Histograma de ", nomes[i]), xlab=stringi::stri_join("solTrainX[[", nomes[i], "]]"), col = cores[i - 208])
  hist(solTrainX[[i+1]], main=stringi::stri_join("Histograma de ", nomes[i+1]), xlab=stringi::stri_join("solTrainX[[", nomes[i+1], "]]"), col = cores[i - 207])
  hist(solTrainXtrans[[i]], main=stringi::stri_join("Histograma de ", nomes[i]), xlab=stringi::stri_join("solTrainXtrans[[", nomes[i], "]]"), col = cores[i - 208])
  hist(solTrainXtrans[[i+1]], main=stringi::stri_join("Histograma de ", nomes[i+1]), xlab=stringi::stri_join("solTrainXtrans[[", nomes[i+1], "]]"), col = cores[i - 207])
  
  invisible(readline(prompt="Tecle [Enter] para continuar"))
}

## Aplicando center e scale nos dados
ppParams = preProcess(solTrainXtrans, method = c("center", "scale"))
solTrainXtrans = predict(ppParams, solTrainXtrans)
ppParams = preProcess(solTestXtrans, method = c("center", "scale"))
solTestXtrans = predict(ppParams, solTestXtrans)

## Matriz de correlação
par(mfrow = c(1, 1))

trainingData = solTrainXtrans
trainingData$Solubility = solTrainY

corrplot(cor(trainingData[209:229]), order = "hclust", type = "lower", method = "number", number.cex = 0.5)

## Redução de predictors com base na correlação
altaCorr = findCorrelation(cor(trainingData), 0.9)
trainingData = trainingData[-altaCorr]
solTestXtrans = solTestXtrans[-altaCorr]
