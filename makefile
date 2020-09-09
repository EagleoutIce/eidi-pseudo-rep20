# list all papers
SLIDESTEX := $(shell ls *.tex)
SOURCESTEX := $(shell ls *.src)
SLIDESPDF := $(addsuffix .pdf,$(basename $(SLIDESTEX)))
CLEANTARGETS := log aux out ind bbl blg lof lot toc idx acn acr alg glg glo gls fls fdb_latexmk auxlock md5 SATZE ZSM UB TOP listing upa ilg TOPIC DEFS vrb snm nav atfi


#create all papers
all:	$(SLIDESPDF)

split:
	pdfsplitter eidi-tutorium-*.pdf 90

%.pdf: %.tex $(SOURCESTEX)
	pdflatex -shell-escape -interaction batchmode -draftmode -jobname $(basename $@) $<
	pdflatex -shell-escape -interaction batchmode -jobname $(basename $@) $<
	for fd in $(CLEANTARGETS); do rm -f ./$(basename $@).$$fd; done

clean:
	for fd in $(CLEANTARGETS); do rm -f *.$$fd; done
	rm -f *.pdf
