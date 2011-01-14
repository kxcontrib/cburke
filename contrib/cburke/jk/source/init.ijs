NB. init

coclass 'cqclient'
coinsert 'jsocket'

NB. =========================================================
create=: 3 : 0
if. 1 = {.y do.
  makezfns''
end.
EMPTY
)

NB. =========================================================
destroy=: 3 : 0
disconnect''
codestroy''
)
