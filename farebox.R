# Boxplot of passenger fare by class 



res<-boxplot(Fare~Pclass,data=mydat, main="Passenger Fare Data", 
             xlab="Passenger class", ylab="Fare",outline=FALSE)


means <- tapply(mydat$Fare,mydat$Pclass,mean)
points(means,col="red",pch=18)

