SHELL=/bin/bash

# Search for LaTeX packages in the current directory, too – we need that for an
# updated version of tcolorbox.
TEXINPUTS=./texmf//:
LATEXMK=TEXINPUTS="$(TEXINPUTS)" latexmk -e "\$$pdflatex='lualatex -shell-escape %O %S'"
LATEXMK_NONSTOP=TEXINPUTS="$(TEXINPUTS)" latexmk -e "\$$pdflatex='lualatex -interaction=nonstopmode -shell-escape %O %S'"
MAKEGLOSSARIES=makeglossaries

RM=rm -f

FILENAME=MA

TEXES=$(wildcard *.tex)
CHAPTER_TEXES=$(wildcard chapters/*.tex)
BIBS=$(wildcard bibtex/*.bib)

.PHONY: all continuous edit clean distclean

all: $(FILENAME).pdf

$(FILENAME).pdf: $(TEXES) $(CHAPTER_TEXES) $(BIBS)
	$(LATEXMK) -pdf $(FILENAME).tex
	$(MAKEGLOSSARIES) $(FILENAME)
	$(MAKEGLOSSARIES) $(FILENAME)
	$(LATEXMK) -pdf $(FILENAME).tex

continuous:
ifneq ($(shell which inotifywait),)
	inotifywait -e close_write -r -m --format='%w%f' . | \
		while read file; do \
			[[ $$file =~ ^.*\.(tex|bib)$$ ]] && \
			echo "$$file changed" && \
			$(LATEXMK_NONSTOP) -pdf $(FILENAME).tex \
		; done
else
	$(LATEXMK_NONSTOP) -pdf -pvc $(FILENAME).tex
endif

edit:
	$$EDITOR $(TEXES) $(wildcard chapters/*.tex) bibtex/bib.bib

clean:
	$(LATEXMK) -c $(FILENAME).tex

distclean:
	-$(LATEXMK) -C $(FILENAME).tex
	$(RM) \
		$(FILENAME).pdf \
		$(FILENAME).acn \
		$(FILENAME).acr \
		$(FILENAME).alg \
		$(FILENAME).bbl \
		$(FILENAME).glg \
		$(FILENAME).glo \
		$(FILENAME).gls \
		$(FILENAME).ist \
		$(FILENAME).listing \
		$(FILENAME).loa \
		$(FILENAME).lol \
		$(FILENAME).mls \
		$(FILENAME).pyg \
		$(FILENAME).tdo
