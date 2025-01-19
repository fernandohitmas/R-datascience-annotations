# GREPL and GREP
# GREPL(term2search, text) - returns boolean. only checks if text contains term
# GREP - return all indexes of the elements of the vector that contains
# the term
# important to notice that regex functions are:
# regexpr > gregexpr, regexec > gregexec
text <- 'this is an text'
text.split <- strsplit(text, ' ')
grep('o', unlist(text.split))
