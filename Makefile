all: report.pdf

report.pdf: report.tex table.tex figure.pdf
	texi2pdf report.tex

report.tex: report.md
	pandoc report.md -s -t latex -o report.tex

report.md: report.Rmd count.txt
	Rscript -e "library(knitr); knit(\"report.Rmd\")"

countnumbers: count.cpp
	g++ count.cpp -o countnumbers

count.txt: countnumbers num.txt
	./countnumbers num.txt

figure.pdf: make_figure.R
	Rscript -e "source(\"make_figure.R\")"

table.tex: make_table.R
	Rscript -e "source(\"make_table.R\")"
