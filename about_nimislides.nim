import nimib, nimislides
import our

template sectionSlide* =
  slide:
    nbText """
## News from Nimislides
"""

template aSecondSlide* =
  slide:
    nbText: "whatever"

template all* =
  sectionSlide
  aSecondSlide

when isMainModule:
  myInit("about_nimislides")
  all
  nbSave