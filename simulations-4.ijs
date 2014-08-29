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

NB. 46) https://math.stackexchange.com/questions/854612/the-probability-that-x-birthdays-lie-within-n-days-of-each-other
   freq=:(# , {.)/.~
   xx=:5
   nn=:150
   sim =: 3 : 0
a=:(i.365),?xx#365
b=:({."1 freq a)-1                     NB. the frequency list of the birthdays
0<+/xx=(nn+1)+/\(] ,~ ] }.~ nn -~ #)b  NB. add the last nn elements to the head, then we can easily get a running sum
)
   (+/%#)(sim"0)1e6#0
   
NB. 47) https://math.stackexchange.com/questions/861856/expected-number-of-parallel-tosses-where-each-coin-gets-heads-at-least-once-of   
   sim5=: 3 : '{.1+I.5=+/-.0=(+/\"1) 5 50 $ ?250#2'
   (+/%#)(sim5"0)1e5#0
   
NB. 48) https://math.stackexchange.com/questions/911571/probability-rolling-a-dice-5-times/
   sim =: 3 : 0
a=:1+?5#6
(+/+/1 2=/a)>(+/6=a)
)
   (+/%#)(sim"0)1e5#0
   