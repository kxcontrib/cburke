NB. toq
NB.
NB. convert j data to q

NB. =========================================================
NB. function, parameter list to Q
ftoQ=: 3 : 0
msg=. toQ boxxopen y
(2 ic 8 + #msg), msg
)

NB. =========================================================
toQ=: 3 : 0
'typ dat'=. qtype y
select. typ
case. 0 do.
  r=. (ALPH0,ALPH0),(2 ic #y),; toQ each dat
case. 98 do.
  r=. toQ_flip dat
case. 99 do.
  r=. toQ_dict dat
case. do.
  len=. $dat
  select. #len
  case. 0 do. hdr=. (256 - typ) { a.
  case. 1 do. hdr=. ((typ,0) { a.),2 ic len
  case. do. throw 'rank: ',":len
  end.
  hdr,typ toQ_base dat
end.
)

NB. =========================================================
toQ_base=: 4 : 0
select. | x - 256 * 128 < x
case. 1 do. y { a.
case. 4 do. y
case. 5 do. 1 ic y
case. 6 do. 2 ic y
case. 7 do. toQ_long y
case. 8 do. 1 fc y
case. 9 do. 2 fc y
case. 10 do. y
case. 11 do. toQ_varchar y
case. 13 do. 2 ic y
case. 14 do. 2 ic y
case. 15 do. 2 fc y
case. 17 do. 2 ic y
case. 18 do. 2 ic y
case. 19 do. 2 ic y
case. do. throw 'type: ',":x
end.
)

NB. =========================================================
NB. dict
toQ_dict=: 3 : 0
if. 2=#$y do.
  key=. {."1 y
  typ=. ~. 3!:0 &> key
  if. *./ (1 = #typ), typ ~: 2 do.
    key=. toQ ; key
  else.
    key=. toQ key
  end.
  dat=. key,toQ {:"1 y
else.
  dat=. ; toQ each y
end.
(99{a.),dat
)

NB. =========================================================
toQ_long=: 3 : 0
neg=. y < 1
dat=. y + neg * 2^56x
dat=. (255*neg) ,"0 1 (7#256) #: dat
,|."1 dat { a.
)

NB. =========================================================
NB. table
toQ_flip=: 3 : '(98 0{a.),toQ_dict |:y'

NB. =========================================================
toQ_varchar=: 3 : 0
if. issymbol y do.
  2 s: y
else.
  ; (boxxopen y) ,each ALPH0
end.
)
