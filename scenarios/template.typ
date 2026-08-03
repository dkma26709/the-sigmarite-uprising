// The Sigmarite Uprising — shared scenario template.
// Usage:
//   #import "template.typ": *
//   #show: scenario.with(title: [...], round: [...], sides: (...), flavour: [...])
// Then write the scenario body using the helpers below
// (overview, battlefield, special-rule, victory, aftermath).

// Palette — print-friendly take on the campaign site colours.
#let gold = rgb("#937530")
#let gold-bright = rgb("#b8933d")
#let ember = rgb("#a83d15")
#let blood = rgb("#6b1414")
#let iron = rgb("#241c15")
#let ink = rgb("#2a2118")
#let parchment = rgb("#f7f1e3")
#let parchment-dark = rgb("#ece1c8")

#let chain-rule = {
  v(2pt)
  line(length: 100%, stroke: 0.8pt + gold)
  v(-4.5pt)
  line(length: 100%, stroke: 0.4pt + gold-bright)
  v(2pt)
}

// A titled banner section, used by the section helpers below.
#let section(title, body, accent: gold) = {
  v(10pt)
  block(breakable: false, {
    text(
      font: "Libertinus Serif",
      size: 13pt,
      weight: 700,
      fill: accent,
      tracking: 1.5pt,
      smallcaps(title),
    )
    v(-6pt)
    line(length: 100%, stroke: 0.6pt + accent.lighten(30%))
    v(2pt)
  })
  body
}

#let overview(body) = section("Overview", body)
#let battlefield(body) = section("Battlefield & Deployment", body)
#let victory(body) = section("Victory Conditions", body, accent: ember)
#let aftermath(body) = section("Aftermath", body, accent: blood)

// Battle-report sections — reports use the same scenario() wrapper,
// typically with round: [Session N — Battle Report].
#let the-battle(body) = section("The Battle", body)
#let casualties(body) = section("Casualties & Death Rolls", body, accent: blood)
#let spoils(body) = section("Spoils", body, accent: ember)
#let consequences(body) = section("Consequences", body, accent: blood)

// A named special rule in a bordered plaque.
#let special-rule(title, body) = block(
  breakable: false,
  width: 100%,
  inset: (x: 12pt, y: 10pt),
  fill: parchment-dark,
  stroke: (left: 2.5pt + ember, rest: 0.5pt + gold.lighten(40%)),
  {
    text(size: 11pt, weight: 700, fill: ember, smallcaps(title))
    v(4pt)
    body
  },
)

#let scenario(
  title: [],
  round: [],       // e.g. [Prologue] or [Round 3]
  sides: (),       // array of (name, role) pairs, e.g. (([Chaos Dwarfs], [The Slavers]), ...)
  flavour: none,   // italic opening text
  status: none,    // e.g. [Fought — write-up pending.]
  body,
) = {
  set page(
    paper: "a4",
    fill: parchment,
    margin: (x: 2.2cm, y: 2cm),
    footer: context {
      set text(size: 8pt, fill: gold, tracking: 1pt)
      grid(
        columns: (1fr, auto, 1fr),
        align: (left, center, right),
        smallcaps[The Sigmarite Uprising],
        [],
        [#counter(page).display() / #counter(page).final().first()],
      )
    },
  )
  set text(font: "Libertinus Serif", size: 10.5pt, fill: ink)
  set par(justify: true)
  show table: set text(size: 9.5pt)
  set table(stroke: 0.5pt + gold.lighten(40%), fill: (_, y) => if y == 0 { parchment-dark })

  // Masthead
  align(center, {
    text(size: 9pt, fill: gold, tracking: 3pt, smallcaps[The Sigmarite Uprising])
    v(2pt)
    text(size: 26pt, weight: 700, fill: iron, title)
    v(1pt)
    text(size: 11pt, fill: ember, tracking: 2pt, smallcaps(round))
  })
  chain-rule

  if flavour != none {
    align(center, block(width: 88%, text(style: "italic", size: 10.5pt, fill: ink.lighten(15%), flavour)))
    v(4pt)
  }

  // Sides banner
  if sides.len() > 0 {
    align(center, block(
      inset: (x: 14pt, y: 8pt),
      stroke: 0.6pt + gold,
      fill: parchment-dark,
      grid(
        columns: sides.len() * 2 - 1,
        column-gutter: 14pt,
        align: center + horizon,
        ..sides.map(s => [
          #text(weight: 700, size: 11pt, fill: iron, s.at(0)) \
          #text(size: 8.5pt, fill: gold, smallcaps(s.at(1)))
        ]).intersperse(text(size: 10pt, fill: blood, weight: 700, smallcaps[vs])),
      ),
    ))
  }

  if status != none {
    v(4pt)
    align(center, text(size: 9pt, fill: gold, smallcaps[Status: #status]))
  }

  body
}
