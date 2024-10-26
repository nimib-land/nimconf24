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
  nb.partials["logo"] = """
<div id="nimibLandLogo" style="background: url(https://raw.githubusercontent.com/nimib-land/assets/refs/heads/main/nimib_logo_white_cup.svg);
background-repeat: no-repeat;
background-size: contain;
position: absolute;
bottom: 10px;
left: 10px;
width: 128px;
height: 128px;"></div>
""" # adjust the px as needed
  nb.partials["document"] = """
<!DOCTYPE html>
<html>
  {{> head}}
  <body>
  {{> main}}
  {{> logo}}
  </body>
</html>
"""