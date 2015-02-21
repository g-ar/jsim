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
   
NB. 49) https://math.stackexchange.com/questions/953908/probability-that-the-sum-of-three-integer-numbers-from-1-to-100-is-more-than-1
    (+/%#) ((100 < [: +/ 1 + 3 ? ])"0) 1e6#100
    
NB. 50) https://math.stackexchange.com/questions/951236/probability-of-exactly-2-low-rolls-in-5-throws-of-a-die
   (+/2=(+/"1)3>1+6 6 6 6 6 #: i.(6^5)-1)%6^5   NB. direct count

   sim=: 3 : '2=+/3>1+?5#6'                     NB. simulation
   (+/%#)(sim"0)1e5#0

NB. 51) https://math.stackexchange.com/questions/1061083/average-time-to-fill-boxes-with-balls/
   'm n'=: 3 5
   sim=: 3 : 0
a=:m
c=:0
while. (a>0) do.
b=:+/~:?n#a
a=:a-b
c=:c+1
end.
c return.
)
    (+/%#)(sim"0)1e5#0
    
NB 52) https://math.stackexchange.com/questions/1097630/break-a-stick-into-2-expected-length-of-shorter-stick
   a=:?1e6#0
   (+/%#)<./"1 a,.(1-a)    
   
NB 53) https://math.stackexchange.com/questions/1157960/basic-card-dealing-probability
    a=:4#1,2,3,4
    sim=: 3 : '1=+/~:(3?16){a'
    sim2=: 3 : '11=+/(?3#16){a'
    sim3 =: 3 : '2=+/1=2-/\\:~(3?16){a'
    (+/%#)(sim"0)1e5#0
    (+/%#)(sim2"0)1e5#0
    (+/%#)(sim3"0)1e5#0