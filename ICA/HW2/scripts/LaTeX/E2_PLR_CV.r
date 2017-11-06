 ## %*{\color[rgb]{0.234,0.5,0.191} Regressão linear penalizada com cross validation*)
 # Treino
 ridgeGrid = data.frame(.lambda = seq(.01, .1, length.out = 10))
 set.seed(100)
 ridgeRegFit = train(Solubility ~ .,
                     method = "ridge",
                     data = trainingData,
                     # Valores de penalidade a ser utilizado
                     tuneGrid = ridgeGrid,
                     trControl = ctrl)
 # %*{\color[rgb]{0.234,0.5,0.191} Visualização dos resultados*)
 ridgeRegFit
 
 # Plot - RMSE x lambda
 plot(ridgeGrid$.lambda,
      ridgeRegFit$results$RMSE,
      xlab = expression(lambda),
      ylab = "RMSE",
      col = "darkred",
      pch = 17)
 lines(ridgeGrid$.lambda, ridgeRegFit$results$RMSE, col = "darkred")
 grid()
 
 # Gerar tabela, em LaTeX, com diversos valores
 # de RMSE e R^2 para cada valor de lambda
 xtable(ridgeRegFit$results[c("lambda","RMSE", "Rsquared")],
        digits = c(1, 2, 4, 4))
 
