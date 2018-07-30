
var1 = c('var1','var5','var19','var17') # Variables in the Train Set
var2 = c('var1','var5','var21','var17') # Variables in the Test Set.

setdiff(var1,var2) # Variable that is present in the Test Set but not in Train Set.

library(stringr)

str1 = "India got independence in 1947"
str_extract(str1,"\\d+")
str_extract_all(str1,"\\d")

#\\d+ - One or more digits from the string


s = "Abc Xyz is having mob number +91-09823-56412. Cde Uvx is having mob number +91-09823-56412. +1-09868-98088 and pin is 831004"
str_extract_all(s,"\\+[0-9]+[-]?[0-9]{5}+[-]?[0-9]{5}+")
str_extract_all(s,"\\+\\d{2}[-]?[0-9]+[-]?[0-9]+")

p1 = "[A-Z][a-z]+ [A-Z][a-z]+"
str_extract_all(s,pattern = p1)

s1 = "My email ids are Zyz2@abc.com, xyz_123@abc.com.in and my mobile no's are 1234567890,9112312456"
str_extract_all(s1,"[A-Za-z0-9._-]+@[A-Za-z0-9.]+")

s2 = "This is a data mining session"
s3 = "This is a data Engineering session"
s3
grep(pattern = 'engineering',x=c(s2,s3),ignore.case = TRUE)
s3 = gsub(pattern = 'engineering','mining', x=s3,ignore.case = TRUE)
s3
