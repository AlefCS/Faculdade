 ## %*{\color[rgb]{0.234,0.5,0.191} Regressão linear comum*)
 # Treino
 # %*{\color[rgb]{0.234,0.5,0.191} Criação do modelo a partir do conjunto de dados*)
 lmFit1 = lm(Solubility ~ ., data = trainingDataFiltered)

 # %*{\color[rgb]{0.234,0.5,0.191} Predição*)
 # A partir do modelo e de um conjunto de entradas
 # %*{\color[rgb]{0.234,0.5,0.191} observadas, iremos tentar predizer qual a saída.*)
 lmPred1 = predict(lmFit1, solTestXtransFiltered)

 # Criando conjunto predicted + observed
 lmPred1.values = data.frame(obs = solTestY, pred = lmPred1)

 # %*{\color[rgb]{0.234,0.5,0.191} Comparação dos valores dos observados e preditos*)
 defaultSummary(lmPred1.values)[c("RMSE", "Rsquared")]

 # Plot - Predicted x Observed
 plot(obs ~ pred,
      data = lmPred1.values,
      col = "turquoise2",
      xlim = c(-10, 2),
      ylim = c(-10, 2),
      xlab = "Predicted", ylab = "Observed",
      main = "OLR: Predicted x Observed")
 grid()
 abline(0, 1, col = "darkgrey", lty = 2)
 
 # Plot - Predicted x Residual
 plot((obs - pred) ~ pred,
      data = lmPred1.values,
      col = "turquoise2",
      xlab = "Predicted", ylab = "Residual",
      main = "OLR: Predicted x Residual")
 grid()
 abline(h = 0, col = "darkgrey", lty = 2)
