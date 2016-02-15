all: words.txt
	@echo Build all

clean:
	rm -f words.txt
	@echo Clean all
	
words.txt: /usr/share/dict/words
	cp /usr/share/dict/words words.txt