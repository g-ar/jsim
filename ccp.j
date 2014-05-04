NB. simulation for https://math.stackexchange.com/questions/779585/expected-number-of-spins

   a=.1 2 2 3 3 3 4 4 4 4
   sim=: 3 : 0
1+{:I.~:(?200#10){a
)
   (+/%#)(sim"0)1000000#0
