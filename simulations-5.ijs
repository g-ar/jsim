NB. 56) https://math.stackexchange.com/questions/1485546/how-many-tickets-should-i-buy-to-win-a-prize-in-lottery
    a =: (55#1),(35#2),10#3
    sim=: 3 : '>:{:I.~:(?y#y){a'
    (+/%#)(sim"0)1e6#100