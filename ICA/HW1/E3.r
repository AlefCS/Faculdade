library(corrplot)

pairs(Glass[, 1:9], col=Glass$Type)
corrplot(cor(Glass[, 1:9]), order="hclust", type='lower')
