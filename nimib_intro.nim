import nimib, nimislides
import our, hugo

template sectionSlide* =
  slide:
    nbText """
## Intro to Nimib
"""

template listText*(s: string) =
  listItem(fadeIn):
    nbText: s

template nimibIntro* =
  slide:
    nimibCodeAnimate(1 .. 3, 4..5):
      nbKaraxCode:
        import std/[strformat, random]
        import karax/vstyles

        var score = 0
        var active_button_idx = -1
        let num_buttons = 5

        proc setInterval(cb: proc(), interval: int): Interval {.discardable.} =
          kdom.setInterval(
            proc =
              cb()
              if not kxi.surpressRedraws: redraw(kxi)
            , interval
          )

        proc update =
          active_button_idx = rand(0 ..< num_buttons)

        update()
        setInterval(update, 1000)

        proc onButtonHit(idx: int): proc() =
          result = proc () =
            echo idx
            if active_button_idx == idx:
                score += 1
                # reset
                active_button_idx = -1

        proc renderButton(i: int): VNode =
          let isActive = i == active_button_idx
          var styles: seq[(StyleAttr, kstring)] = @[
            (width, "10vw".kstring), (height, "10vh"),
            (fontSize, "24px"), (margin, "1vw"),
            (border, "none"), (borderRadius, "15px"),
            (transition, "transform 0.1s ease-in, box-shadow 0.1s ease-in")
          ]
          if isActive:
            styles.add @[
              (backgroundColor, "#04AA6D".kstring),
              (boxShadow, "0 9px #999"),
              (transform, "translateY(-9px)"),
              (cursor, "grab")
            ]
          else:
            styles.add @[
              (backgroundColor, "#11111".kstring),
              (pointerEvents, "none")
            ]
          result = buildHtml(button(onClick = onButtonHit(i), style=style(styles))):
            text($i)

        karaxHtml:
          h2:
            text "Whack-a-button"
          h3:
            text &"Score: {score}"
          tdiv:
            for i in 0 ..< num_buttons:
              renderButton(i)
           
                


          

template videoReferences* =
  slide:
    nbText: hlMd"""
## Past Talks
"""
    unorderedList:
      listText: "[Share your Nim adventures with Nimib (NimConf 2021)](https://www.youtube.com/watch?v=sWA58Wtk6L8&list=PLxLdEZg8DRwRXNrY7yyGU0-g_GRSyRGKo&index=3)"
      listText: "[Nimib goes interactive (NimConf 2022)](https://www.youtube.com/watch?v=hZ7wX1kgnuc&list=PLxLdEZg8DRwSQQaK0UVRd1DaetVc3lIwr&index=5)"
      listText: "[Make beautiful presentations in Nim using NimiSlides (NimConf 2022)](https://www.youtube.com/watch?v=Sf1TndCcIlU&list=PLxLdEZg8DRwSQQaK0UVRd1DaetVc3lIwr&index=6)"




template all* =
  sectionSlide
  nimibIntro
  videoReferences

when isMainModule:
  myInit("nimib_intro.nim")
  all
  nbSave