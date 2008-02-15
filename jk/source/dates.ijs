NB. dates

NB. =========================================================
fix_date=: 3 : 0
if. 0 (e.,) '.' = 4 7 {"1 y do. 10;y return. end.
msk=. y -:"1 JDATENULL
val=. (-.msk) # dat=. _1 ". ' ' 4 7 }"1 y
if. _1 (e.,) val do. 10;y return. end.
if. 0 e. valdate val do. 10;y return. end.
14;JINTNULL (I.msk) } (todayno dat) - 73048
)

NB. =========================================================
fix_datetime=: 3 : 0
if. 0 e. 'T' = 10 {"1 y do. 10;y return. end.
msk=. y -:"1 JDATETIMENULL
'rc dat'=. fix_date 10 {."1 y
if. rc=10 do. 10;y return. end.
'rc tim'=. fix_second 11 }."1 y
if. rc=10 do. 10;y return. end.
15;JFLOATNULL (I.msk) } dat + tim % 86400
)

NB. =========================================================
fix_minute=: 3 : 0
if. 0 e. ':' = 2 {"1 y do. 10;y return. end.
msk=. y -:"1 JMINUTENULL
val=. (-.msk) # dat=. _1 ". ' ' 2 }"1 y
if. _1 (e.,) val do. 10;y return. end.
cnt=. (-.msk) # dat=. 60 #. dat
if. (val -: 0 60 #:cnt) *. (cnt >: 0) *. cnt < 1440 do.
  17;JINTNULL (I.msk) } dat
else.
  10;y
end.
)

NB. =========================================================
fix_month=: 3 : 0
if. 0 e. '.m' -:"1 [ 4 7 {"1 y do. 10;y return. end.
msk=. y -:"1 JMONTHNULL
val=. (-.msk) # dat=. _1 ". ' ' 4 7 }"1 y
if. _1 (e.,) val do. 10;y return. end.
if. 0 e. valdate val,.1 do. 10;y return. end.
13;JINTNULL (I.msk) } 12 #. dat -"1[ 2000 1
)

NB. =========================================================
fix_second=: 3 : 0
if. 0 (e.,) ':' = 2 5 {"1 y do. 10;y return. end.
msk=. y -:"1 JSECONDNULL
val=. (-.msk) # dat=. _1 ". ' ' 2 5 }"1 y
if. _1 (e.,) val do. 10;y return. end.
cnt=. (-.msk) # dat=. 60 #. dat
if. (val -: 0 60 60 #:cnt) *. (cnt >: 0) *. cnt < 86400 do.
  18;JINTNULL (I.msk) } dat
else.
  10;y
end.
)

NB. =========================================================
fix_time=: 3 : 0
if. 0 (e.,) '::.' -:"1 [ 2 5 8 {"1 y do. 10;y return. end.
msk=. y -:"1 JTIMENULL
val=. (-.msk) # dat=. _1 ". ' ' 2 5 8 }"1 y
if. _1 (e.,) val do. 10;y return. end.
cnt=. (-.msk) # dat=. 0 60 60 1000 #. dat
if. (val -: 0 60 60 1000 #:cnt) *. (cnt >: 0) *. cnt < 86400000 do.
  19;JINTNULL (I.msk) } dat
else.
  10;y
end.
)

NB. =========================================================
fmt_date=: 3 : 0
res=. '.' 4 7 }"1 [ 4 3 3 ": 0 100 100 +"1 todate 73048 + ,y
JDATENULL (I. y= JINTNULL) } res
)

NB. =========================================================
fmt_datetime=: 3 : 0
res=. (fmt_date <. y),.'T',.fmt_second roundint 86400 * 1 | y
JDATETIMENULL (I. y= JFLOATNULL) } res
)

NB. =========================================================
fmt_minute=: 3 : 0
res=. ':' 2 }"1 }."1 [ 6j2 ": ,.100 ++/ 1 0.01 * |: 0 60 #: ,y
JMINUTENULL (I. y= JINTNULL) } res
)

NB. =========================================================
fmt_month=: 3 : 0
res=. 'm' ,.~ 7j2 ":,.2000 + +/1 0.01 * 0 1 + |: 0 12 #: ,y
JMONTHNULL (I. y= JINTNULL) } res
)

NB. =========================================================
fmt_second=: 3 : 0
res=. ':' 2 5 }"1 }."1 [ 3 ": 100 + 0 60 60 #: ,y
JSECONDNULL (I. y= JINTNULL) } res
)

NB. =========================================================
fmt_time=: 3 : 0
res=. '::.' 2 5 8 }"1 }."1 [ 3 3 3 4 ": 100 100 100 1000 +"1 [ 0 60 60 1000 #: ,y
JTIMENULL (I. y= JINTNULL) } res
)

