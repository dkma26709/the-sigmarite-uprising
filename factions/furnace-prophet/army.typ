#import "../../scenarios/template.typ": *

#show: army-sheet.with(
  name: [The Host of the Furnace Prophet],
  faction-type: [Empire],
  lore: [
    _They were not soldiers. They were cargo._

    Farmhands taken in raids, crusaders taken in defeat, whole villages
    marched east in coffles because the ledgers of Zharr demanded flesh. In
    the slave pens of the Dark Lands, men did not pray. Prayer was beaten out
    of them along with hope, along with names. There was only the heat, the
    whip, and the chains biting into raw wrists.

    And then there was Sigwald Eisenfaust. They chained him to the
    daemon-forge itself. But the fire that was meant to break him spoke
    instead. He came out of the flames with scorched skin and burning eyes,
    and he told them what Sigmar had shown him: they had not been abandoned.
    Steel is sent to the forge not to destroy it, but to form it.

    Now the Furnace Prophet leads his flock of the freed. To his right
    marches Bruno Steinhauer, the Chainbreaker, his banner stitched from the
    rags of the pens and crowned with the shattered cuffs that once bound
    them. To his left walks Emmerich Goldhand, the slave whose chains turned
    to lead and snapped when the wind of Chamon awoke in him.

    They fight because the pens are still full and the furnaces still burn.
    The Tempered are free and they intend to make freedom permanent.
  ],
)

#hero(
  [Sigwald "Furnace Prophet" Eisenfaust],
  unit-type: [Warrior Priest of Sigmar],
  profile: (4, 4, 3, 4, 4, 2, 4, 2, 8),
  equipment: ([Hand weapon], [Heavy armour], [Shield]),
  special-rules: ([Battle Prayers of Sigmar], [Righteous Fury]),
)

#hero(
  [Bruno "Chainbreaker" Steinhauer],
  unit-type: [Captain],
  profile: (4, 5, 5, 4, 4, 2, 5, 3, 8),
  equipment: ([Hand weapon], [Heavy armour], [Shield]),
  special-rules: ([Hold the Line], [Battle Standard Bearer]),
)

#hero(
  [Emmerich Goldhand],
  unit-type: [Battle Wizard],
  profile: (4, 3, 3, 3, 3, 2, 3, 1, 7),
  equipment: ([Hand weapon],),
  special-rules: ([Level 2 Wizard, Lore of Metal],),
  wounds: [
    _Shell shocked:_ If Emmerich was hit by artillery in the previous turn,
    at the start of the magic phase he must pass a Leadership test on his
    own unmodified Leadership. If he fails, he cannot channel.
  ],
)
