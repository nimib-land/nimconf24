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
    showAt(5..8):
      nbText "Nimibook is"
    showAt(6..10):
      nbText "1. a minimal **static site generator** for nimib"
    showAt(7..10):
      nbText "2. implemented using **theme** feature of nimib"
    showAt(8..10):
      nbText "3. a port of [mdbook]()"
    showAt(10..11):
      nbText "so..."
    showFrom(11):
      nbText "### What is mdbook"
    showFrom(12):
      nbText "1. a popular **static site generator** (🦀)"
    showFrom(13):
      nbText "2. with a single book theme"
    showFrom(14):
      nbText "3. and with minimal customization"

template all* =
  sectionSlide
  what

when isMainModule:
  myInit("about_nimibook")
  what
  #all
  nbSave