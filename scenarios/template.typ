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
// Battle reports (reports/*.typ) pass `cover: false` and use:
// battlefield-and-deployment, the-battle (with turn, photo, turning-point),
// the-result, casualties (with death-rolls), spoils, consequences,
// notes-from-the-table.
//
// Army sheets (factions/<name>/army.typ) use:
//   #show: army-sheet.with(name: [...], faction-type: [...], lore: [...])
//   #hero([Name], unit-type: [...], profile: (M, WS, BS, S, T, W, I, A, Ld),
//         equipment: (...), special-rules: (...), wounds: [...], experience: [...])
// Each hero is laid out on its own page: a profile line, then boxed panels
// for equipment, special rules, wounds and experience buffs, with blank
// rows left for gear scavenged at the table.
//
// Note: image paths (art:) are resolved relative to this file, i.e. the
// scenarios/ folder, so an army sheet passes "../factions/<name>/art.png".

// Print mode — compile with `typst compile --input print=true` for the
// print-friendly edition: no cover artwork, no cover page break, and a
// greyscale palette on white paper. See build.ps1, which emits both
// editions of every scenario.
#let print-mode = ("true", "1", "yes").contains(
  lower(sys.inputs.at("print", default: "false")),
)

// Palette — colour edition, then the greyscale print edition.
#let gold = if print-mode { rgb("#5a5a5a") } else { rgb("#937530") }
#let gold-bright = if print-mode { rgb("#767676") } else { rgb("#b8933d") }
#let ember = if print-mode { rgb("#2e2e2e") } else { rgb("#a83d15") }
#let blood = if print-mode { rgb("#1f1f1f") } else { rgb("#6b1414") }
#let iron = if print-mode { rgb("#000000") } else { rgb("#241c15") }
#let ink = if print-mode { rgb("#141414") } else { rgb("#2a2118") }
#let parchment = if print-mode { rgb("#ffffff") } else { rgb("#f7f1e3") }
#let parchment-dark = if print-mode { rgb("#ededed") } else { rgb("#ece1c8") }

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

// Battle-report sections, in reading order — reports use the same scenario()
// wrapper with cover: false and round: [Session N · Battle Report]. The
// intro: is the result paragraph; all sections are optional.
#let battlefield-and-deployment(body) = section("The Battlefield & Deployment", body)
#let the-battle(body) = section("The Battle", body)
#let the-result(body) = section("The Result", body, accent: ember)
#let casualties(body) = section("Casualties & Death Rolls", body, accent: blood)
#let spoils(body) = section("Spoils", body, accent: ember)
#let consequences(body) = section("Consequences", body, accent: blood)
#let notes-from-the-table(body) = section("Notes From the Table", body)

// A turn heading inside The Battle: #turn(1, side: [Chaos Dwarfs]) renders
// "Turn 1 · Chaos Dwarfs"; omit side: for a whole game turn.
#let turn(n, side: none) = {
  v(6pt)
  block(sticky: true, text(
    size: 10.5pt, weight: 700, fill: ember, tracking: 1pt,
    smallcaps(if side == none [Turn #n] else [Turn #n · #side]),
  ))
  v(2pt)
}

// A framed photograph or map with an italic caption beneath it. Paths are
// resolved from the repo root (the --root of every build), so give them
// with a leading slash, e.g. "/reports/photos/prologue-turn-1.jpg".
#let photo(path, caption, height: 7cm) = align(center, block(breakable: false, {
  block(stroke: 1pt + gold, inset: 3pt, fill: parchment-dark, image(path, height: height))
  v(2pt)
  text(size: 9pt, style: "italic", fill: ink.lighten(20%), caption)
}))

// A dashed placeholder, with caption, where a photograph will go.
#let photo-to-come(caption, height: 5cm) = align(center, block(breakable: false, {
  block(
    width: 80%, height: height,
    stroke: (paint: gold, thickness: 1pt, dash: "dashed"), fill: parchment-dark,
    align(center + horizon, text(fill: gold, size: 10pt, tracking: 2pt, smallcaps[Photograph to come])),
  )
  v(2pt)
  text(size: 9pt, style: "italic", fill: ink.lighten(20%), caption)
}))

