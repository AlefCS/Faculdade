# Importando bibliotecas necessárias
library(pls)
library(caret)

## PLS
# Treino
plsFit = plsr(Solubility ~ ., data = trainingData)

# Predição
plsPred = predict(plsFit, solTestXtrans, ncomp = 1:plsFit$ncomp)

# Inicializando uma lista para receber
# os valores de RMSE que serão calculados
rmse = vector("numeric", plsFit$ncomp)

# Cálculo dos valores de RMSE
for (i in 1:plsFit$ncomp) {
  plsPred.values = data.frame(obs = solTestY, pred = plsPred[, , i])
  rmse[i] = defaultSummary(plsPred.values)["RMSE"]
}

# Pegando índice do menor RMSE, para encontrar
# o modelo que melhor representa os dados
indexMin = which.min(rmse)

# Atualizando os valores que existiam para que
# contenham apenas os valores do melhor modelo
plsPred = predict(plsFit, solTestXtrans, ncomp = indexMin)
plsPred.values = data.frame(obs = solTestY, pred = plsPred[, 1, 1])
defaultSummary(plsPred.values)[c("RMSE", "Rsquared")]

# Plot - RMSE x #Componentes
plot(1:plsFit$ncomp,
     rmse,
     xlab = "#Componentes",
     ylab = "RMSE",
     col = "darkred",
     pch = 17)
lines(1:plsFit$ncomp, rmse, col = "darkred")
grid()
