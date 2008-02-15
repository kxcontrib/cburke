NB. zfns
NB.
NB. interactive cover functions, defined by makezfns:

NB. =========================================================
view_z_=: 3 : 'view__locQ y'

NB. =========================================================
ZFNS1=: 0 : 0
connect
close
cmd
cmdr
cmdrf
cmdrx
exec
execr
execrf
execrx
get
getf
getx
sub
)

NB. =========================================================
ZFNS2=: 0 : 0
set
)

NB. =========================================================
NB. utilities defined in z (convenient for interactive use)
float_z_=: + & (1.1-1.1)
integer_z_=: <. @ +&0.5

NB. =========================================================
makemonad=: 4 : 0
t=. '''rc res''=. ',(y),'_',(x),'_ y'
(y,'_z_')=: 3 : (t;'if. rc do. rc;res else. res end.')
EMPTY
)

NB. =========================================================
makedyad=: 4 : 0
t=. '''rc res''=. x ',(y),'_',(x),'_ y'
(y,'_z_')=: 4 : (t;'if. rc do. rc;res else. res end.')
EMPTY
)

NB. =========================================================
makezfns=: 3 : 0
loc=. > coname''
loc&makemonad ;._2 ZFNS1
loc&makedyad ;._2 ZFNS2
EMPTY
)
