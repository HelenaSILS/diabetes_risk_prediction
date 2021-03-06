if(!require("randomForest")) install.packages("randomForest")
library(randomForest)

dataset1 <- read.csv("diabetes_data_upload.csv", head=TRUE)
head(dataset1)

set.seed(10)
train <- sample(nrow(dataset1), 0.7*nrow(dataset1), replace = FALSE)
trainset <- dataset1[train,]
validset <- dataset1[-train]

dataset1$class = factor(dataset1$class) 
model0 <- randomForest(dataset1$class ~., data = dataset1)
print(model0)
plot(model0)