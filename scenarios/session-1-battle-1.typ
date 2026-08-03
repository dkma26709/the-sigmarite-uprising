#import "template.typ": *

#show: scenario.with(
  title: [The 14#super[th] Lizardmen Incursion],
  round: [Session 1 · Battle One],
  sides: (
    ([Chaos Dwarfs],),
    ([Lizardmen],),
  ),
  art: "art/session-1-battle-1.png",
  intro: [
    #text(weight: 700, style: "normal", fill: iron)[The thoughts of Zhaitrak the Meat Merchant:]

    Those damnable slaves. Someone put them up to this! Some political rival
    is trying to sabotage my reputation, and when I root them out, I will
    personally negotiate the price of their hide. In instalments!

    It should never have gotten this far. If those idiot Fireglaives had not
    distracted me mid-incantation, I would have swept that filth back into
    the pits. But let us not panic, they are still inside the fortress, and
    they have nowhere to go.

    Still, a lid must go on this before word climbs the ziggurat. Rumours
    compound like debts, and "armed uprising" is the sort of phrase that ends
    with someone in the Infernal Guard. Worse yet, the lizards have crawled
    from their jungle again and overwhelmed one of my lumber outposts. The
    lumber bleeds money by the hour; the slaves are penned in, accruing no
    interest.

    So: first the lizards. Then the slaves.
  ],
)

#armies(draft: true)[
  *1,500 points* per side: Chaos Dwarfs against Lizardmen.

  Campaign list rules apply:
  - "Heroes" only
  - Up to 15% rare
  - Hero budget: 350 points
  - One magic item worth a maximum of 25 points
]

#battlefield(draft: true)[
  The battlefield is defined by a ruined temple complex in the centre. Mark
  the four artefacts with tokens (see *The Four Artefacts*).

  #block(
    width: 100%,
    stroke: 1pt + gold,
    inset: 3pt,
    fill: parchment-dark,
    image("art/session-1-battle-1-map.png", width: 100%),
  )

  #special-rule[High Ground][
    After deployment, the Chaos Dwarf player may place one hill in their
    deployment zone.
  ]
]

#deployment[
  Deployment follows the standard rules.
]

#first-turn[
  The Chaos Dwarfs take the first turn.
]

#game-length[
  The game ends after six turns.
]

#special-rules(draft: true)[
  #special-rule[The Four Artefacts][
    Four artefacts are located within the ruined temple. The first three are
    ancient magical objects that the Chaos Dwarfs intend to dismantle and
    reforge. The fourth is the *Crystalline Skull*, an object too valuable
    and unstable to destroy.
  ]

  #special-rule[Seizing an Artefact][
    The Chaos Dwarf player can attempt to pick up an artefact if they have at
    least one eligible unit within 3" of its marker and there are no enemy
    units within 3". This is done at the end of the movement phase.

    When attempting to pick up an artefact, roll a D6. On a *4+* the roll is
    successful and the artefact is picked up. Put the marker next to the
    unit; it now controls the artefact.

    If the roll fails, consult the trap table using the rolled value. Trap
    hits are distributed as shooting attacks and may cause Panic as normal.
    Traps only fire once. The artefact remains in place and may be attempted
    again during a later turn.

    #table(
      columns: (auto, 1fr),
      align: (center, left),
      table.header[Failed roll][Trap],
      [3], [D6 Strength 3 magical hits],
      [2], [D6 Strength 4 magical hits],
      [1], [2D6 Strength 4 magical hits],
    )
  ]

  #special-rule[Eligible Units][
    A unit is eligible if it:
    - has a Unit Strength of at least 5,
    - is not fleeing,
    - is not a War Machine or Swarm.
  ]

  #special-rule[Dropping an Artefact][
    A unit immediately drops the artefact if it flees for any reason or is
    destroyed. The Lizardmen player places the artefact token within 1" of
    the unit before any flee move is made.
  ]
]

#aftermath(draft: true)[
  #special-rule[The Furnaces of Zharr][
    After the battle, the Chaos Dwarf player makes one roll on the following
    table for each of the *first three* artefacts in their control at the
    game's end. Do not roll for the Crystalline Skull.

    #table(
      columns: (auto, 1fr),
      align: (center, left),
      table.header[D3][Reforged Artefact],
      [1], [Ruby Ring of Ruin],
      [2], [Zzharg Madeye's Blunderbuss],
      [3], [Daemonbinder Armour],
    )

    Reroll duplicate results. Each item may only be forged once.
  ]

  #special-rule[Daemonbinder Armour][
    When the Daemonbinder Armour is forged, immediately make one roll on the
    *Random Gifts of the Gods* table for the daemon imprisoned within it.
    Record the result permanently.

    The bearer of the Daemonbinder Armour receives the effect of that Gift
    while wearing the armour. If the armour passes to another bearer later in
    the campaign, the Gift remains the same because it belongs to the bound
    daemon rather than the wearer.
  ]
]
