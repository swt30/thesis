# Inputs
title = thesis
chapterfolder = chapters/
bibfile = library
bibfilebib = $(bibfile).bib

# Chapters
files = 00-preface/00-preface.md
files += 01-introduction.md
files += 02-eos.md
files += 03-models.md
files += 04-heating.md
files += 05-migration.md
files += 06-conclusion.md
chapters = $(addprefix $(chapterfolder), $(files))
allfiles = preamble.yaml $(chapters)

# Figures

# Outputs
outputexts = tex pdf
outputpdfs = thesis.pdf thesis-deposit.pdf
outputtexs = thesis.tex thesis-deposit.tex
outputs = $(outputpdfs) $(outputtexs)

# Styles and templates
textemplate = template.tex

# for cleaning purposes
clutter=*.run.xml *.aux *.bcf *.fdb_latexmk *.fls *.log *.out *.bbl *.blg *Notes.bib .figsentinel

# pandoc options
texopts = --filter=pandoc-crossref -M cref=true -M bibfile=$(bibfile) --from=markdown -s -S --natbib --chapters --template $(textemplate)
softbinding = -M softbinding=true
deposit = -M deposit=true


# make stuff!
thesis: $(title).pdf
all: allpdf

# documents
alltex: $(outputtexs)
$(title).tex: preamble.yaml $(chapters) $(textemplate) | bibtex
	pandoc $(allfiles) $(texopts) $(softbinding) -o $(title).tex
$(title)-deposit.tex: preamble.yaml $(chapters) $(textemplate) | bibtex
	pandoc $(allfiles) $(texopts) $(deposit) -o $(title)-deposit.tex

allpdf: $(outputpdfs)
$(title).pdf: $(title).tex
	latexmk $(title).tex -pdf
$(title)-deposit.pdf: $(title)-deposit.tex
	latexmk $(title)-deposit.tex -pdf


# bibliography
bibtex:
	rm -f $(bibfilebib)
	cp ~/Documents/PhD/Literature/bibtex/publications-heating.bib $(bibfilebib)

# cleaning
clean:
	latexmk -C -f $(title).tex
	latexmk -C -f $(title)-deposit.pdf
	rm -rf $(outputs) $(clutter)

.PHONY: tex pdf bibtex clean thesis all
