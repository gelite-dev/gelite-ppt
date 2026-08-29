#import "@preview/ling:0.1.0": *
#import "@preview/touying:0.7.4": *

#let mode = sys.inputs.at("mode", default: "sans")
#let handout = sys.inputs.at("handout", default: "false") == "true"
#let mode = sys.inputs.at("mode", default: "serif")
#let handout = sys.inputs.at("handout", default: "false") == "true"

#let content-slide(title: auto, ..args) = touying-slide-wrapper(self => {
  if title != auto {
    self.store.title = title
  }

  let header(self) = {
    set text(fill: body-color, size: 30pt)
    if self.store.title != none {
      weighted(self.store.mode, "bold", utils.call-or-display(self, self.store.title))
    } else {
      weighted(self.store.mode, "bold", utils.display-current-heading(level: 2))
    }
    v(-.45em)
    line(length: 100%, stroke: .8pt + self.colors.primary)
  }

  let footer(self) = {
    set text(fill: body-color, size: 10pt)
    utils.display-current-heading(level: 1)
    h(1fr)
    context utils.slide-counter.display()
  }

  self = utils.merge-dicts(
    self,
    config-page(header: header, footer: footer, header-ascent: 10%),
  )
  set text(size: 22pt)
  touying-slide(self: self, ..args)
})

#show: ling-theme.with(
  mode: mode,
  title: [문서가 코드가 되는 순간],
  author: [타치바나 셰리],
  institution: [Engineering],
  date: datetime.today(),
  config-page(
    margin: (top: 4em, bottom: 1.8em, x: 2.2em),
  ),
  config-common(
    handout: handout,
    slide-fn: content-slide,
    zero-margin-header: false,
  ),
)

#title-slide()

= 설계 원칙

== 가장 작은 인터페이스

- 내용은 구조에 집중합니다.
- 테마는 타이포그래피를 책임집니다.

#pause

#info[한국어와 English 2026을 함께 사용합니다.]

== 코드

```typ
#let theme = ling-theme.with(mode: "sans")
```

#speaker-note[코드와 본문 글꼴의 차이를 설명한다.]

#focus-slide[복잡성을 줄이는 가장 작은 인터페이스]

#slide(composer: (1fr, 1fr))[
  왼쪽에는 설명을 둡니다.
][
  오른쪽에는 그림이나 코드를 둡니다.
]

#warning[인쇄 결과에서도 선과 레이블로 의미를 구분합니다.]

#slide[
  #align(left + horizon)[감사합니다.]
]
