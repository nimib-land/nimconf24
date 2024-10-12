import nimib, nimislides
import our

template sectionSlide* =
  slide:
    nbText """
## Intro to Nimibook
"""

template what* =
  autoAnimateSlides(14):
    showUntil(9):
      nbText "### What is Nimibook 👑📚"
    showAt(2..4):
      nbText "nimib works for single documents"
    showAt(3..4):
      nbText "how do we show a collection of documents?"
    showAt(4):
      nbText "enter Nimibook!"
    showAt(5..8, 10, 11):
      nbText "Nimibook is"
    showAt(6..9):
      nbText "1. a minimal **static site generator** for nimib"
    showAt(7..9):
      nbText "2. implemented using **theme** feature of nimib"
    showAt(8..11):
      nbText "3. a port of [mdbook]()"
    showAt(10..11):
      nbText "so..."
    showFrom(11):
      nbText "### What is mdbook"
    showFrom(12):
      nbText "1. a popular **static site generator** (🦀)"
    showFrom(13):
      nbText "2. with a single book 'theme'"
    showFrom(14):
      nbText "3. and with minimal customization"

template mdbookExample* =
  slide:
    nbText "### a mdbook example"
  slide:
    nbImage("nimdays.png")
    nbText "[xmonader.github.io/nimdays](https://xmonader.github.io/nimdays/day16_asciitables.html)"
  slide:
    nbText """### SUMMARY.MD
```md
# Nim Days

Documenting my days with The Nim Programming language.

- [Intro](book_intro.md)
- [Day 1 DMIDecode](day01_dmidecode.md)
- [Day 2: Parsing Bencode](day02_bencode.md)
- [Day 3: FFI and Libmagic](day03_libmagic.md)
- ...
```
"""
  slide:
    nbText """### content.MD
````md
or let nim decide for you 

```nim
  t.tableWidth = 0
  printTable(t)
```

```
+---+-------+---------+
|ID |Name   |Date     |
+---+-------+---------+
|1  |Aaaa   |2018-10-2|
+---+-------+---------+
```
````
"""

template nimibookExample* =
  slide:
    nbText "### A nimibook example"
  slide:
    nbImage("scinim.png")
    nbText "[scinim.github.io/getting-started](https://scinim.github.io/getting-started/basics/basic_plotting.html)"
  slide:
    nbText """### `toc.nim`
```nim
import nimibook

var book = initBookWithToc:
  entry("Introduction", "index.md")
  entry("Ecosystem overview", "overview/index.md")
  section("Basic topics", "basics/index.md"):
    entry("Common datatypes", "common_datatypes")
    entry("Data wrangling with dataframes", "data_wrangling")
    entry("Plotting", "basic_plotting")
    ...

nimibookCli(book)
```
"""
  slide:
    nbText """### `content.nim`
```nim
import nimib, nimibook

nbInit(theme = useNimibook)

nbCode:
  import ggplotnim
  let x1 = @[0.0, 1.0, 2.0, 3.0]
  let y1 = @[0.0, 1.0, 4.0, 9.0]
  let df1 = toDf(x1, y1)
  ggplot(df1, aes("x1", "y1")) +
    geom_line() +
    ggsave("images/line_plot.png")

nbImage("images/line_plot.png")
```
"""

template howIstart* =
  slide:
    nbText "### How I start"

template howIcontribute* =
  slide:
    nbText "### How I contribute"

template all* =
  sectionSlide
  slide:
    what
    mdbookExample
  slide:
    nimibookExample
  howIstart
  howIcontribute

when isMainModule:
  myInit("about_nimibook")
  nimibookExample
  #all
  nbSave