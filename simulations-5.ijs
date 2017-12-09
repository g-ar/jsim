NB. 56) https://math.stackexchange.com/questions/1485546/how-many-tickets-should-i-buy-to-win-a-prize-in-lottery
    a =: (55#1),(35#2),10#3
    sim=: 3 : '>:{:I.~:(?y#y){a'
    (+/%#)(sim"0)1e6#100

NB. 57) Seven boys and three girls are seated in a row. Find the number of ways of seating arrangements such that the boys get the end positions and no two girls are seated next to each other.
    lst=: (7#1),3#2
    sim=: 3 : 0
a=:(10?10){lst
(0=+/2=2+/\2=a)*(1=0{a)*(1=9{a)
)
    (+/%#)(sim"0)1e6#0

NB. 58) https://math.stackexchange.com/questions/2094936/expected-length-of-a-sequence
    a =: 0,i.7
    sim =: 3 : 0
>:{.I.4<+/\(?20#8){a
)
    (+/%#)(sim"0)1e6#0

NB. 59) https://puzzling.stackexchange.com/questions/57583/how-many-tries-to-roll-a-6
    sim =: 3 : 0
NB. a=.1+?100#6                                NB. roll dice 100 times
NB. b=.({."1)>:I.(1 3 5 6)=/a                  NB. Get the first indices of rolling 1, 3, 5, and a 6 in the list
NB. ({:b)*({:b)=<./b                           NB. If a 6 appears before any odd number, return its index, otherwise 0
    ({:*{:=<./)({."1)>:I.(1 3 5 6)=/1+?100#6   NB. Above 3 statements condensed to tacit form, runs a couple of seconds faster
)
    (+/%[:+/0<])(sim"0) 1e6#0                  NB. Take average of non-zero elements
