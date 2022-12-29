build:
  docker build -t pandoc .

run:
  docker run -v $(pwd):/project pandoc
