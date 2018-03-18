dat<-read.csv('assig_data.csv')
yr1999<-dat[dat$Year==1999,]
yr2004<-dat[dat$Year==2004,]
yr2008<-dat[dat$Year==2008,]
yr2013<-dat[dat$Year==2013,]

yr9904<-dat[dat$Year<=2004,]
yr990408<-dat[dat$Year<=2008,]
require(dplyr) 
newin04<-nrow(anti_join(yr2004,yr1999,by="Name.of.Candidate"))
newin04s<-anti_join(yr2004,yr1999,by="Name.of.Candidate")
newin08<-nrow(anti_join(yr2008,yr9904,by="Name.of.Candidate"))
newin08s<-anti_join(yr2008,yr9904,by="Name.of.Candidate")
newin13<-nrow(anti_join(yr2013,yr990408,by="Name.of.Candidate"))
newin13s<-anti_join(yr2013,yr990408,by="Name.of.Candidate")

number_new<-c(newin04,newin08,newin13)
barplot(number_new,main='NUMBER OF NEW CANDIDATES',xlab = 'YEARS',ylab = 'NUMBER OF CANDIDATES',names.arg=c("2004","2008","2013"))



mean_04<-mean(newin04s$Vote.share.percentage)
mean_08<-mean(newin08s$Vote.share.percentage)
mean_13<-mean(newin13s$Vote.share.percentage)
mean_year<-c(mean_04,mean_08,mean_13)
barplot(mean_year,main='AVERAGE % SHARE OF VOTES',xlab = 'YEARS',ylab = "PERCENTAGE",names.arg=c("2004","2008","2013"))


maxn<-data.frame(table(newin04s$Party, useNA="ifany"))
maxin04<-maxn[apply(maxn[c(2)],1,function(z) !any(z==0)),] #number of candidates from each political party
parties<-maxin04[,'Var1']
num_part<-maxin04[,'Freq']
barplot(num_part,main='PARTY WITH MAX CANDIDATES 2004',xlab = 'PARTY',ylab = "NUMBER OF CANDIDATES",names.arg = parties,las=2)




maxn2<-data.frame(table(newin08s$Party, useNA="ifany"))
maxin08<-maxn2[apply(maxn2[c(2)],1,function(z) !any(z==0)),] 
parties08<-maxin08[,'Var1']
num_part08<-maxin08[,'Freq']
barplot(num_part08,main='PARTY WITH MAX CANDIDATES 2008',xlab = 'PARTY',ylab = "NUMBER OF CANDIDATES",names.arg = parties08,las=2)


maxn3<-data.frame(table(newin13s$Party, useNA="ifany"))
maxin13<-maxn3[apply(maxn3[c(2)],1,function(z) !any(z==0)),]
parties13<-maxin13[,'Var1']
num_part13<-maxin13[,'Freq']
barplot(num_part13,main='PARTY WITH MAX CANDIDATES 2013',xlab = 'PARTY',ylab = "NUMBER OF CANDIDATES",names.arg = parties13,las=2)





                 



