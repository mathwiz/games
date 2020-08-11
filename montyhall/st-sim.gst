Object subclass: Doors [
| left center right |

Doors class >> new [
    | rand newDoors |
    rand := SampleSpaceWithoutReplacement data: #(true false false).
    newDoors := self basicNew.
    newDoors left: rand next.
    newDoors center: rand next.
    newDoors right: rand next.
    ^newDoors
]

left [
    ^left
]

center [
    ^center
]

right [
    ^right
]

left: aBool [
    left := aBool
]

center: aBool [
    center := aBool
]

right: aBool [
    right := aBool
]

asString [
    | format |
    format := [ :x | x
                      ifTrue: [ '*' ]
                      ifFalse: [ '_' ] ].

    ^format value: (self left), format value: (self right), format value: (self right)
]

] "Doors"


| test |

test := Doors new.
test left displayNl.
test center displayNl.
test right displayNl.

10 timesRepeat: 
             [ test := Doors new. 
               test asString displayNl. ].

