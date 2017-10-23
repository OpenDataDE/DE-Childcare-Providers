#a function "is_number" to check if the charactor is a number
is_number<-function(x){
  x=sub(" ","", x)
  !is.na(as.numeric(x))
}

#a function to search and change written number to number
convert_to_number<- function(x){
  x=sub('one','1', x, ignore.case=TRUE)
  x=sub('two','2', x, ignore.case=TRUE)
  x=sub('three','3', x, ignore.case=TRUE)
  x=sub('four','4', x, ignore.case=TRUE)
  x=sub('five','5', x, ignore.case=TRUE)
  x=sub('six','6', x, ignore.case=TRUE)
  x=sub('seven','7', x, ignore.case=TRUE)
  x=sub('eight','8', x, ignore.case=TRUE)
  x=sub('nine','9', x, ignore.case=TRUE)
  x=sub('ten','10', x, ignore.case=TRUE)
  x=sub('eleven','11', x, ignore.case=TRUE)
  x=sub('twelve','12', x, ignore.case=TRUE)
  x=sub('thirteen','13', x, ignore.case=TRUE)
  x
}
