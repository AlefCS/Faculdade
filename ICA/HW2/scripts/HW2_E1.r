## Regressão linear comum
# Treino
# Criação do modelo a partir do conjunto de dados
lmFit1 = lm(Solubility ~ ., data = trainingData)

# Predição
# A partir do modelo e de um conjunto de entradas
# observadas, iremos tentar predizer qual a saída.
lmPred1 = predict(lmFit1, solTestXtrans)

# Criando conjunto predicted + observed
lmPred1.values = data.frame(obs = solTestY, pred = lmPred1)

# Comparação dos valores dos observados e preditos
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

## OLR com 10-fold cross validation
# Cross-Validation
# Criação do objeto de controle que será utilizado:
# 10-fold cross validation
ctrl = trainControl(method = "cv", number = 10)

# Treino
set.seed(100)
lmFitCV = train(Solubility ~ .,
                data = trainingData,
                method = "lm",
                trControl = ctrl)

lmFitCV$results[c("RMSE", "Rsquared")]
