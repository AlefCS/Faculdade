 ## OLR com 10-fold cross validation
 # Cross-Validation
 # %*{\color[rgb]{0.234,0.5,0.191} Criação do objeto de controle que será utilizado:*)
 # 10-fold cross validation
 ctrl = trainControl(method = "cv", number = 10)

 # Treino
 lmFitCV = train(Solubility ~ .,
                 data = trainingData,
                 method = "lm",
                 trControl = ctrl)

 lmFitCV$results[c("RMSE", "Rsquared")]
