#!/bin/sh
run_pandoc () {
    pandoc \
        -f markdown \
        -t html \
        resume.md \
        -o resume.pdf \
        --metadata pagetitle="required_but_unused" \
        --self-contained \
        --css=github.css \
        --pdf-engine-opt=--enable-local-file-access
}

if [ -z $GLORT_WATCH ];
    then
        run_pandoc;
    else
        echo "Watching for changes..."
        while inotifywait -qe modify resume.md github.css;
        do run_pandoc;
    done
fi
