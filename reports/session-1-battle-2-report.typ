#import "../scenarios/template.typ": *

#show: scenario.with(
  title: [Tomb Raider],
  round: [Session 1 · Battle Report],
  sides: (
    ([The Empire],),
    ([Tomb Kings],),
  ),
  status: [Not yet fought],
  cover: false,
  intro: [
    _The result, in one paragraph, once the battle has been fought._
  ],
)

#battlefield-and-deployment[
  #photo("/reports/photos/session-1-battle-2-deployment.jpg", height: 10cm)[
    The crypt after deployment, before the Empire's first turn.
  ]

  The Sigmarites deploy their greatswords and warrior priest in the centre,
  with the state troops on their flank. The outriders are vanguarded forward
  to fire a volley in turn one.

  The Tomb Kings answer with a horde of archers and a catapult on the hill
  behind them. Some sneaky chariots are placed on the far flank to give the
  humans a nasty surprise later in the battle.
]

#the-battle[
  #photo("/reports/photos/session-1-battle-2-turn-1.jpg", height: 10cm)[
    The end of the Empire's first turn.
  ]

  #turn(1, side: [The Empire])
  The Empire marches its centre forward to close the gap to the enemy army
  and to get away from the darkness behind them. The outriders stand still,
  training their repeater handguns on the liche priest's unit. Killing that
  unit would be a massive advantage.

  In the magic phase Emmerich sees the opportunity and casts _Enchanted
  Blades of Aiban_ on the outriders.

  The outriders open fire with devastating efficiency, killing the entire
  unit. The liche priest, however, survives.

  #turn(1, side: [Tomb Kings])
  After the initial devastating barrage, it is the Tomb Kings' turn to
  respond. The chariots move silently along the flank, and the liche priest
  retreats to the safety of the battle line.

  In anger he summons the power of the old kings and casts _Ptra's
  Incantation of Righteous Smiting_ on the archer horde.

  The archers use their newfound magical ability to destroy the outriders,
  but critically _one_ outrider survives. The screaming skull catapult sends
  a shot into the greatswords, killing many. They hold, however.

  #turning-point[
    _The single decision, charge or dice roll that decided it._
  ]
]

#the-result[
  _Who won and by what measure: victory conditions met, and the state of
  both warbands at the end._
]

#casualties[
  _Every hero eliminated during the battle, and the D6 rolled for them at
  the end. On a 1 they are dead._

  #death-rolls()
]

#spoils[
  _Equipment scavenged mid-battle, magic items seized, and any boon the gods
  granted. Name the hero who now carries each item so the army sheets can be
  updated to match._
]

#consequences[
  _What this means for the campaign: standings, how the warbands have
  changed, and the hook into the next battle. The session log in the
  Campaign Reference summarises this section._
]

#notes-from-the-table[
  _Out of character: the rules questions that came up, what the scenario's
  special rules did well or badly, and anything to change next session._
]
