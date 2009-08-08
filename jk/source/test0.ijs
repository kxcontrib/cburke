NB. test0

cocurrent 'base'
coreset ''
dbstops''
dbg 1
sdcleanup_jsocket_''

HOST=: 'localhost'
locQ_z_=: 1 conew 'cqclient'
connect HOST;5001;'chris'

NB. cmd 'trade:([]time:();sym:();price:();size:())' NB. create trade database
NB. cmd '`trade insert(09:30:00;`a;10.75;100)'
NB. smoutput get 'trade'
NB. smoutput getx 'trade'

