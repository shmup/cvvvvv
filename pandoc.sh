#!/bin/sh
INFILE="resume.md"
OUTFILE="resume.pdf"
CSSFILE="github.css"

run_pandoc () {
    pandoc \
        -f markdown \
        -t html \
        "$INFILE" \
        -o "$OUTFILE" \
        --metadata pagetitle="required_but_unused" \
        --self-contained \
        --css="$CSSFILE" \
        --pdf-engine-opt=--enable-local-file-access
}

if [ -z $GLORT_WATCH ];
    then
        run_pandoc;
    else
        run_pandoc;
        echo "Watching for changes..."
        while inotifywait -qe modify resume.md github.css;
        do run_pandoc;
    done
fi
