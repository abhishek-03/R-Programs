vec1 = c(-1,2,30,4,50)
1:5
vec2 = seq(1,5,by = 0.005)
vec1 + vec2[1:5]

vec2[3] = 'a' # one of the value has been changed to string so all the values in the vector has been changed to string.
sum(vec2) # The sum cannot be calcualted. Error is thrown.
vec2 = as.numeric(vec2) # On changing the datatype to numeric the places where the data cannot be changed to numeric will be become NA.
head(vec2)
vec4 = na.omit(vec2) # NA values will be omitted
length(vec4)
mat1 = matrix(data=vec4, nrow = 200) # Converting a vector into matrix.
dim(mat1)
mat2 = t(mat1)  #transpose
dim(mat2)
mat3 = matrix(c(mat1))
dim(mat3)
mat3 = matrix(c(mat1),nrow = 100)
dim(mat3)
mat3[,3] # Taking the 3rd column of the matrix. #mat3[,1] = taking first column
mat3[3,] # Taking the 3rd row of the matrix.
df1 = as.data.frame(mat3) # Creating a dataframe from a matrix
df1
colSums(mat3)
rowSums(mat3)
colMeans(mat3)
rowMeans(mat3)

t1 = Sys.time()
for(i in vec2){
  if(i < 10){
    print("False")
  }
  else{
    print("True")
  }
}

t2 = Sys.time()
t2-t1
t3 = Sys.time()
ifelse(test =vec2<10,yes = 'False',no = 'True') 
t4 = Sys.time()
t3-t4

data = read.csv("R/blood.csv",na.strings = '.')

IQR(data$WBC,na.rm = T)
summary(data$WBC)

wbc_cat = ifelse(data$WBC<=6378,1,ifelse(data$WBC<7040,2,ifelse(data$WBC<7716,3,4)))
wbc_cat
table(data$BloodGroup) 
sum(is.na(data$WBC)) # Missing values from one column of a dataset
colSums(is.na(data)) # Check missing values from al the columns of a dataset
