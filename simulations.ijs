NB. 1) https://math.stackexchange.com/questions/779585/expected-number-of-spins
   a=.1 2 2 3 3 3 4 4 4 4
   sim=: 3 : 0
1+{:I.~:(?200#10){a
)
   (+/%#)(sim"0)1000000#0

NB. 2) https://math.stackexchange.com/questions/2763/what-is-the-expected-number-of-runs-of-same-color-in-a-standard-deck-of-cards
   sim=: 3 : '52-+/0=2-/\(52?52){a'
   (+/%#)(sim"0)100000#0   NB. 27
   
   
NB. 3) https://math.stackexchange.com/questions/644342/probability-of-two-tens-in-a-random-shuffled-deck-of-cards
   a=.(4#10),28#0
   sim=: 3 : '20=+/(16?32){a'
   (+/%#)(sim"0)100000#0   NB. 0.40307
   
NB. 4) https://math.stackexchange.com/questions/743154/combining-random-cards-from-two-decks-and-calculating-probability   
   a=.4#i.13
   sim=: 3 : '1=+/0=(2?52){((2?52){a),a'
   (+/%#)(sim"0)100000#0 NB. 0.14789
   
NB. 5) https://math.stackexchange.com/questions/706024/2-player-dice-game-probability
    sim=: 3 : '(+/1+?6#6)>(+/1+?9#4)'
    (+/%#)(sim"0)100000#0 NB. 0.35643
    
	
NB. 6) https://math.stackexchange.com/questions/743602/how-many-random-cards-picks-with-replacement-are-required
    simdice=: 3 : '3<+/~:1+?8#6'  
    simcards=: 3 : '38<+/~:1+?82#52'
    (+/%#)(simdice"0)100000#0
    (+/%#)(simcards"0)100000#0

NB. 7) https://math.stackexchange.com/questions/798475/spinners-from-yesteryear-a-challenging-probability-problem
   a=: 6#0
   sim =: 3 : 0
lst=:(?200#10){b
low=:({.I.5=+/\0=lst),({.I.5=+/\1=lst),({.I.5=+/\2=lst),({.I.5=+/\3=lst),({.I.5=+/\4=lst),({.I.5=+/\5=lst)
ind=.I.(<./low)=low
a=: (>:ind{a) (ind) } a
)
   kk=:(sim"0)100000#0  NB. answer in a

NB. 8) https://math.stackexchange.com/questions/795955/probability-question-with-coins
   sim=: 3 : 0
a=.?100#2
b=.?100#2
({.3+I.3=3+/\a)<({.2+I.2=2+/\b)
)
   (+/%#)(sim"0)100000#0
   
NB. 9) https://math.stackexchange.com/questions/798412/expected-value-of-a-sum-of-a-10-sided-die
   sim=: 3 : '(] {~ [: {. [: I. 100 < ])+/\1+?100#10'
   (+/%#)(sim"0)100000#0

NB. 10) https://math.stackexchange.com/questions/800406/broken-trucks-at-a-road
   sim=: 3 : '2=+/(2-/\\:~?3#0)>d'
   d=.1%5
   (+/%#)(sim"0)100000#0
   
NB. 11) https://math.stackexchange.com/questions/801470/extracting-balls-from-a-basket-until-all-have-the-same-colour
   'm n'=: 4 7
   sim=: 3 : '(m+n)-({:I.~:((m+n)?(m+n)){(m#0),(n#1))'
   (+/%#)(sim "0)100000#0

NB. 12) https://math.stackexchange.com/questions/749336/k-items-in-n-buckets-number-of-buckets-with-at-least-2-items
NB. For probability 
   'k N'=: 11 15
   sim=: 3 : '0<+/0=~:?k#N'
   (+/%#)(sim"0)100000#0
   
NB. 13) https://math.stackexchange.com/questions/811516/probability-that-yz-1-xz-2/   
   sim=: 3 : 0
((1+?20)*(?10))>((1+?30)*(?10))
)
   (+/%#)(sim"0)100000#0
   
NB. 14) Probability that sum of num^6 < 1, 10 numbers taken from uniform distribution 
NB. See the sage code file for the analytical solution
   sim=: 3 : '1>+/(?10#0)^6'
   (+/%#)(sim"0)100000#0
NB. Equivalently, for much faster execution, we could take a 2D array and take marginal sum and average
   'n k'=: 10 6
   a=:(n, 1e6) $ ?(n*1e6)#0
   (+/%#)1>+/a^k NB. = 0.313613   

NB. 15) https://math.stackexchange.com/questions/816803/probability-of-lies-a-point-in-a-random-triangle
   0.5*(+/%#)(([: | [: -/ .* (3 1 $ 1) ,.~ 3 2 $ [: ? 6 # ])"0) 1000000#0 NB. A terse way in J !
NB. If a more verbose way is required, but this takes about four times longer to execute.
    det=: -/ .*                               NB. Computes determinant of a matrix (for area of traingle)
    sim=: 3 : '| det (3 2 $ ?6#0),. 3 1 $ 1'  NB. Get absolute value of area
    0.5 * (+/%#)(sim"0)1000000#0              NB. Half the average for a million trials 
