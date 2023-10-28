build:
  podman build -t pandoc .

run:
  podman run -v $(pwd):/project:Z pandoc

watch:
  podman run -it -e GLORT_WATCH=1 -v $(pwd):/project:Z pandoc
