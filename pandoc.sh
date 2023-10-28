#!/bin/sh

INFILE="resume.md"
OUTFILE="resume.pdf"
CSSFILE="aesthetic.css"

generate_pdf() {
  pandoc \
    -f markdown \
    -t html \
    "$INFILE" \
    -o "$OUTFILE" \
    --metadata pagetitle="required_but_unused" \
    --self-contained \
    --css="$CSSFILE" \
    --pdf-engine="wkhtmltopdf" \
    --pdf-engine-opt=--enable-local-file-access
}

generate_pdf

if [ -n "$GLORT_WATCH" ]; then
  echo "Watching for changes..."
  while inotifywait -qe modify resume.md $CSSFILE; do
    generate_pdf
  done
fi
