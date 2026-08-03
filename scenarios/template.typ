// The Sigmarite Uprising — shared scenario template.
//
// Scenario usage:
//   #import "template.typ": *
//   #show: scenario.with(
//     title: [...], round: [...], sides: (...),
//     art: "art/<file>.png",   // omit for a placeholder frame
//     intro: [...],            // cover-page flavour text; omit for a placeholder
//   )
// The cover page (artwork + intro) is generated automatically; the body
// starts on page 2 using the section helpers:
//   armies, battlefield, deployment, first-turn, game-length, victory,
//   special-rules, aftermath — plus special-rule(title)[...] plaques,
//   which may be attached inside any section.
//
// Battle reports pass `cover: false` and use: the-battle, casualties,
// spoils, consequences.

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
  v(2pt)
}

// A titled banner section, used by the section helpers below.
// All sections are optional — include only what the scenario needs.
// draft: true adds a "Draft" chip to the heading; new scenarios start with
// every section marked draft, and the chip is removed once a section is
// agreed at the table.
#let section(title, body, accent: gold, draft: false) = {
  v(10pt)
  block(breakable: false, sticky: true, {
    text(
      font: "Libertinus Serif",
      size: 13pt,
      weight: 700,
      fill: accent,
      tracking: 1.5pt,
      smallcaps(title),
    )
    if draft {
      h(8pt)
      box(
        baseline: 20%,
        inset: (x: 5pt, y: 2.5pt),
        stroke: (paint: blood, thickness: 0.7pt, dash: "dashed"),
        text(size: 8pt, weight: 700, fill: blood, tracking: 1.5pt, smallcaps[Draft]),
      )
    }
    v(-6pt)
    line(length: 100%, stroke: 0.6pt + accent.lighten(30%))
    v(2pt)
  })
  body
}

// Scenario sections, in reading order.
#let armies(body, draft: false) = section("Armies", body, draft: draft)
#let battlefield(body, draft: false) = section("The Battlefield", body, draft: draft)
#let deployment(body, draft: false) = section("Deployment", body, draft: draft)
#let first-turn(body, draft: false) = section("First Turn", body, draft: draft)
#let game-length(body, draft: false) = section("Game Length", body, draft: draft)
#let victory(body, draft: false) = section("Victory Conditions", body, accent: ember, draft: draft)
#let special-rules(body, draft: false) = section("Special Rules", body, accent: ember, draft: draft)
#let aftermath(body, draft: false) = section("Aftermath", body, accent: blood, draft: draft)
#let overview(body, draft: false) = section("Overview", body, draft: draft)

// Battle-report sections — reports use the same scenario() wrapper with
// cover: false, typically with round: [Session N · Battle Report].
#let the-battle(body) = section("The Battle", body)
#let casualties(body) = section("Casualties & Death Rolls", body, accent: blood)
#let spoils(body) = section("Spoils", body, accent: ember)
#let consequences(body) = section("Consequences", body, accent: blood)

// A named special rule in a bordered plaque. Attach inside any section.
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

// An open design question — visibly flagged so drafts are never mistaken
// for agreed rules.
#let to-be-decided(body) = block(
  breakable: false,
  width: 100%,
  inset: (x: 12pt, y: 10pt),
  stroke: (paint: blood, thickness: 1pt, dash: "dashed"),
  {
    text(size: 10pt, weight: 700, fill: blood, smallcaps[To be decided])
    v(4pt)
    body
  },
)

#let sides-banner(sides) = align(center, block(
  inset: (x: 14pt, y: 8pt),
  stroke: 0.6pt + gold,
  fill: parchment-dark,
  grid(
    columns: sides.len() * 2 - 1,
    column-gutter: 14pt,
    align: center + horizon,
    ..sides.map(s => {
      let (name, ..role) = s
      if role.len() > 0 [
        #text(weight: 700, size: 11pt, fill: iron, name) \
        #text(size: 8.5pt, fill: gold, smallcaps(role.first()))
      ] else [
        #text(weight: 700, size: 11pt, fill: iron, name)
      ]
    }).intersperse(text(size: 10pt, fill: blood, weight: 700, smallcaps[vs])),
  ),
))

#let scenario(
  title: [],
  round: [],       // e.g. [Session 1 · Battle One]
  sides: (),       // array of (name,) or (name, role) entries, e.g. (([Chaos Dwarfs],), ...)
  art: none,       // path to cover artwork (relative to scenarios/); none → placeholder
  intro: none,     // cover-page flavour text; none → placeholder
  status: none,    // e.g. [Fought, write-up pending]
  cover: true,     // false → compact single-header layout (battle reports)
  body,
) = {
  set page(
    paper: "a4",
    fill: parchment,
    margin: (x: 2.2cm, y: 2cm),
    header: {
      set text(size: 8pt, fill: ember, tracking: 1.5pt)
      align(right, smallcaps(round))
    },
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
  })

  if cover {
    // ── Cover page: sides + artwork + intro ──
    v(-10pt)
    if sides.len() > 0 { sides-banner(sides) }
    if status != none {
      v(4pt)
      align(center, text(size: 9pt, fill: gold, smallcaps[Status: #status]))
    }
    v(10pt)
    if art != none {
      block(
        width: 100%,
        stroke: 1pt + gold,
        inset: 3pt,
        fill: parchment-dark,
        image(art, width: 100%, height: 11.5cm, fit: "cover"),
      )
    } else {
      block(
        width: 100%,
        height: 11.5cm,
        stroke: (paint: gold, thickness: 1pt, dash: "dashed"),
        fill: parchment-dark,
        align(center + horizon, text(fill: gold, size: 11pt, tracking: 2pt, smallcaps[Artwork to come])),
      )
    }
    v(12pt)

    if intro != none {
      block(width: 100%, text(style: "italic", size: 11pt, fill: ink.lighten(15%), intro))
    } else {
      align(center, text(style: "italic", fill: gold, [Introduction to come.]))
    }

    pagebreak()
  } else {
    // ── Compact header (battle reports) ──
    if sides.len() > 0 { sides-banner(sides) }
    if status != none {
      v(4pt)
      align(center, text(size: 9pt, fill: gold, smallcaps[Status: #status]))
    }
    if intro != none {
      v(4pt)
      align(center, block(width: 88%, text(style: "italic", size: 10.5pt, fill: ink.lighten(15%), intro)))
    }
  }

  body
}
