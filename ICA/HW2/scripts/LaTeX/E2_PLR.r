 ## %*{\color[rgb]{0.234,0.5,0.191} Regressão linear penalizada*)
 # Treino
 # Criando modelos penalizados
 # Valores de lambda variando de 0.01 a 0.1 com passo 0.01
 lmFitRidge = lmridge(Solubility ~ ., data = trainingData, K = seq(0.01, 0.1, 0.01))
 
 # %*{\color[rgb]{0.234,0.5,0.191} Predição*)
 # %*{\color[rgb]{0.234,0.5,0.191} Criando predições para cada um dos modelos que foram*)
 # criados, para os diferentes valores de lambda
 lmPredRidge = predict.lmridge(lmFitRidge, solTestXtrans)
 
 # Inicializando uma lista para receber
 # %*{\color[rgb]{0.234,0.5,0.191} os valores de RMSE que serão calculados*)
 rmse = vector("numeric", length(lmFitRidge$K))
 
 # %*{\color[rgb]{0.234,0.5,0.191} Cálculo dos valores de RMSE*)
 for (i in 1:10) {
   lmRidge.values = data.frame(obs = solTestY, pred = lmPredRidge[, i])
   rmse[i] = defaultSummary(lmRidge.values)["RMSE"]
 }
 
 # %*{\color[rgb]{0.234,0.5,0.191} Pegando índice do menor RMSE, para encontrar*)
 # o modelo que melhor representa os dados
 indexMin = which.min(rmse)
 
 # Atualizando os valores que existiam para que
 # contenham apenas os valores do melhor modelo
 lmRidge.values = data.frame(obs = solTestY, pred = lmPredRidge[, indexMin])
 lmFitRidge$coef = lmFitRidge$coef[, indexMin]
 lmFitRidge$rfit = lmFitRidge$rfit[, indexMin]
 lmPredRidge = lmPredRidge[, indexMin]
 defaultSummary(lmRidge.values)[c("RMSE", "Rsquared")]
 
 # Plot - RMSE x lambda
 plot(lmFitRidge$K, rmse,
      xlab = expression(lambda),
      ylab = "RMSE",
      col = "darkred",
      pch = 17)
 lines(lmFitRidge$K, rmse, col = "darkred")
 grid()
 
 # Plot - Predicted x Observed
 plot(obs ~ pred,
      data = lmRidge.values,
      col = "turquoise2",
      xlim = c(-10, 2),
      ylim = c(-10, 2),
      xlab = "Predicted", ylab = "Observed")
 grid()
 abline(0, 1, col = "darkgrey", lty = 2)
 
 # Plot - Predicted x Residual
 plot((obs - pred) ~ pred,
      data = lmRidge.values,
      col = "turquoise2",
      xlab = "Predicted", ylab = "Residual")
 grid()
 abline(h = 0, col = "darkgrey", lty = 2)
