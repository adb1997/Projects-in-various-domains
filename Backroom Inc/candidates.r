dat<-read.csv('assig_data.csv')
vals<-data.frame('Year'=csv_file$Year,'Name of Candidate'=csv_file$Name.of.Candidate,'Votesp'=csv_file$Vote.share.percentage)
once<-vals[(duplicated(vals[c("Name.of.Candidate")]) | duplicated(vals[c("Name.of.Candidate")], fromLast = TRUE)), ]
more_than_once<-vals[!(duplicated(vals[c("Name.of.Candidate")]) | duplicated(vals[c("Name.of.Candidate")], fromLast = TRUE)), ]
mean_once<-mean(once$Votesp)
mean_morethan<-mean(more_than_once$Votesp)

if (mean_once>mean_morethan){
  print("Candidates who contested only once enjoyed a higher vote share percentage")
}else{
  print("Candidates who contested more than once enjoyed a higher vote share percentage")
}

vals<-c(mean_once,mean_morethan)
labs<-c('once','more than once')
barplot(vals,main = 'AVERAGE VOTE SHARE PERCENTAGE',xlab = 'no. of times contested',ylab = 'vote share %',names.arg = labs )
