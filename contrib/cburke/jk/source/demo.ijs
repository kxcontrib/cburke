NB. demo

require'socket qclient.ijs'

1 conew 'cqclient'
connect 'localhost';5101;'chris'

NB. create trade database
cmd 'trade:([]time:();sym:();price:();size:())'

cmd '`trade insert(09:30:00;`a;10.75;100)'
cmd '`trade insert(09:30:02;`b;9.43;200)'
cmd '`trade insert(09:30:03;`a;10.78;150)'

get 'trade'
col get 'trade'
col getf 'trade'

cmd '\l sp.q'
get 'sp'
col getf 'sp'

cmd '\l db/tickdemo'
col getf '10 # select from trade where sym=`IBM'
