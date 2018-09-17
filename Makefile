all: slides.html printable-slides.html speaker-notes.pdf

slides.html: slides.md slides.css
	cleaver slides.md

printable-slides.html: slides.md slides.css
	cleaver slides.md --template templates/print.mustache --output printable-slides.html --theme default

speaker-notes.pdf: slides.html
	pandoc speaker-notes.md -f markdown --smart -s -o speaker-notes.pdf

.PHONY: clean

clean:
	rm -f slides.html printable-slides.html speaker-notes.pdf
