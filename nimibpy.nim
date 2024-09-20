import nimib, nimislides
import our

template sectionSlide* =
  slide:
    nbText """
## nimib.py what?
"""

template aSecondSlide* =
  slide:
    nbText: "whatever"

template all* =
  sectionSlide
  aSecondSlide

when isMainModule:
  myInit("nimibpy")
  all
  nbSave