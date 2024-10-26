import nimib, nimislides
import our
import nimib_intro, about_nimislides, about_nimibook

template titleSlide* =
  slide:
    nbText """
## Updates from NimibLand
"""
    reference "[github.com/nimib-land/nimconf24](https://github.com/nimib-land/nimconf24)"

template agendaSlide* =
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

template slideNimibSpeakingHours* =
  slide:
    nbText """
## [Nimib Speaking Hours](https://github.com/pietroppeter/nimib/discussions/categories/nimib-speaking-hours)
"""

template slideNimibLand* =
  slide:
    nbText """
[github.com/nimib-land](https://github.com/nimib-land)
"""

template slideRefactorNbBlock* =
  slide:
    nbText """
[Refactor NbBlock](https://github.com/pietroppeter/nimib/pull/235)
"""

template slideQandA* =
  slide:
    nbText """
## Q&A
"""

when isMainModule:
  myInit("index.nim")
  titleSlide
  agendaSlide

  slide:
    nimibIntro.all

  slide:
    slideNimibSpeakingHours
    slideNimibLand
    slideRefactorNbBlock

  slide:
    aboutNimiSlides.all

  aboutNimiBook.all

  thankyouSlide
  slideQandA
  nbSave