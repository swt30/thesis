# Inputs
title = thesis
chapterfolder = chapters/
bibfile = library
bibfilebib = $(bibfile).bib

# List of chapters
files = 00-preface/00-preface.md
files += 01-introduction/01-introduction.md
files += 02-eos/02-eos.md
files += 03-models/03-models.md
files += 04-heating/04-heating.md
files += 05-migration/05-migration.md
files += 06-application/06-application.md
files += 07-conclusion/07-conclusion.md
chapters = $(addprefix $(chapterfolder), $(files))
thesisfiles = preamble.yaml $(chapters)

# Documents with responses to the corrections
corrections = corrections/corrections

# Outputs - main thesis
outputexts = tex pdf
outputpdfs = $(title).pdf $(title)-deposit.pdf
outputtexs = $(title).tex $(title)-deposit.tex
outputs = $(outputpdfs) $(outputtexs)

# Styles and templates
textemplate = template.tex

# for cleaning purposes
clutter=*.run.xml *.aux *.bcf *.fdb_latexmk *.fls *.log *.out *.bbl *.blg *Notes.bib .figsentinel $(bibfilebib)

# pandoc options
texopts = --filter=pandoc-fignos --filter=pandoc-crossref -M cref=true -M bibfile=$(bibfile) -M autoSectionLabels=true --from=markdown -s -S --natbib --chapters --template $(textemplate)
softbinding = -M softbinding=true
deposit = -M deposit=true


# make stuff!
thesis: $(title).pdf
all: allpdf

# documents
alltex: $(outputtexs)
$(title).tex: preamble.yaml $(chapters) $(textemplate) | bibtex
	pandoc $(thesisfiles) $(texopts) $(softbinding) -o $(title).tex
$(title)-deposit.tex: preamble.yaml $(chapters) $(textemplate) | bibtex
	pandoc $(thesisfiles) $(texopts) $(deposit) -o $(title)-deposit.tex

allpdf: $(outputpdfs)
$(title).pdf: $(title).tex
	latexmk $(title).tex -pdf
$(title)-deposit.pdf: $(title)-deposit.tex
	latexmk $(title)-deposit.tex -pdf

# corrections
corrections: $(corrections).pdf
$(corrections).pdf: $(corrections).md
	pandoc $(corrections).md -o $(corrections).pdf



# bibliography
bibtex:
	rm -f $(bibfilebib)
	cp ~/Documents/PhD/Literature/bibtex/publications-thesis.bib $(bibfilebib)

# cleaning
clean:
	latexmk -C -f $(title).tex
	latexmk -C -f $(title)-deposit.pdf
	rm -rf $(outputs) $(clutter)

.PHONY: tex pdf bibtex clean thesis all
