import nimib, nimislides
import our, hugo

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

template autoAnimationShowcase* =
  slide(slideOptions(autoAnimate=true)):
    nbText: "## Auto-animation"
  autoAnimateSlides(5):
    nbText: "## Auto-animation"
    showUntil(2):
      nbText "Show until frame 2"
    showAt(2, 4):
      nbText: "Show at frame 2 & 4"
    showFrom(3):
      nbText: "Show from frame 3"
    showText(@[({1..5}, "Frame: "), ({1}, "1"), ({2}, "2"), ({3}, "3"), ({4}, "4"), ({5}, "5")])

template typicalExample* =
  autoAnimateSlides(6):
    nbText: "## Usage example"
    showUntil(2):
      nbText: "Example 1"
    showAt(2..3):
      fitImage("https://raw.githubusercontent.com/nimib-land/assets/refs/heads/main/nimib_logo_white_cup.svg")
    showAt(3..4):
      nbText: "Example 3"
      nbText: "Example 4"
    showAt(4..5):
      nbText: "Example 5"

template autoAnimateBasics* =
  slide:
    nimibCode:
      autoAnimateSlides(5):
        nbText: "## Auto-animation"
        showUntil(2):
          nbText "Show until frame 2"
        showAt(2, 4):
          nbText: "Show at frame 2 & 4"
        showFrom(3):
          nbText: "Show from frame 3"
    


template showAtSlides* =
  slide:
    autoAnimateSlides(5):
      nbText: "### showAt"
      nimibCode:
        showAt(1, 5):
          nbText: "1 & 5"
        showAt(2..4):
          nbText: "2..4"
        showAt({3, 5}):
          nbText: "{3, 5}"
      showText(@[({1..5}, "Frame: "), ({1}, "1"), ({2}, "2"), ({3}, "3"), ({4}, "4"), ({5}, "5")])

template all* =
  sectionSlide
  docs1
  docsExample1
  autoAnimationShowcase
  typicalExample
  autoAnimateBasics
  showAtSlides

when isMainModule:
  myInit("about_nimislides.nim")
  all
  nbSave