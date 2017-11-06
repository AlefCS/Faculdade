plsFit = plsr(Solubility ~ ., data = trainingData)

plsPred = predict(plsFit, solTestXtrans, ncomp = 1:ncol(trainingData) - 1)

set.seed(100) ## COMENTAR ALGO NO DOCUMENTO
plsTune = train(Solubility ~ .,
                data = trainingData,
                method = "pls",
                tuneLength = ncol(trainingData) - 1)
