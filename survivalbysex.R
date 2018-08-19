index<-which((!is.na(class1$mydat.Sex) )&(!is.na(mydat$Survived)))
sex<-data.frame(mydat$Survived[index],class1$mydat.Sex[index])
names(sex) <- c("survive ", "sex"); head(sex)

nrow(subset(sex, sex == "female")) 
nrow(subset(sex, sex == "male"))
counts<-table(sex); counts

chisq.test(counts)

women.survived<-counts[2]/(counts[1]+counts[2]);women.survived
men.survived <-counts[4]/(counts[3]+counts[4]);men.survived

