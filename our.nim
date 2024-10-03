import std / strutils
export strutils
import nimib, nimislides

const
  colorAgile* = "#02A4BD"

template addNbTextSmall* =
  nb.partials["nbTextSmall"] = "<small>" & nb.partials["nbText"] & "</small>"
  nb.renderPlans["nbTextSmall"] = nb.renderPlans["nbText"]

template nbTextSmall*(text: string) =
  nbText: text
  nb.blk.command = "nbTextSmall"

template reference*(text: string) =
  nbTextSmall: text

template nimConfTheme*() =
  setSlidesTheme(Black)
  let nimYellow = "#FFE953"
  nb.addStyle: """
:root {
  --r-background-color: #181922;
  --r-heading-color: $1;
  --r-link-color: $1;
  --r-selection-color: $1;
  --r-link-color-dark: darken($1 , 15%)
}

.reveal ul, .reveal ol {
  display: block;
  text-align: left;
}

li::marker {
  color: $1;
  content: "»";
}

li {
  padding-left: 12px;
}
""" % [nimYellow]

template nimConfSlide*(body: untyped) =
  slide:
    cornerImage("https://raw.githubusercontent.com/nimib-land/assets/refs/heads/main/nimib_logo_white_bg_4k.png", UpperRight, size=100, animate=false)
    body

template myInit*(sourceFileRel = "my.nim") =
  nbInit(thisFileRel=sourceFileRel, theme=revealTheme)
  nimConfTheme()
  addNbTextSmall
  nbRawHtml """
<style>
.reveal strong {
  color: $1;
  font-style: normal;
}

</style>
""" % [colorAgile]
  nb.partials["nimibCodeAnimate"] = nb.partials["animateCode"]
  nb.renderPlans["nimibCodeAnimate"] = nb.renderPlans["animateCode"]
