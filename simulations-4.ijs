NB. 44) https://math.stackexchange.com/questions/850244/asymptoticly-how-many-random-students-do-i-have-to-mark-before-ive-marked-two
   nn=:20
   sim=: 3 : 0
a=:nn?nn
i=:0
b=:nn#0
while. i<nn do.
b=:b+(a=i)
if. 0<+/2=2+/\b do.    NB. see if two consecutive boxes are filled
i+1 return.
end.
i=:i+1
end.
i return.
)
   (+/%#)(sim"0)1e5#0

NB. 45) https://math.stackexchange.com/questions/850857/an-archery-game
   a=:(75#1),25#0
   b=:(86#1),14#0
   sim=: 3 : 0
ta=:I.10=10+/\(?1000#100){a   NB. If we want to check for consecutive hits
tb=:I.12=12+/\(?1000#100){b
({.ta)=(2+{.tb)
)
   (+/%#)(sim"0)1e5#0  
   
   sim=: 3 : 0
ta=:I.10=+/\(?200#100){a      NB. If hits need not be consecutive
tb=:I.12=+/\(?200#100){b
({.ta)=({.tb)
)
   (+/%#)(sim"0)1e5#0

