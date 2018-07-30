set.seed(1)
mat=matrix(rnorm(n=1000),ncol = 5)
df = as.data.frame(mat)
#names(df) = c('Var1','Var2','Var3','Var4')
names(df) = paste('Var',1:5,sep='')
head(df)
summary(df)
library(psych)
describe(df)
describe(mat)
apply(X=mat,MARGIN = 2,FUN = mean)


lm(df$Var4,df$Var1)
lm(Var4~Var1, data=df)
f = as.formula(paste0('Var4','~','Var1',sep=''))
lm(f,data = df)

apply(df, MARGIN = 2,FUN = IQR)
apply(df, MARGIN = 2,FUN = plot,y=df$Var5)
par(mfrow=c(2,2))

plot(df)

# Double square bracket for list, single for vector.
# Used for storing various outputs for the model

L = list()
L[[1]] = df
L[[2]] = mat

L$Second = mat

C = c()
C[1] = 1

auto = read.csv("https://archive.ics.uci.edu/ml/machine-learning-databases/autos/imports-85.data",header = FALSE, na.strings = '?')
head(auto)

auto_1 = na.omit(auto)
dim(auto_1)
sum(complete.cases(auto))
sum(!complete.cases(auto))
dim(auto)
a = auto[,-2]
dim(a)
auto_1 = na.omit(a)
dim(a)
head(a)
apply(X = a[,c(1,9:13,16,18:24)],MARGIN=2,FUN = cor,y=a$V26,use='pairwise.complete.obs')
head(a[,c(1,9:13,16,18:24)])
