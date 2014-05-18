https://math.stackexchange.com/questions/779585/expected-number-of-spins
   a=.1 2 2 3 3 3 4 4 4 4
   sim=: 3 : 0
1+{:I.~:(?200#10){a
)
   (+/%#)(sim"0)1000000#0

https://math.stackexchange.com/questions/2763/what-is-the-expected-number-of-runs-of-same-color-in-a-standard-deck-of-cards
   sim=: 3 : '52-+/0=2-/\(52?52){a'
   (+/%#)(sim"0)100000#0   NB. 27
   
   
https://math.stackexchange.com/questions/644342/probability-of-two-tens-in-a-random-shuffled-deck-of-cards
   a=.(4#10),28#0
   sim=: 3 : '20=+/(16?32){a'
   (+/%#)(sim"0)100000#0   NB. 0.40307
   
https://math.stackexchange.com/questions/743154/combining-random-cards-from-two-decks-and-calculating-probability   
   a=.4#i.13
   sim=: 3 : '1=+/0=(2?52){((2?52){a),a'
   (+/%#)(sim"0)100000#0 NB. 0.14789
   
https://math.stackexchange.com/questions/706024/2-player-dice-game-probability
    sim=: 3 : '(+/1+?6#6)>(+/1+?9#4)'
    (+/%#)(sim"0)100000#0 NB. 0.35643
    
	
https://math.stackexchange.com/questions/743602/how-many-random-cards-picks-with-replacement-are-required
    simdice=: 3 : '3<+/~:1+?8#6'  
    simcards=: 3 : '38<+/~:1+?82#52'
    (+/%#)(simdice"0)100000#0
    (+/%#)(simcards"0)100000#0

https://math.stackexchange.com/questions/798475/spinners-from-yesteryear-a-challenging-probability-problem
   a=: 6#0
   sim =: 3 : 0
lst=:(?200#10){b
low=:({.I.5=+/\0=lst),({.I.5=+/\1=lst),({.I.5=+/\2=lst),({.I.5=+/\3=lst),({.I.5=+/\4=lst),({.I.5=+/\5=lst)
ind=.I.(<./low)=low
a=: (>:ind{a) (ind) } a
)
   kk=:(sim"0)100000#0  NB. answer in a

https://math.stackexchange.com/questions/795955/probability-question-with-coins
   sim=: 3 : 0
a=.?100#2
b=.?100#2
({.3+I.3=3+/\a)<({.2+I.2=2+/\b)
)
   (+/%#)(sim"0)100000#0
   
https://math.stackexchange.com/questions/798412/expected-value-of-a-sum-of-a-10-sided-die
   sim=: 3 : '(] {~ [: {. [: I. 100 < ])+/\1+?100#10'
   (+/%#)(sim"0)100000#0
