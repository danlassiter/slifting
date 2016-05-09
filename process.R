#
# process the files into manageable sizes. should not need to run again!  
#

setwd('/Users/dan/Dropbox/corpus/slifting/')
d=read.csv('slifting-exx.txt', sep='\t', header=T)

slift = function(s) substr(as.character(s), 3, (nchar(as.character(s))-1))
d$possibleSlift = factor(sapply(d$match, FUN=slift))

d$pronoun = factor(sapply(d$possibleSlift, FUN=function(s) strsplit(as.character(s), ' ')[[1]][1]))
d$verb = factor(sapply(d$possibleSlift, FUN=function(s) strsplit(as.character(s), ' ')[[1]][2]))
d$verb = factor(sapply(d$verb, FUN=function (s) tolower(gsub("/", "-", s))))

length(levels(d$verb))

d = d[,-1]
d = d[,-3]
d = d[,c(3,4,1,2)]
colnames(d)

# write to file by verb
verbs = levels(d$verb)
for (i in 1:length(verbs)) {
  ld = subset(d, verb==verbs[i])
  write.table(ld, file=paste('verbs/', verbs[i], '.txt', sep=''), sep='\t')
}

write.table(verbs, file='verbs.txt')

rm(d)