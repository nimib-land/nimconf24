import nimib, nimislides
import our
#import agenda

template titleSlide* =
  slide:
    nbText """
## Updates from NimibLand
"""
    reference "[github.com/nimib-land/nimconf24](https://github.com/nimib-land/nimconf24)"

when isMainModule:
  myInit("index")
  titleSlide
  nbSave