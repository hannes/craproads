#!/bin/sh

#set -e
#set -x
#set -v

DOCUMENT="rws_roadquality"
MAXTRIES=10

# go where the .sh-script is located
cd "`dirname \"$0\"`"

COUNT=0

CallLaTeX() {
    pdflatex -interaction=errorstopmode -file-line-error -halt-on-error "$DOCUMENT"
}

CallLaTeX


#einmal bibtex laufen lassen
bibtex "$DOCUMENT"
#exit
makeindex "$DOCUMENT.nlo" -s nomencl.ist -o "$DOCUMENT.nls"

CallLaTeX


while grep -q 'Label.s. may have changed' "$DOCUMENT.log"; do
    COUNT=$(($COUNT + 1))
    if [ "$COUNT" -gt "$MAXTRIES" ]; then
        echo "Labels are still incorrect after $MAXTRIES executions."
        false
    fi
    CallLaTeX
done

echo "Compiled after $COUNT executions."

if grep -q 'LaTeX Warning: There were multiply-defined labels.' "$DOCUMENT.log"; then
    grep -A 2 'LaTeX Warning: Label .*' "$DOCUMENT.log"
    echo 'ERROR: Label(s) multiply defined; labels may (and probably will) be incorrect'
    false
fi

rm -f *.aux "$DOCUMENT".idx "$DOCUMENT".lof "$DOCUMENT".lot "$DOCUMENT".log "$DOCUMENT".out "$DOCUMENT".toc "$DOCUMENT".bbl "$DOCUMENT".blg "$DOCUMENT".ilg "$DOCUMENT".lol "$DOCUMENT".nlo "$DOCUMENT".nls

echo 'Success.'

#open $DOCUMENT.pdf
#open $DOCUMENT.tex

