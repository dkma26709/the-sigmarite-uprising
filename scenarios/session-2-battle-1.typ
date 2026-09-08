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

#armies[
  *1,500 points* per side: Chaos Dwarfs against Lizardmen.

  Campaign list rules apply:
  - "Heroes" only
  - Up to 15% rare
  - Hero budget: 350 points
  - One magic item worth a maximum of 25 points

  The Sacred Beasts belong to neither army. They cost no points and are part
  of neither force. See *The Sacred Beasts*.
]

#battlefield[
  A temporary Chaos Dwarf work camp hacked out of dense jungle. The table is
  6 by 4 feet.

  The centre of the table is the camp: wooden beast pens, timber piles,
  wagons and hauling machinery, braziers and small furnaces, and the
  overgrown temple stones the Dawi-Zharr were too busy to level. Heavy chains
  lie strewn between the pens.

  Everything else is jungle: thick vegetation, ruins and scattered temple
  stones running out to every table edge.

  #block(
    width: 100%,
    stroke: 1pt + gold,
    inset: 3pt,
    fill: parchment-dark,
    image("art/session-2-battle-1-map.png", width: 100%),
  )

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

#deployment[
  Deployment order follows the standard rules.

  The Chaos Dwarfs deploy anywhere within the camp, which is everything more
  than 12" from a table edge: a 48" by 24" rectangle in the middle of a 72" by
  48" table.

  The Lizardmen deploy along the table edges. Each unit is placed with
  its rear rank touching a table edge, facing in towards the camp. They may
  use all four edges and split into as many separate groups as they wish: the
  jungle gives up its warriors from every side at once.

  Vanguard, Scouts and Ambushers work as normal.
]

#first-turn[
  The first turn is determined by the standard rules.
]

#game-length[
  The game ends after six turns.
]

#special-rules[
  #special-rule[The Sacred Beasts][
    Three beasts are chained in the camp: two Lesser Sacred Beasts and one
    Great Sacred Beast. They belong to neither player and are controlled by
    neither player.

    #table(
      columns: 10,
      align: center,
      table.header[Beast][M][WS][BS][S][T][W][I][A][Ld],
      [Lesser Sacred Beast], [5], [3], [0], [5], [5], [4], [2], [3], [5],
      [Great Sacred Beast], [5], [3], [0], [6], [6], [6], [2], [4], [6],
    )

    Both are *Monsters*, with natural armour of *4+*, and both are
    Unbreakable and Immune to Psychology.

    *Lesser Sacred Beast:* causes _Fear_.

    *Great Sacred Beast:* causes _Terror_.

    While chained, a beast may not move, may not attack, and does not fight
    back if attacked. A chained beast causes neither Fear nor Terror: it is
    penned, roped and plainly helpless. Those rules apply only once it is
    freed.
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

    At the start of each player turn, before that player moves, roll for every
    freed beast that is not engaged in close combat, resolving the Great Beast
    first. A freed beast therefore stampedes twice in every round.
    Roll the Scatter dice and 2D6, and move the beast 2D6" in the
    direction shown. On a Hit, use the small arrow printed on that face.

    If the beast's path takes it into a unit of either army, it stops there
    and engages that unit. It counts as having charged, and the combat is
    fought in the Close Combat phase as normal. If the path takes the
    beast into impassable terrain or off the table, it stops 1" short.

    A freed beast never flees and never breaks, and it never pursues a
    fleeing enemy. When the unit it is fighting flees or is destroyed, the
    beast simply stands where it is and stampedes again at the start of the
    next turn.
  ]

  #special-rule[Killing a Beast][
    The beasts are sacred. No Lizardmen model may harm one, whether chained or
    freed. Only the Chaos Dwarf player may attack them.

    The Lizardmen may still cast harmless spells on a beast: hexes, curses and
    other effects that slow, steer or hinder it are all allowed, so long as
    the spell does no damage.

    A Lizardmen unit that a stampeding beast engages therefore strikes no
    blows against it. Work out the combat resolution as normal.
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
