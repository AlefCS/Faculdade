# Importando bibliotecas necessárias
library(lmridge)
library(caret)
library(xtable)

## Regressão linear penalizada
# Treino
# Criando modelos penalizados
# Valores de lambda variando de 0.01 a 0.1 com passo 0.01
lmFitRidge = lmridge(Solubility ~ ., data = trainingData, K = seq(0.01, 0.1, length.out = 10))

# Predição
# Criando predições para cada um dos modelos que foram
# criados, para os diferentes valores de lambda
lmPredRidge = predict.lmridge(lmFitRidge, solTestXtrans)

# Inicializando uma lista para receber
# os valores de RMSE que serão calculados
rmse = vector("numeric", length(lmFitRidge$K))

# Cálculo dos valores de RMSE
for (i in 1:10) {
  lmRidge.values = data.frame(obs = solTestY, pred = lmPredRidge[, i])
  rmse[i] = defaultSummary(lmRidge.values)["RMSE"]
}

# Pegando índice do menor RMSE, para encontrar
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

## Regressão linear penalizada com cross validation
# Treino
ridgeGrid = data.frame(.lambda = seq(.01, .1, length.out = 10))
set.seed(100) # Necessário para se chegar aos mesmos resultados
ridgeRegFit = train(Solubility ~ .,
                    method = "ridge",
                    data = trainingData,
                    # Valores de penalidade a ser utilizado
                    tuneGrid = ridgeGrid,
                    trControl = ctrl)
# Visualização dos resultados
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
