FROM ubuntu:latest

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
 && apt-get install -yq \
    pandoc \
    wkhtmltopdf

WORKDIR /project

# This is not required. It's included to silence a warning.
ENV XDG_RUNTIME_DIR=/tmp/runtime-root

CMD pandoc -f markdown -t html resume.md -o resume.pdf \
        --metadata pagetitle="required_but_unused" \
        --self-contained \
        --css=github.css \
        --pdf-engine-opt=--enable-local-file-access
