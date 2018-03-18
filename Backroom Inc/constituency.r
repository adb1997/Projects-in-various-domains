csv_file<-read.csv('assig_data.csv')
df1<-data.frame('Year'=csv_file$Year,'Name of Candidate'=csv_file$Name.of.Candidate,'Constituency_name'=csv_file$Constituency_name,'Votes'=csv_file$Votes)
df2<-df1[!(duplicated(df1[c("Name.of.Candidate","Constituency_name")]) | duplicated(df1[c("Name.of.Candidate","Constituency_name")], fromLast = TRUE)), ]
df2 <- df2[order(df2$Name.of.Candidate),]
df2$diff <- ave(df2$Votes, factor(df2$Name.of.Candidate), FUN=function(x) c(NA,diff(x)))
df3<-df2[df2$Name.of.Candidate %in% names(table(df2$Name.of.Candidate))[table(df2$Name.of.Candidate) > 1],]
df4<-df3[complete.cases(df3),]
pos<-nrow(df4[df4$diff>0,])
neg<-nrow(df4[df4$diff<0,]) 

slices <- c(pos,neg) 
lbls <- c("Overall improvement in result", "Overall decrease in result")
pct <- round(slices/sum(slices)*100)
lbls <- paste(lbls, pct) # add percents to labels 
lbls <- paste(lbls,"%",sep="") # ad % to labels 
pie(slices,labels = lbls, col=rainbow(length(lbls)),
    main="Change in constituency of candidate")




