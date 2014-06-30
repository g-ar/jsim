NB. 32) https://math.stackexchange.com/questions/827938/calculate-the-probability-that-at-least-k-of-his-favourite-students-are-awarded   
   's n m k'=: 10 4 6 4
   a=: (m#1),(s-m)#0
   sim=: 3 : '(k-1)<+/n {.(s?s){a'
   (+/%#)(sim"0)1e5#0
   
NB. 33) https://math.stackexchange.com/questions/833911/probability-of-an-event-indicator-black-and-white-balls
   sim=: 3 : '1+{.I.0=((#a)?(#a)){a'
   a=:(30#1),(10#0)                  NB. 30 white, 10 black
   (+/%#)(sim"0)1e6#0
   
NB. 34) https://math.stackexchange.com/questions/835458/expected-value-of-two-successive-heads-or-tails-stuck-on-computation
   a=: 1,10#2                          NB. For p=1/11
   sim=: 3 : '2+{.I.0=2-/\(?100#11){a'
   (+/%#)(sim"0)1e6#0
   
NB. 35) https://math.stackexchange.com/questions/68541/probability-question-about-married-couples
   a=:(2#i.4)
   sim=: 3 : '0=+/0=2-/\((#a)?(#a)){a'
   (+/%#)(sim"0)1e5#0
   
NB. 36) https://math.stackexchange.com/questions/25568/expected-number-of-rolling-a-pair-of-dice-to-generate-all-possible-sums
   sim=: 3 : '1+{:I.~:+/(2 300)$1+?600#6'
   (+/%#)(sim"0)1e5#0
   
NB. 37) https://math.stackexchange.com/questions/838659/football-game-penalty-kicks-maximizing-winning-chances
   sim=: 3 : 0
b=:5 2 $ (? 10 # 10){0,0,8#1
if. (|2-/\2{+/\b)=3 do.
3 return.
elseif. (|2-/\3{+/\b)>1 do.
4 return.
elseif. (|2-/\4{+/\b)>0 do.
5 return.
elseif. (|2-/\4{+/\b)=0 do.
b=:25 2 $ (? 50 # 10){0,0,8#1
6+{.I.2|+/"1 b return. 
end.
)
   2*(+/%#)(sim"0)1e5#0
   
NB. 38) https://math.stackexchange.com/questions/656310/8-cards-are-drawn-from-a-deck-of-cards-without-replacement
   a=:(4#1+i.9),16#10
   sim=: 3 : '+/5}./:~(8?52){a'
   (+/%#)(sim"0)1e5#0

NB. 39) https://math.stackexchange.com/questions/842178/probability-of-modal-value-being-mode-when-rolling-dice
NB. Probability that the unique mode is 7 
NB. Using definitions from concrete math companion
   freq=: (# , {.)/.~
   mode=: ((= >./)@:({."1) # {:"1)@freq
   sim=: 3 : '((1 = #) * [: +/ 7 = ]) mode (?5#36){a'
   (+/%#)(sim"0)1e5#0
   
NB. 40) https://math.stackexchange.com/questions/846442/generating-function-probability-regaridng-coin-toss/
   sim=: 3 : 0
a=:?25#2
(0=+/6=6+/\a)*(8=+/0=a)
)
   (+/%#)(sim"0)1e6#0
   
NB. 41) https://math.stackexchange.com/questions/846315/using-markov-chain-to-find-average-and-probability/

(+/%#)(([: +/ i. = ?~)"0)1e6#10        NB. the average for (a)
(+/%#)((4 < [: +/ i. = ?~)"0)1e6#10    NB. the probability for (a)

NB. for case (b) using the optimal strategy
   nn=:10 
   sim=: 3 : 0
tot=:0
i=:0
a=:nn?nn
guess=:0
while. i<nn do. 
if. guess=i{a do. 
tot=:tot+1
guess=:guess+1
end. 
i=:i+1
end.
tot return.
)
   (+/%#)(sim"0)1e5#0     NB. expected # of correct guesses
   (+/%#) 4<(sim"0)1e5#0  NB. probability of at least 5 correct guesses
   
NB. 42) https://math.stackexchange.com/questions/847763/drawing-previously-undrawn-cards-from-a-deck/
   sim=: 3 : 0
a=:(12#0),(7#1)       NB. y=19, x=12
n=:0
while. n<(nth-1) do.  NB. checking nth pick
a=:(1) (?#a)}a
n=:n+1
end.
0=(?#a){a
)
   nth=:7
   (+/%#)(sim"0)1e5#0 NB. close to 408146688/893871739 ~ 0.4566
   
NB. 43) http://math.stackexchange.com/questions/849751/non-geometric-way-to-calculate-expected-value-of-breaks
   sim=: 3 : '\:~2-/\\:~0,1,?3#0'   NB. stick broken at 3 points
   (+/%#)(sim"0)1e5#0               NB. gives expected lengths of maximum, next highest, etc. till minimum.