all: words.txt
	@echo Build all

clean:
	rm -f words.txt
	@echo Clean all
	
words.txt:
	Rscript -e 'download.file("http://svnweb.freebsd.org/base/head/share/dict/web2?view=co", destfile = "words.txt", quiet = TRUE)'