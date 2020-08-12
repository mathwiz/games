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

Doors class >> getAlternatives: doorNum [
    | sampler |
    doorNum = 1 ifTrue: [ sampler := SampleSpaceWithoutReplacement data: #(2 3) ].
    doorNum = 2 ifTrue: [ sampler := SampleSpaceWithoutReplacement data: #(1 3) ].
    doorNum = 3 ifTrue: [ sampler := SampleSpaceWithoutReplacement data: #(1 2) ].
    ^sampler
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

isWinner: doorNum [
    doorNum = 1 ifTrue: [ ^left ].
    doorNum = 2 ifTrue: [ ^center ].
    doorNum = 3 ifTrue: [ ^right ].
]

offerDoor: currentChoice [
    | alternatives alt |
    alternatives := self class getAlternatives: currentChoice.
    alt := alternatives next.
    (self isWinner: currentChoice)
        ifTrue: [ ^alt ]
        ifFalse: [ ^(self isWinner: alt)
                        ifTrue: [ alternatives next ] 
                        ifFalse: [ alt ]
        ]
]

asString [
    | format |
    format := [ :x | x
                      ifTrue: [ '*' ]
                      ifFalse: [ '_' ] ].

    ^(format value: self left), (format value: self center), (format value: self right)
]

] "Doors"


Object subclass: Chooser [
| first switch |

Chooser class >> new [
    ^self basicNew makeRandoms
]

firstChoice [
    ^first
]

switchChoice [
    ^switch
]

makeRandoms [
    | doors |
    doors := SampleSpaceWithoutReplacement data: #(1 2 3).
    first := doors next.
    switch := (SampleSpaceWithReplacement data: #(true false)) next.
]

] "Chooser"



| test chooser data  |

"
data := '123456778'.
test := String streamContents: [:s |
    data do: [ :char |
    s nextPut: char]].

test displayNl.
"
test := Doors new.
test left displayNl.
test center displayNl.
test right displayNl.
test asString displayNl.

chooser := Chooser new.

'# trials of Doors' displayNl.
10 timesRepeat: 
             [ test := Doors new. 
               test asString displayNl.
               (test offerDoor: 1) displayNl ].

'# trials of Chooser' displayNl.
5 timesRepeat: 
             [ chooser := Chooser new.
               chooser firstChoice displayNl.
             ].


