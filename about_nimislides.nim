import nimib, nimislides
import our

template sectionSlide* =
  slide:
    nbText """
## News from Nimislides
"""

template docs1* =
  slide:
    nbText: "## Documentation"
    unorderedList:
      listItem: nbText: "Tutorials"
      listItem: nbText: "Embedded examples"

template docsExample1* =
  slide(slideOptions(iframeBackground="https://hugogranstrom.com/nimiSlides/tutorials/layout.html")):
    discard




template all* =
  sectionSlide
  docs1
  docsExample1

when isMainModule:
  myInit("about_nimislides")
  docsExample1
  nbSave