import nimib, nimislides
import our

template sectionSlide* =
  slide:
    nbText """
## Intro to Nimibook
"""

template aSecondSlide* =
  slide:
    nbText: "whatever"

template all* =
  sectionSlide
  aSecondSlide

when isMainModule:
  myInit("about_nimibook")
  all
  nbSave