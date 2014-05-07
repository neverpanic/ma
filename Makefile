SHELL=/bin/bash
LATEXMK=latexmk
MAKEGLOSSARIES=makeglossaries

RM=rm -f

FILENAME="MA"

TEXES=$(wildcard *.tex)
CHAPTER_TEXES=$(wildcard chapters/*.tex)
BIBS=$(wildcard bibtex/*.bib)

all: $(FILENAME).pdf

$(FILENAME).pdf: $(TEXES) $(CHAPTER_TEXES) $(BIBS)
	$(LATEXMK) -e "\$$pdflatex='lualatex -shell-escape %O %S'" -pdf $(FILENAME).tex
	$(MAKEGLOSSARIES) $(FILENAME)
	$(MAKEGLOSSARIES) $(FILENAME)
	$(LATEXMK) -e "\$$pdflatex='lualatex -shell-escape %O %S'" -pdf $(FILENAME).tex

continuous:
	inotifywait -e close_write -r -m --format='%w%f' . | while read file; do [[ $$file =~ ^.*\.(tex|bib)$$ ]] && echo "$$file changed" && $(LATEXMK) -e "\$$pdflatex='lualatex -interaction=nonstopmode -shell-escape %O %S'" -pdf $(FILENAME).tex; done

edit:
	$$EDITOR -p $(TEXES) $(wildcard chapters/*.tex) bibtex/bib.bib

clean:
	$(LATEXMK) -c $(FILENAME).tex

distclean:
	-$(LATEXMK) -C $(FILENAME).tex
	$(RM) $(FILENAME).pdf $(FILENAME).acn $(FILENAME).bbl $(FILENAME).glo $(FILENAME).ist $(FILENAME).loa $(FILENAME).lol $(FILENAME).tdo

.PHONY: all clean distclean continuous edit
