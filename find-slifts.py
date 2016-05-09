import gzip, re, sys
from os import listdir
from os.path import isfile, join

def fix(s):
	return s.replace('\n', ' ').replace('\t',' ')

mypath = '/afs/ir.stanford.edu/data/linguistic-data/mnt/mnt47/EnglishGigaword-3_2/data/nyt_eng/'
results_file_name = 'slifting'

#search_pattern = re.compile('(<P>.*?</P>)(<P>.*?(?:l|L)ikely.*?</P>)(<P>.*?</P>)')

pattern = re.compile(", (:?I|you|he|she|it|we|they) [^ ]*?,")

filenames = [f for f in listdir(mypath) if isfile(join(mypath, f))]
results = open('/afs/ir.stanford.edu/users/d/a/danlass/corpus/' + results_file_name + '.txt', 'w')

#filenames = ['/Users/dan/Dropbox/corpus/linguistic-data/nyt_eng_200412.gz']	
#results = open('/Users/dan/Dropbox/corpus/slifting/' + results_file_name + '-TST.tsv', 'w')

results.write('match\tcontext\tfilename\n')

for filename in filenames:
	f = gzip.open(mypath + filename, 'rb')
	file_content = fix(f.read()).split('<P>')
	f.close()
	for i in xrange(len(file_content)):
		found = pattern.search(file_content[i])
		if found:
			results.write(fix(found.group(0)) + '\t' + fix(file_content[i]) + '\t' + filename + '\n')

results.close()