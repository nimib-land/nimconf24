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
  nimibookExample
  howIstart
  howIcontribute

when isMainModule:
  myInit("about_nimibook")
  all
  nbSave