credit_data = read.table("https://archive.ics.uci.edu/ml/machine-learning-databases/statlog/german/german.data", header = F)
head(credit_data)

# In R there is no seperate functions fro regression or classification, 
#if the datatype is numeric then the it will perform Regression else Classification

credit_data$V21 = as.factor(credit_data$V21)
levels(credit_data$V21)
table(credit_data$V21)

X = credit_data[1:20]
head(X)
y = credit_data[21]
head(y)

set.seed(12345)
index = sample(x=1:1000,size = 700)
trainset = credit_data[index,]
testset = credit_data[-index,]


library(caret)
library(C50)

model_c50 = C5.0(x = trainset[1:20], y = trainset$V21,metric = 'Kappa',trControl = cntrl)
model_c50
pred_c50 = predict(model_c50, newdata = testset)
pred_c50

cntrl = trainControl(method = 'cv', number = 5, p=0.8,search = 'grid')
model_rpart = train(x = X, y = credit_data$V21,method = 'rpart',metric = 'Kappa',trControl = cntrl)
model_rpart
pred_rpart = predict(model_rpart, newdata = testset)
pred_rpart

model_rf = train(x = X, y = credit_data$V21,method = 'rf',metric = 'Kappa',trControl = cntrl)
model_rf
pred_rf = predict(model_rf,newdata = testset)
pred_rf



pred_df = data.frame(c50= pred_c50, rpart = pred_rpart, rf = pred_rf)
View(pred_df)
X = apply(pred_df,1,table)
X
final_pred = sapply(X, function(x)names(x)[which.max(x)])
final_pred
final_pred = as.factor(final_pred)
confusionMatrix(final_pred, testset$V21)



model_rf_1 = train(x = X, y = credit_data$V21,method = 'rf',
                   metric = 'Kappa',
                   trControl = cntrl, 
                   tuneGrid = expand.grid(mtry= c(3,5,7,9,11,15,20)))
model_rf_1






