 ## OLR com 10-fold cross validation
 # Cross-Validation
 # %*{\color[rgb]{0.234,0.5,0.191} Criação do objeto de controle que será utilizado:*)
 # 10-fold cross validation
 ctrl = trainControl(method = "cv", number = 10)

 # Treino
 set.seed(100) # %*{\color[rgb]{0.234,0.5,0.191} Necessário para se chegar aos mesmos resultados*)
 lmFitCV = train(Solubility ~ .,
                 data = trainingDataFiltered,
                 method = "lm",
                 trControl = ctrl)

 lmFitCV$results[c("RMSE", "Rsquared")]
