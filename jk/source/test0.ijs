NB. test0

cocurrent 'base'
coreset ''
dbstops''
dbg 1
sdcleanup_jsocket_''

HOST=: 'genie'
locQ_z_=: 1 conew 'cqclient'
connect HOST;5001;'chris'
cmd 'trade:([]time:();sym:();price:();size:())' NB. create trade database
cmd '`trade insert(09:30:00;`a;10.75;100)'
smoutput get 'trade'
smoutput getx 'trade'