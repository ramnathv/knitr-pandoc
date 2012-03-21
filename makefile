# Makefile to produce pdf and html output using `knitr` and `pandoc`

PANDOC := ~/.cabal/bin/pandoc

SRC  := source.md
HTML := doc.html
PDF  := doc.pdf

all : html pdf
html: $(HTML)
pdf : $(PDF)


$(PDF): $(SRC) makefile
	Rscript \
	  -e "library(knitr)" \
	  -e "opts_chunk[['set']](dev = 'pdf')" \
	  -e "pat_gfm()" \
	  -e "knit('$<', 'temp.md')"
	$(PANDOC) temp.md -o $@
	rm temp.md

$(HTML): $(SRC) makefile
	Rscript \
	  -e "library(knitr)" \
	  -e "opts_chunk[['set']](dev = 'png')" \
	  -e "pat_gfm()" \
	  -e "knit('$<', 'temp.md')"
	$(PANDOC) temp.md -s -o $@
	rm temp.md
