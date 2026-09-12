#import "../../scenarios/template.typ": *

#show: army-sheet.with(
  faction-type: [Chaos Dwarfs],
  lore: [
    You may have heard of Zhatan the Black, but perhaps not of his lesser
    brother, Zhaitrak the Meat Merchant. Zhaitrak was never the most gifted
    of sorcerers, but what he lacked in infernal magical prowess, he more
    than made up for in dark merchantmanship. While most of his sorcerous
    kin deal in politics and arcane power, Zhaitrak trades in an equally
    potent form of influence: gold, raw materials, flesh... and debt.

    Zhaitrak's reputation as a procurer of rare and exotic goods is hellishly
    well earned. Whether you require something as mundane as common slaves
    for your dark halls, the five finest Bretonnian maidens for your most
    delightfully foul Slaaneshi rituals, or the Countess of Nuln's favourite
    pug(s) for the special feast occasion after an Ogre or an Ogress has
    shared food will join in happy gluttonous union. Zhaitrak will
    provide!... for a respectable price, of course.

    Should you also require an effective means of keeping your pack of
    manlings obedient and suitably diminutive, fear not: we have just the
    thing. The Chains of Subjugation, or the Cuffs of Subbing, will solve all
    your troublesome slave uprisings. Designed by Zhaitrak himself, they are
    guaranteed to keep your workforce compliant. Curiously, Warriors of Chaos
    devoted to Chaos Undivided or followers of Slaanesh always seem to
    snicker and ask whether they come in pink with fur trim. Perhaps there is
    a market worth investigating...
  ],
)

#hero(
  [Zhaitrak the Meat Merchant],
  unit-type: [Sorcerer-Priest],
  profile: (3, 4, 3, 3, 4, 2, 2, 1, 9),
  equipment: ([Hand weapon], [Heavy armour]),
  special-rules: (
    [Blackshard Armour], [Contempt], [Relentless], [Resolute],
    [Sorcerer's Curse],
  ),
  wounds: [
    _Magical scar:_ When rolling the Toughness test for Sorcerer's Curse,
    add +1 to the die roll.
  ],
)

#hero(
  [Mordruk Furnaceborn],
  unit-type: [Daemonsmith],
  profile: (4, 4, 4, 4, 4, 2, 2, 2, 9),
  equipment: ([Hand weapon],),
  special-rules: (
    [Blackshard Armour], [Contempt], [Relentless], [Resolute],
    [Sorcerer's Curse], [Infernal Engineer], [Stand Back Sir!],
  ),
  experience: [
    _Artillery Specialist:_ +1 BS when supporting Deathshriekers and
    Dreadquakes.
  ],
)

#hero(
  [Zhorak Coalheart],
  unit-type: [Daemonsmith],
  profile: (4, 4, 4, 4, 4, 2, 2, 2, 9),
  equipment: ([Hand weapon],),
  special-rules: (
    [Blackshard Armour], [Contempt], [Relentless], [Resolute],
    [Sorcerer's Curse], [Infernal Engineer], [Stand Back Sir!],
  ),
  experience: [
    _Artillery Specialist:_ +1 BS when supporting Deathshriekers and
    Dreadquakes.
  ],
)
