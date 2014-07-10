SHELL=/bin/bash

LATEXMK=TEXINPUTS="$(TEXINPUTS)" latexmk -e "\$$pdflatex='lualatex -shell-escape %O %S'"
LATEXMK_NONSTOP=TEXINPUTS="$(TEXINPUTS)" latexmk -e "\$$pdflatex='lualatex -interaction=nonstopmode -shell-escape %O %S'"
FILENAME=vortrag
RM=rm -f

.PHONY: all clean distclean continuous up

all: $(FILENAME).pdf

%.pdf: %.tex
	$(LATEXMK) -pdf $<

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

clean:
	-$(LATEXMK) -c $(FILENAME).tex

distclean:: clean
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
		$(FILENAME).nav \
		$(FILENAME).pyg \
		$(FILENAME).snm \
		$(FILENAME).tdo
