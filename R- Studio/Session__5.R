cats = c('A','B','C','D','E')
cat_prob = c(0.15,0.22,0.18,0.35,0.1)
cat_cum_sum = cumsum(cat_prob)
rand_unif_no = runif(n=50000)
series  = ifelse(rand_unif_no<=cat_cum_sum[1],"A",
              ifelse(rand_unif_no<=cat_cum_sum[2],"B",
                  ifelse(rand_unif_no<=cat_cum_sum[3],"C",
                      ifelse(rand_unif_no<=cat_cum_sum[4],"D",'E'))))
series
table(series)/50000

# Applying a function on an iterative element. Won't be much faster than for loop. will get a vector as o/p
#sapply(list, function) 

annealing = read.csv("https://archive.ics.uci.edu/ml/machine-learning-databases/annealing/anneal.data",header = F, na.strings = '?')
head(annealing)
sapply(annealing, class) # Function will be applied on each and every element of the list
View(annealing)
sapply(c(1,4,9,16,25), sqrt)

ins = read.csv("Data Mining and ML/Insurance.csv")
head(ins)
sapply(1:5,function(i)cor(x = ins$income[ins$claim_type == i],y = ins$coverage[ins$claim_type == i]))
# O/P is a list in lapply whereas in sapply we get a vector.
lapply(1:5,function(i)cor(x = ins$income[ins$claim_type == i],y = ins$coverage[ins$claim_type == i]))

# multivariate form of sapply --> mapply
c(1,3,4,10,2,3)*c(4,2,6,3,10,8)

mapply(function(x,y)x*y, c(1,3,4,10,2,3),c(4,2,6,3,10,8))



