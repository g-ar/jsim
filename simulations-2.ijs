NB. 17) https://math.stackexchange.com/questions/66077/how-to-find-the-expected-number-of-boxes-with-no-balls
   sim=: 13 : '+/~:?10#y'
   5-(+/%#)(([: +/ [: ~: [: ? 10 # ])"0)1e6#5  NB. ~ 0.536482
   
NB. 18) https://math.stackexchange.com/questions/818829/probability-in-cards-that-4-people-each-get-queen-and-king/
   sim=: 3 : 0
b=:4 13 $ (52?52){4#(i.13)
(0=+/0=+/"1 b=1)*.(0=+/0=+/"1 b=2)
)
   (+/%#)(sim"0)100000#0  NB. ~ 0.011

NB. 19) https://math.stackexchange.com/questions/823397/expected-value-and-dice
   m=:3
   sim =: 3 : 0
a=:1+?2#6
if. m < 0{a do.
0{a return. 
end.
1{a return.
)
   (+/%#)(sim"0)1e5#0  NB. ~ 4.25
   
NB. 20) https://math.stackexchange.com/questions/380004/i-roll-6-sided-dice-until-the-sum-exceeds-50-what-is-the-expected-value-of-the
   sim=: 3 : 0
a=: 1+?100#6
({.I.50<+/\a){a
)
   (+/%#)(sim"0)1e5#0  NB. ~ 4.33   
   
NB. 21) https://math.stackexchange.com/questions/733942/help-with-the-probabilty-of-rolling-two-ten-sided-dice-multiple-times-until-100
   m=:20
   sim=: 3 : '99<+/1+?m#10'
   (+/%#)(sim"0)1e5#0 NB. ~ 0.79188

NB. 22) https://math.stackexchange.com/questions/324387/two-dice-roll-questions-related-to-rolling-a-yahtzee
   sim=: 3 : 0
a=:5 1296 $ 1+?(1296*5)#6
0<+/4=+/0=2-/\a
)
   (+/%#)(sim"0)1e5#0 NB. ~ 0.6334
   
NB. 23) https://math.stackexchange.com/questions/684426/on-average-how-many-times-does-one-need-to-roll-three-fair-dice-to-get-a-sum-of
   sim=: 3 : 0
a=:3 100 $ 1+?(300)#6
1+{.I.10=+/a
)
   (+/%#)(sim"0)1e5#0 NB. ~ 8.01
   
NB. 24) https://math.stackexchange.com/questions/192177/how-many-times-to-roll-a-die-before-getting-two-consecutive-sixes
   sim=: 3 : 0
a=: 1+?400#6
2+{.I.2=2+/\6=a
)
   (+/%#)(sim"0)1e5#0 NB. ~ 42.06445
   
NB. 25)  If the above question is changed to getting a '5 6' instead
   sim=: 3 : 0
a=: (?400#6){ 1 2 4 8 16 32  NB. faces are numbered like this so as to get a unique difference
2+{.I._16=2-/\a
)
   (+/%#)(sim"0)1e5#0 NB. ~ 36.074 ( ans : 36 )

NB. 26) https://math.stackexchange.com/questions/28905/expected-time-to-roll-all-1-through-6-on-a-die
   sim=: 3 : 0
a=: (1+?400#6)
1+{.I.6=+/\~: a
)
   (+/%#)(sim"0)1e5#0 NB. ~ 14.68
   
NB. 27) Suppose we wanted to know the expected number of throws till all 6 consecutive throws show up different faces :
   sim=: 3 : 0
a=: (?1000#6){ 1 2 4 8 16 32
6+{.I.63=6+/\a
)
    (+/%#)(sim"0)1e5#0 NB. ~ 83.15 ( ans: 416/4 = 83.2 )
    
NB. 28) https://math.stackexchange.com/questions/736211/how-many-times-does-a-single-fair-die-have-to-be-rolled-for-a-number-to-repeat
   sim =: 3 : '1+{.I.-.~:(1+?100#6)'
   (+/%#)(sim"0)1e5#0 NB. 3.77592
   
NB. 29) https://math.stackexchange.com/questions/369582/rolling-a-fair-die-4-times-what-is-the-probability-of-getting-an-increasing-seq
   sim=: 3 : '3=+/0>2-/\(1+?4#6)'
   (+/%#)(sim"0)1e5#0 NB. ~ 0.01197
   
NB. 30) https://math.stackexchange.com/questions/339484/three-equal-die-rolls-in-a-row-in-a-3-times-3-array
   diag=: (<0 1)&|:
   sim=: 3 : 0
a=:3 3 $ 1+?9#6
0<+/1=(+/"1 ~:"1 |:a),(+/"1 ~:"1 a),(+/ ~: diag a),(+/ ~: diag (|."1) a)
)
   (+/%#)(sim"0)1e5#0  NB. ~ 0.20375
NB. For the precise answer (i.e. counting the sample space instead of simulation):
   b=:((3 3 $ 1 + (9$6) #: ])"0) i.6^9
   +/((0 < [: +/ 1 = ([: +/"1 [: ~:"1 |:) , ([: +/"1 ~:"1) , ([: +/ [: ~: diag) , [: +/ [: ~: [: diag |."1)"2) b NB. 2046216, P=0.203044
   
NB. 31) https://math.stackexchange.com/questions/740336/the-probability-of-the-first-roll-having-the-highest-number-in-n-consecutive-rol
   n=:15
   sim=: 3 : 0
a=:1+?n#6
{.a=\:~a
)
   (+/%#)(sim"0)1e6#0  NB. ~ 0.180178
NB. converting it to a tacit definition gives eh? and oh!
   (+/%#)(([: ([: {. ] = \:~) 1 + [: ? 6 #~ ])"0)1e6#n