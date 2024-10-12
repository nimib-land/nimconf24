import nimibook

var book = initBookWithToc:
  entry("Introduction", "index.md")
  entry("Example", "example")

nimibookCli(book)
