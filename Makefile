all: example

paper: example.tex
	pdflatex example && pdflatex example


clean:
	rm -f *.dvi *.aux *.log *.blg *.toc *.bbl *~ *.lof *.lot *.out *.fdb_latexmk *.fls *.synctex.gz *.synctex.gz\(busy\)