// The Casualties & Death Rolls table. Each row is (hero, warband, fell-to,
// d6, fate); pass no rows for an empty table to fill in at the table.
#let death-rolls(..rows) = table(
  columns: (1.5fr, 1fr, 2fr, 0.6fr, 1fr),
  stroke: 0.5pt + gold.lighten(40%),
  fill: (_, y) => if y == 0 { parchment-dark } else { none },
  [*Hero*], [*Warband*], [*Fell to*], [*D6*], [*Fate*],
  ..rows.pos().flatten(),
)

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

// The decision, charge or dice roll a battle turned on: a plaque inside
// The Battle, written so it can be quoted later in the campaign.
#let turning-point(body, title: [The Moment the Battle Turned]) = special-rule(title, body)

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

// Shared page setup for every campaign document: A4 parchment, the
// small-caps header label top right, and the campaign footer.
#let campaign-page(header: [], body) = {
  set page(
    paper: "a4",
    fill: parchment,
    margin: (x: 2.2cm, y: 2cm),
    header: {
      set text(size: 8pt, fill: ember, tracking: 1.5pt)
      align(right, smallcaps(header))
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
  body
}

// The campaign name in small caps over a document title.
#let masthead(title) = align(center, {
  text(size: 9pt, fill: gold, tracking: 3pt, smallcaps[The Sigmarite Uprising])
  v(2pt)
  text(size: 26pt, weight: 700, fill: iron, title)
})

