all: report.html
	@echo Build all

clean:
	rm -f words.txt histogram.tsv histogram.png report.html
	@echo Clean all
	
words.txt: /usr/share/dict/words
	cp /usr/share/dict/words words.txt
	
histogram.tsv: histogram.r words.txt
	Rscript $<

histogram.png: histogram.tsv
	Rscript -e 'library(ggplot2); qplot(Length, Freq, data=read.delim("$<")); ggsave("$@")'
	rm Rplots.pdf

report.html: report.rmd histogram.tsv histogram.png
	Rscript -e 'Sys.setenv(RSTUDIO_PANDOC="/Applications/RStudio.app/Contents/MacOS/pandoc"); rmarkdown::render("$<")'