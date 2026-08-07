#import "template.typ": *

#show: scenario.with(
  title: [Tomb Raider],
  round: [Session 1 · Battle Two],
  sides: (
    ([The Empire],),
    ([Tomb Kings],),
  ),
  art: "art/session-1-battle-2.png",
  intro: [
    The armoury is ours. Steel in every fist that once held only chains. I
    should feel triumph, yet all I feel is the heat of what comes next. I
    know the ways of the forge: a fire left untended does not die, it
    gathers. When the masters return, they will flay us alive for our
    insolence. We cannot be standing here when they do.

    So we go down. There are old tunnels beneath the deep pits, older than
    the mine itself, where even the overseers dared not walk. The stench
    rising from them fills my flock with dread. Sigmar preserve us.

    This hall was not cut by dwarf hands. It was made by those who are
    Dead, and the Dead keep it. The ground shakes. Drums. Drums in the
    deep. Something stirs in the dark below. It knows we are here.
  ],
)

#armies[
  *1,400 points* per side: The Empire against the Tomb Kings.

  The Tomb Kings player must field a *Tomb Prince*.

  Campaign list rules apply:
  - "Heroes" only
  - Up to 15% rare
  - Hero budget: 350 points
  - One magic item worth a maximum of 25 points
]

#battlefield[
  The Tomb Kings board edge should have some raised hills and dais. In the
  centre of their deployment zone there is a small *grave marker*. Statues,
  rocks and tombs are spread out across the rest of the battlefield.

  #block(
    width: 100%,
    stroke: 1pt + gold,
    inset: 3pt,
    fill: parchment-dark,
    image("art/session-1-battle-2-map.png", width: 100%),
  )
]

#deployment[
  The players take turns deploying their units. Roll off to see who deploys
  first.

  The unit containing the Tomb Prince must be deployed within 12" of the grave
  marker, and can never leave that area.
]

#first-turn[
  The Empire takes the first turn.
]

#game-length[
  The game lasts for six turns, or until the entire Empire army has escaped,
  whichever comes first.
]

#victory[
  The Empire player must mark down how many points worth of units have escaped
  the map by the end of the game, counting each escaped unit as if it were at
  full strength. Record the number: it will matter in a future scenario. The
  more points escaped, the better.
]

#special-rules[
  #special-rule[Light at the End of the Tunnel][
    The Empire army is trying to flee the Chaos Dwarf mines through an old Tomb
    Kings crypt. Mark the Tomb Kings board edge with exits, spread evenly
    between each other. The middle exit is 12" wide; the others are 8" wide.
    These are the exits to the overworld.

    If an Empire unit moves into contact with an exit, it is removed from the
    game and counts as having escaped.
  ]

  #special-rule[Plunder the Vaults!][
    Each exit leads to a treasure vault before reaching the surface. At the end
    of the game, roll a D3 on the table below for each *unique* exit that an
    Empire unit has escaped through, to a maximum of one item per exit. The
    Empire player has acquired that item and may give it to an eligible
    character of their choice.

    #table(
      columns: (auto, 1fr),
      align: (center, left),
      table.header[D3][Plundered Item],
      [1], [Staff of Aeons _(Tomb Kings book)_],
      [2], [Bronze Sigil Sword, with +1 Attack],
      [3], [Orb of Ptra _(Tomb Kings book)_],
    )

    Reroll duplicate results. Each item may only be plundered once.

    The Bronze Sigil Sword can be combined with the Staff of Aeons into a
    polearm carrying all of their combined abilities.
  ]

  #special-rule[Guardian of the King][
    The Tomb Prince is guarding the yet to be resurrected king's sarcophagus.
    This is his first priority, and he will not go further than 12" from the
    grave marker for any reason.

    If he is forced to move outside of this range, he automatically stops 12"
    from the grave marker. If a pursuit move would take him outside of that
    range, he restrains instead. If he joins a unit, the same rules apply to
    that unit.
  ]

  #special-rule[The Tomb of the King][
    If the Tomb Prince is slain and an Empire unit escapes through the *middle*
    exit, they count as having plundered the tomb of the king. In addition to
    their *Plunder the Vaults!* rewards, they gain the following magic item:

    - Armour of Meteoric Iron
  ]

  #special-rule[Creeping Darkness][
    The dead are rising from their tombs with increasing speed, following the
    Empire army like a deadly tide. At the end of each turn, any Empire unit
    within 6" × the current turn number of their own table edge is immediately
    destroyed.

    #table(
      columns: (auto, 1fr, 1fr, 1fr, 1fr, 1fr, 1fr),
      align: center,
      table.header[Turn][1][2][3][4][5][6],
      [Destroyed within], [6"], [12"], [18"], [24"], [30"], [36"],
    )
  ]
]
