require(pdftools)
require(textreuse)

files <- list.files(pattern = "pdf$") #get a list of the pdf files in the project directory

#Convert each pdf to a text file
for (i in files){
  text = pdf_text(i)
  write(text, file = paste(i, ".txt", sep = ""))
}

paths = list.files(pattern = "txt$") #get a list of the text files
corpus <- TextReuseCorpus(paths = paths) #convert the text files to a corpus

compare = pairwise_compare(corpus, f= jaccard_similarity) #compare the documents

