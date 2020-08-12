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

openOtherDoor: currentChoice [
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
| options first switch |

Chooser class >> new [
    ^self basicNew makeRandoms
]

firstChoice [
    ^first
]

secondAfterOpening: aNumber  [
    | candidate |
    candidate := options next.
    ^candidate = aNumber 
        ifTrue: [ options next ] 
        ifFalse: [ candidate ]
]

makeRandoms [
    options := SampleSpaceWithoutReplacement data: #(1 2 3).
    first := options next.
]

] "Chooser"


Object subclass: Play [
| doors chooser doSwitch choice |

Play class >> newWithSwitch: aBool  [
    ^self new 
        setDoors: Doors new
        Chooser: Chooser new
        Switch: aBool
]

setDoors: aDoors Chooser: aChooser Switch: aBool [
    doors := aDoors.
    chooser := aChooser.
    doSwitch := aBool.
]

makeChoice [
    | firstChoice openDoor |
    doSwitch 
        ifTrue: [
            firstChoice := chooser firstChoice.
            openDoor := doors openOtherDoor: firstChoice.
            choice := chooser secondAfterOpening: openDoor.
        ]
        ifFalse: [
            choice := chooser firstChoice.
        ].
    ^choice
]

isWin [
    ^doors isWinner: choice
]

] "Play"


Object subclass: Simulation [
| trials wins doSwitch |

Simulation class >> newWithTrials: aNumber Switch: aBool [
    ^self new setTrials: aNumber Switch: aBool
]

setTrials: aNumber Switch: aBool [
    trials := aNumber.
    doSwitch := aBool.
    wins := 0.
]

run [
    | play |
    trials timesRepeat: 
        [ play := Play newWithSwitch: doSwitch.
          play makeChoice.
          play isWin ifTrue: [ wins := wins + 1 ].
        ].
]

wins [
    ^wins
]

] "Simulation"


| test data trials |

"
data := '123456778'.
test := String streamContents: [:s |
    data do: [ :char |
    s nextPut: char]].

test displayNl.
"

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
               (test openOtherDoor: 1) displayNl ].

'# trials of Chooser' displayNl.
5 timesRepeat: 
             [ chooser := Chooser new.
               chooser firstChoice displayNl.
             ].
"

trials := 10000.

('# Running simulation with ', trials asString, ' trials of playing with no switch') displayNl.
test := Simulation newWithTrials: trials Switch: false.
test run.
('There were ', test wins asString, ' wins with no switch! ') displayNl.

('# Running simulation with ', trials asString, ' trials of playing with switch') displayNl.
test := Simulation newWithTrials: trials Switch: true.
test run.
('There were ', test wins asString, ' wins with switch! ') displayNl.