// Framed cover artwork, or a dashed placeholder when there is none yet.
// fit: "cover" fills the full-width frame by cropping the image; "contain"
// shows the whole image at the given height in a frame that hugs it,
// centred, which suits portrait artwork.
#let cover-art(art, height: 11.5cm, fit: "cover") = if art != none {
  let frame = block.with(stroke: 1pt + gold, inset: 3pt, fill: parchment-dark)
  if fit == "contain" {
    align(center, frame(image(art, height: height)))
  } else {
    frame(width: 100%, image(art, width: 100%, height: height, fit: fit))
  }
} else {
  block(
    width: 100%,
    height: height,
    stroke: (paint: gold, thickness: 1pt, dash: "dashed"),
    fill: parchment-dark,
    align(center + horizon, text(fill: gold, size: 11pt, tracking: 2pt, smallcaps[Artwork to come])),
  )
}

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
  show: campaign-page.with(header: round)
  masthead(title)

  if cover {
    // ── Cover page: sides + artwork + intro ──
    v(-10pt)
    if sides.len() > 0 { sides-banner(sides) }
    if status != none {
      v(4pt)
      align(center, text(size: 9pt, fill: gold, smallcaps[Status: #status]))
    }
    // The print edition drops the cover artwork entirely and lets the intro
    // run straight into the rules rather than leaving a near-empty page.
    if not print-mode {
      v(10pt)
      cover-art(art)
    }
    v(12pt)

    if intro != none {
      block(width: 100%, text(style: "italic", size: 11pt, fill: ink.lighten(15%), intro))
    } else if not print-mode {
      align(center, text(style: "italic", fill: gold, [Introduction to come.]))
    }

    if not print-mode { pagebreak() }
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

// ── Army sheets ──────────────────────────────────────────────────────────
// A warband roster: a cover page with the army name, faction type, optional
// artwork and lore, followed by one page per hero. Like scenarios, the
// print edition drops the artwork and switches to greyscale.
#let army-sheet(
  name: none,         // the warband's name; none → the faction name and a placeholder
  faction-type: [],   // the army list the warband is built from, e.g. [Empire]
  art: none,          // cover artwork, relative to scenarios/; none → placeholder
  art-fit: "cover",   // "contain" to show the whole image (see cover-art)
  art-height: 11.5cm,
  lore: none,         // the warband's story; none → placeholder
  body,
) = {
  let title = if name == none { faction-type } else { name }
  show: campaign-page.with(header: [Army Sheet · #title])
  masthead(title)
  if name == none {
    v(-6pt)
    align(center, text(style: "italic", size: 9pt, fill: gold, [Army name to come.]))
    v(2pt)
  }
  v(-10pt)
  align(center, block(
    inset: (x: 14pt, y: 8pt),
    stroke: 0.6pt + gold,
    fill: parchment-dark,
    [#text(size: 8.5pt, fill: gold, smallcaps[Faction]) #h(8pt) #text(weight: 700, size: 11pt, fill: iron, faction-type)],
  ))
  if not print-mode {
    v(10pt)
    cover-art(art, height: art-height, fit: art-fit)
  }
  v(12pt)
  if lore != none {
    block(width: 100%, lore)
  } else {
    align(center, text(style: "italic", fill: gold, [Lore to come.]))
  }
  body
}

#let profile-labels = ("M", "WS", "BS", "S", "T", "W", "I", "A", "Ld")

// A titled, bordered panel used for the four quarters of a hero page.
#let hero-panel(title, body, accent: gold) = {
  text(size: 10pt, weight: 700, fill: accent, tracking: 1pt, smallcaps(title))
  v(6pt)
  body
}

// A magic item carried in a hero's equipment list. It appears in the
// Equipment panel as the name with its kind on a second line; the rule is
// repeated under Special Rules, headed by the item name.
//   magic-item([Ring of St. Horst], kind: [Enchanted item])[...]
#let magic-item(name, kind: [Magic item], rule) = (
  item: [#name \ #text(size: 8.5pt, fill: gold, kind)],
  name: name,
  rule: rule,
)

// Accept a single entry where a list is expected, so ([Hand weapon]) works
// as well as ([Hand weapon],).
#let as-list(x) = if type(x) == array { x } else { (x,) }

// One hero, on its own page. Equipment entries are a single item, an
// (item, note) pair, or a magic-item(); blank rows are padded out to
// `slots` so gear won at the table can be written in by hand. Wounds and
// experience buffs may be left as none, which leaves the box empty for the
// same reason.
#let hero(
  name,
  unit-type: [],
  profile: (),        // (M, WS, BS, S, T, W, I, A, Ld)
  points: none,       // none renders as "-"
  equipment: (),
  slots: 6,
  special-rules: (),
  wounds: none,
  experience: none,
) = {
  pagebreak(weak: true)

  block(breakable: false, {
    text(size: 8.5pt, fill: gold, tracking: 1.5pt, smallcaps[Character])
    h(8pt)
    text(size: 18pt, weight: 700, fill: iron, name)
    v(-2pt)
    text(size: 8.5pt, fill: gold, tracking: 1.5pt, smallcaps[Unit Type])
    h(8pt)
    text(size: 11pt, fill: ink, unit-type)
  })
  v(8pt)

  table(
    columns: (auto,) + (1fr,) * profile-labels.len() + (auto,),
    align: center + horizon,
    inset: (x: 6pt, y: 5pt),
    [Profile], ..profile-labels.map(l => [*#l*]), [Points],
    [], ..profile.map(v => [#v]), if points == none [-] else [#points],
  )
  v(10pt)

  let items = as-list(equipment)
  let gear = items.map(e =>
    if type(e) == dictionary { (e.item, []) }
    else if type(e) == array { e }
    else { (e, []) })
  while gear.len() < slots { gear.push(([], [])) }
  let item-rules = items.filter(e => type(e) == dictionary)

  let panel-stroke = 0.6pt + gold
  set par(justify: false)  // the panels are too narrow to justify well
  grid(
    columns: (1fr, 1fr),
    rows: (auto, 5.5cm),
    stroke: panel-stroke,
    inset: 10pt,
    hero-panel("Equipment", {
      table(
      columns: (1.6fr, 1fr),
      align: left + horizon,
      inset: (x: 6pt, y: 5pt),
      stroke: 0.5pt + gold.lighten(40%),
      fill: none,
      // Blank rows keep a writing height; filled rows grow with their text.
      ..gear.map(((item, note)) => (
        if item == [] { block(height: 12pt) } else { item },
        note,
      )).flatten(),
    )}),
    hero-panel("Special Rules", accent: ember, {
      for rule in as-list(special-rules) {
        text(style: "italic", rule)
        linebreak()
      }
      for it in item-rules {
        v(6pt)
        block(text(style: "italic", text(weight: 700, it.name) + [. ] + it.rule))
      }
    }),
    hero-panel("Wounds", accent: blood, if wounds != none { wounds }),
    hero-panel("Experience Buffs", if experience != none { experience }),
  )
}
