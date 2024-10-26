import nimib, nimislides
import our
import nimibland, about_nimislides, about_nimibook, nimibpy

template titleSlide* =
  slide:
    nbText """
## Updates from NimibLand
"""
    reference "[github.com/nimib-land/nimconf24](https://github.com/nimib-land/nimconf24)"

  slide:
    nbText: """
## Agenda
- Intro to Nimib
- Nimib Speaking Hours
  - NimibLand
- Updates from NimiSlides
- Intro to NimiBook
"""

template thankyouSlide* =
  slide:
    nbText """
## Thank you
"""

when isMainModule:
  myInit("index")
  thankyouSlide
  nbSave