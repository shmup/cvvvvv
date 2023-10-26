build:
  docker build -t pandoc .

run:
  docker run -v $(pwd):/project pandoc

watch:
  docker run -it -e GLORT_WATCH=1 -v $(pwd):/project pandoc
