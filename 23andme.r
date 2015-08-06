#!/usr/bin/env python
#
# Author Dario Clavijo 2015
# GPLv3

histogram_bybase <- function(filename){
	# This function reads a 23andme text colum separated file and 
	# plots an histogram of dna base pairs 
	# input: filename	
	# output: base pair freq

	gens <- read.table(filename,na.strings ='--')
	gens <- gens[,4]
	gens <- gens[!is.na(gens)]
	basepairfreq <- table(gens)

	print(u)
	barplot(basepairfreq, main=paste('Histogram by base:',filename))
	basepairfreq
}

histogram_bygen <- function(filename,genids){
	# This function reads a 23andme text colum separated file and 
        # plots an histogram of count(dna base pairs) of each gen
        # input: filename, list of gens to check       
        # output: gen count 

	gens <- read.table(filename,na.strings ='--')
	gens <- gens[complete.cases(gens),]
	basecount <- vector()	

	for (genid in genids) {
		gendata <- gens[gens[,2] == genid,]
		basecount <- c(basecount,nrow(gendata))
	}

	names(basecount) <- genids
	print(basecount)
	print(length(basecount))

	barplot(cr,main=paste('Histogram by gen:',filename))
	basecount
}

