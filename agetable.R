library("ggplot2")
library("scales")

age.nna <- class1[!is.na(class1$mydat.Age),] # strip data of rows with age=NULL
summary(age.nna$mydat.Age)


qplot(age.nna$mydat.Age, geom="histogram")


# 
# ggplot(age.nna, aes(x=mydat.Age)) +
#   ggtitle("Passenger Age") +
#   xlab("Age") +
#   ylab("Density") +
#   geom_histogram(aes(y=..density..), binwidth=1)+
#   geom_density(alpha=.5, fill="#FFFFFF")