import nimib, nimislides
import our

template sectionSlide* =
  slide:
    nbText """
## What is NimibLand
"""

template aSecondSlide* =
  slide:
    nbText: "whatever"

template all* =
  sectionSlide
  aSecondSlide

when isMainModule:
  myInit("nimibland")
  all
  nbSave