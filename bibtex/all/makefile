.PHONY: all short shrink 
SHELL=/bin/bash
BIBTEX8_CMD := bibtex8 --wolfgang --mcites 30000 --mentints 30000 --mentstrs 100000 \
 --mfields 300000 --mstrings 35000 --mpool 750000
BIBTEX	:= $(if $(shell which bibtex8), $(BIBTEX8_CMD), bibtex)

all: makefile $(wildcard *.bib)
	@echo Building biblatex version
	$(MAKE) allbiblatex.pdf
	@echo Building 'plain' bibtex version
	$(MAKE) allbib.pdf

allbib.pdf: allbib.tex all.bib macros-long.bib
	rm -vf allbib.bbl
	pdflatex allbib
	bibtex allbib
	pdflatex allbib
	pdflatex allbib

allbiblatex.pdf: allbiblatex.tex all.bib macros-long.bib
	rm -vf allbiblatex.bbl
	pdflatex allbiblatex
	$(BIBTEX) allbiblatex
	pdflatex allbiblatex
	pdflatex allbiblatex

short: allbib-short.pdf

shrink: allbib-shrink.pdf

allbib-short.pdf: allbib-short.tex all.bib macros-short.bib
	pdflatex allbib-short.tex
	$(BIBTEX) allbib-short
	pdflatex allbib-short.tex
	pdflatex allbib-short.tex

shrink.bib: all.bib allbib-shrink.tex 
	./export_cites.pl -all -shrink -nopages -nomonth allbib-shrink.tex all.bib > shrink.bib

allbib-shrink.pdf: allbib-shrink.tex all.bib macros-short.bib shrink.bib
	pdflatex allbib-shrink.tex
	$(BIBTEX) allbib-shrink
	pdflatex allbib-shrink.tex
	pdflatex allbib-shrink.tex

bib:
	$(BIBTEX) allbib


clean:
	rm -vf *~ *.{aux,bbl,blg,dvi,log,pdf,bcf} shrink.bib
	rm -vf allbiblatex{-blx.bib,.out,.run.xml}
	rm -vf collections.bib *.{cites,html} allbib.bib

# expanded.bib: expand all macros and xrefs in all entries from macros-long.bib + all.bib
expanded.bib: all.bib macros-long.bib
	bib2bib -s 'year' -r --expand --expand-xrefs -ob expanded.bib macros-long.bib all.bib

allbib.html: expanded.bib collections.bib
	bib2bib -s 'year' -r --expand -c 'not ($$type = "PROCEEDINGS" | $$type = "BOOK")' \
		macros-long.bib expanded.bib -ob allbib.bib -oc allbib.cites
	cat collections.bib >> allbib.bib
	bibtex2html -s alpha -citefile allbib.cites allbib.bib

# only @proceedings, @books, etc.
collections.bib: all.bib
	bib2bib -s 'year' -r -c '$$type = "PROCEEDINGS" | $$type = "BOOK"' -ob $@ all.bib

vm.pdf: allbiblatex.tex all.bib makefile
	bib2bib -s 'year' -r -c 'category : "^se-vm\|^pl"' macros-long.bib all.bib > vm.bib
	sed s%\bibliography{all}%\bibliography{vm}% allbiblatex.tex > vm.tex
	pdflatex vm && $(BIBTEX) vm && pdflatex vm && pdflatex vm

# Personal bibliographies in HTML - try 'make Lohmann.html'
%.html: macros-long.bib all.bib
	bib2bib -s 'year' -r --expand --expand-xrefs -c '(author : "$(*F)" or editor : "$(*F)")' \
		macros-long.bib all.bib -ob $(*F).bib -oc $(*F).cites
	bibtex2html -s alpha -citefile $(*F).cites $(*F).bib

# all.bib has no dependencies
all.bib:

# Default rule: interpret goal as author or editor and export an expanded (macro-free) bibliography
# of all matching entries
#
# make Lohmann --> Lohmann.bib
#
%.bib:
	bib2bib -s 'year' -r --expand -c 'author : "$(*F)" or editor : "$(*F)"' -ob $@ macros-long.bib all.bib

%.pdf: %.bib makefile
	sed 's/{all}/{$*}/' allbiblatex.tex > $*.tex
	pdflatex $*
	bibtex $*
	pdflatex $*
	pdflatex $*


.PHONY: all clean short shrink
