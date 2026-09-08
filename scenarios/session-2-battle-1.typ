#import "template.typ": *

#show: scenario.with(
  title: [The Sacred Herd],
  round: [Session 2 · Battle One],
  sides: (
    ([Chaos Dwarfs],),
    ([Lizardmen],),
  ),
  art: "art/session-2-battle-1.png",
  intro: [
    #text(weight: 700, style: "normal", fill: iron)[From the ledger of Zhaitrak the Meat Merchant:]

    Let it be entered that the expedition has paid for itself twice over.
    Three beasts taken alive: two of the lesser sort, and one monster of such
    tonnage that it will drag a siege train through mud that would swallow
    forty slaves. Slaves cough, slaves starve, slaves organise. A beast
    merely eats. I have never entered a better line item.

    The jungle disagrees. It has been watching the camp for two days now.

    #v(4pt)
    #text(weight: 700, style: "normal", fill: iron)[Cut into a temple slab above the camp, in the old glyphs:]

    They have put chains on the ones who were here before the chains. The
    ledger is not the law. The stars are the law, and the stars have already
    written what is owed. Take back the herd. Leave the rest for the carrion.
  ],
)

#armies(draft: true)[
  *1,500 points* per side: Chaos Dwarfs against Lizardmen.

  Campaign list rules apply:
  - "Heroes" only
  - Up to 15% rare
  - Hero budget: 350 points
  - One magic item worth a maximum of 25 points

  The Sacred Beasts belong to neither army. They cost no points and are part
  of neither force. See *The Sacred Beasts*.
]

#battlefield(draft: true)[
  A temporary Chaos Dwarf work camp hacked out of dense jungle. The table is
  6 by 4 feet.

  The centre of the table is the camp: wooden beast pens, timber piles,
  wagons and hauling machinery, braziers and small furnaces, and the
  overgrown temple stones the Dawi-Zharr were too busy to level. Heavy chains
  lie strewn between the pens.

  Everything else is jungle: thick vegetation, ruins and scattered temple
  stones running out to every table edge.

  #special-rule[Camp Terrain][
    Pens, wagons and timber piles count as obstacles. Furnaces and braziers
    are impassable terrain. Thick vegetation is difficult terrain and blocks
    line of sight beyond 6".
  ]

  #special-rule[Placing the Beasts][
    The *Great Sacred Beast* is placed at the centre of the table.

    The two *Lesser Sacred Beasts* are placed on the centre line, 18" to
    either side of the Great Beast, so that no single Lizardmen thrust can
    reach all three.

    Each beast is chained inside its own pen and does not move until it is
    freed.
  ]
]

#deployment(draft: true)[
  The Chaos Dwarfs deploy first, anywhere within the camp: a band 24" wide
  running across the centre of the table.

  The Lizardmen then deploy anywhere within 10" of any table edge, in as many
  separate groups as they wish. They come out of the jungle from every side.
]

#first-turn(draft: true)[
  The first turn is determined by the standard rules.
]

#game-length(draft: true)[
  The game ends after six turns.
]

#victory(draft: true)[
  Victory points are scored for the beasts alone. Nothing else scores.

  #table(
    columns: (1fr, auto, auto, auto),
    align: (left, center, center, center),
    table.header[Beast][Still chained][Freed and alive][Slain],
    [Lesser Sacred Beast (two)], [1 VP Chaos Dwarfs], [1 VP Lizardmen], [none],
    [Great Sacred Beast], [2 VP Chaos Dwarfs], [2 VP Lizardmen], [none],
  )

  Four victory points are on the table. The highest total wins; equal totals
  are a draw.

  A slain beast scores for nobody. Neither side can settle the question with
  a cannonball.
]

#special-rules(draft: true)[
  #special-rule[The Sacred Beasts][
    Three beasts are chained in the camp: two Lesser Sacred Beasts and one
    Great Sacred Beast. They belong to neither player and are controlled by
    neither player.

    #table(
      columns: 10,
      align: center,
      table.header[Beast][M][WS][BS][S][T][W][I][A][Ld],
      [Lesser Sacred Beast], [7], [3], [0], [5], [5], [4], [2], [3], [5],
      [Great Sacred Beast], [6], [3], [0], [6], [6], [6], [2], [4], [6],
    )

    Both are *Monsters*, with natural armour of *4+*, and both are
    Unbreakable and Immune to Psychology.

    *Lesser Sacred Beast:* causes _Fear_.

    *Great Sacred Beast:* Large Target, causes _Terror_.

    While chained, a beast may not move, may not attack, and does not fight
    back if attacked. It still causes Fear or Terror.
  ]

  #special-rule[Breaking the Chains][
    A Lizardmen unit in base contact with a chained beast at the end of its
    Movement phase may begin freeing it. Declare the attempt.

    The attempt succeeds at the start of that unit's next turn, provided the
    unit is still in base contact with the beast. The beast is freed
    immediately.

    The attempt fails if, before then, the unit flees, is destroyed, is moved
    away for any reason, or is engaged in close combat. A unit already in
    close combat may not begin an attempt.

    Only Lizardmen units may free a beast. Chaos Dwarf units may not.
  ]

  #special-rule[The Stampede][
    A freed beast is not a Lizardmen unit. It is a terrified animal loose in a
    burning camp, and it treats every model of both armies as an enemy.

    At the start of each game turn, before either player moves, roll for every
    freed beast that is not engaged in close combat, resolving the Great Beast
    first. Roll the Scatter dice and 2D6:

    - *Arrow:* the beast moves 2D6" in that direction.
    - *Hit:* the beast moves 2D6" towards the nearest unit it can see.

    If the move brings the beast into contact with a unit, it counts as having
    charged that unit, and the combat is fought in that turn's Close Combat
    phase as normal. If the move would take the beast into impassable terrain
    or off the table, it stops 1" short.

    A freed beast fights and pursues as normal. It never flees and never
    breaks. It does not roll for random movement in a turn in which it begins
    engaged.
  ]

  #special-rule[Killing a Beast][
    A freed beast may be attacked by either army under the normal rules. A
    slain beast is worth no victory points to either player, and the Lizardmen
    gain nothing from a corpse.
  ]

  #to-be-decided[
    Open questions for the table:

    - Is a full turn in base contact too slow, given six turns and a 10"
      jungle deployment? A faster alternative: base contact at the end of the
      Movement phase, then roll a D6, freeing the beast on a 4+, retrying
      each turn.
    - Do the beast profiles hold up at 1,500 points? The Great Beast is
      pitched at roughly Stegadon weight and could flatten a hero-only
      warband on a bad scatter.
    - Should scatter distance stay 2D6" for both, or go to 3D6" for the
      Lesser Beasts to make them wilder and harder to aim at anyone?
    - May the Chaos Dwarfs act on the beasts at all: reinforce chains, goad a
      beast into moving, or re-chain a freed one? As drafted they cannot, and
      their only play is holding the pens.
    - Are the deployment zones right? Lizardmen encircling the camp is the
      correct picture, but it may be a heavy advantage, especially if they
      also win the roll for the first turn.
  ]
]

#aftermath(draft: true)[
  #to-be-decided[
    Campaign consequences are not written yet. Sketches worth arguing about:

    - Beasts still chained at the end of the battle become Chaos Dwarf
      haulage, shortening their supply line and granting something concrete
      in a later scenario.
    - Beasts freed and alive return to the jungle owing a debt, and may come
      back on the Lizardmen side.
    - A slain beast is remembered kindly by nobody, and may sour the
      Lizardmen towards whoever struck the killing blow.
  ]
]
