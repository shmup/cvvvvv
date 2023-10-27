FROM ubuntu:latest

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
 && apt-get install -yq \
    pandoc \
    wkhtmltopdf \
    inotify-tools

WORKDIR /project

# This is not required. It's included to silence a warning.
ENV XDG_RUNTIME_DIR=/tmp/runtime-root

CMD ["sh", "pandoc.sh"]
