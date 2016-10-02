# Inputs
title=thesis
chapterfolder=chapters/
bibfile=library.bib

# Chapters
files = 01-introduction.md
files += 02-eos.md
files += 03-models.md
files += 04-heating.md
files += 05-migration.md
files += 06-conclusion.md
chapters = $(addprefix $(chapterfolder), $(files))

# Figures

# Outputs
outputexts=tex pdf
outputs=$(title).pdf $(title).tex

# Styles and templates
textemplate=template.tex

# for cleaning purposes
clutter=*.run.xml *.aux *.bcf *.fdb_latexmk *.fls *.log *.out *.bbl *.blg *Notes.bib .figsentinel

# pandoc options
commonopts=--filter=pandoc-crossref -M cref=true --from=markdown -s -S
texopts=$(commonopts) --natbib --chapters --filter=pandoc-svg.py --template $(textemplate)

# make all the things!
all: $(outputexts)

# documents
tex: $(title).tex $(bibfile) | bibtex
$(title).tex: preamble.yaml $(chapters) $(textemplate)
	pandoc preamble.yaml $(chapters) $(texopts) -o $(title).tex

pdf: $(title).pdf
$(title).pdf: $(title).tex
	latexmk $(title).tex -pdf

# bibliography
bibtex:
	rm -f $(bibfile)
	cp ~/Documents/PhD/Literature/bibtex/publications-heating.bib $(bibfile)

# cleaning
clean:
	latexmk -C -f $(title).tex
	rm -rf $(outputs) $(clutter)
