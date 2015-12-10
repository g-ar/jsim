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

