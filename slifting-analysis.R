setwd('/Users/dan/Dropbox/corpus/slifting/')
# Todor: comment out previous line and insert one with your own working directory

verbs = as.vector(read.table('verbs.txt')[,1])
  # type 'verbs' to browse the full list
  # or 'verbs[1:100]' to browse first 100, etc

# show full context of every example involving a particular verb
load = function(verb) {
  read.table(file=paste('verbs/', verb, '.txt', sep=''), header=T, sep='\t')
}

# example
regret = load('regret')
  # no file b/c no examples

said = load('said')
length(said[,1]) # should be 89,676 lines
said[1,] # show first example
said[2,] # show second example


