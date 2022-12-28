FROM ubuntu:latest

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
 && apt-get install -yq \
    pandoc \
    wkhtmltopdf

WORKDIR /project

CMD pandoc -f markdown -t html resume.md -o resume.pdf \
        --metadata pagetitle="required_but_unused" \
        --self-contained \
        --css=github.css
