csv_file<-read.csv('assig_data.csv')
all_values<-data.frame('Year'=csv_file$Year,'Name of Candidate'=csv_file$Name.of.Candidate,'Party'=csv_file$Party,'Votes'=csv_file$Votes)
remove_dupl<-all_values[!(duplicated(all_values[c("Name.of.Candidate","Party")]) | duplicated(all_values[c("Name.of.Candidate","Party")], fromLast = TRUE)), ]
remove_dupl <- remove_dupl[order(remove_dupl$Name.of.Candidate),]
remove_dupl$diff <- ave(remove_dupl$Votes, factor(remove_dupl$Name.of.Candidate), FUN=function(x) c(NA,diff(x)))
df3<-remove_dupl[remove_dupl$Name.of.Candidate %in% names(table(remove_dupl$Name.of.Candidate))[table(remove_dupl$Name.of.Candidate) > 1],]
df4<-df3[complete.cases(df3),]
pos<-nrow(df4[df4$diff>0,])
neg<-nrow(df4[df4$diff<0,]) 

slices <- c(pos,neg) 
lbls <- c("Overall increase in votes", "Overall decrease in votes")
pct <- round(slices/sum(slices)*100)
lbls <- paste(lbls, pct) # add percents to labels 
lbls <- paste(lbls,"%",sep="") # ad % to labels 
pie(slices,labels = lbls, col=rainbow(length(lbls)),
    main="Change in political party of candidate")

