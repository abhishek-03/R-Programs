dummy = function(vec){
  Mean=mean(vec)
  Median = quantile(x=vec,probs = 0.5)
  d = density(vec)
  Mod = d$x[d$y==max(d$y)]
  Std = sd(vec)
  Range = range(vec)
  return(list(Mean= Mean, Median= Median,Mode = Mod,Std= Std, Range=Range))
}

vec = rnorm(10000,30,5)
d = density(vec)
d$x[d$y==max(d$y)]
mean(vec)

output = dummy(vec)
output
vec[10] = 100
vec[1500] = 1

outl = function(vect){
  q1 = quantile(x=vect, 0.25)
  q3 = quantile(x=vect, 0.75)
  IQR = q3 - q1
  upper = q3+(1.5*IQR)
  lower = q1-(1.5*IQR)
  out_cond = vect<lower | vect>upper
  outliers = vect[out_cond]
  return(list(q1= q1,q3= q3,IQR= IQR,upper= upper,lower= lower,outliers = outliers,no = length(outliers)))
}
outl(vec)


airfoil = read.table("https://archive.ics.uci.edu/ml/machine-learning-databases/00291/airfoil_self_noise.dat")

apply(airfoil,2,outl)




library(cluster)
find_clusters_km = function(df,max_clusters=20,scale=F){
  require(cluster)
  if (scale==F){
    df = scale(df)
  }
  S = rep(0,max_clusters)
  for(k in 2:max_clusters){
    fit = kmeans(df,centers = k,iter.max = 1000,nstart = 50)
    s = mean(silhouette(x = fit$cluster,dist = dist(df))[,3])
    S[k] = s
  }
  K=(2:max_clusters)[S==max(S)]
  fit_opt = kmeans(df,centers = K,iter.max = 1000,nstart = 50)
  return(list(clust = fit_opt$cluster,Sil = max(S)))
}

find_clusters_km(airfoil)
dfs = list(df1=iris[,1:4],df2=airfoil)
lapply(dfs, find_clusters_km)