NB. defs

ALPH0=: {.a.
OK=: 0;EMPTY
THROW=: ''
TSDAY=: 864 * 10^11x

KSHORTNULL=: <.-2^15
KFLOATNULL=: 0 0 0 0 0 0 248 255 { a.
KREALNULL=: 0 0 192 255 { a.

JINTNULL=: <.-2^31
JFLOATNULL=: __
JLONGNULL=: -2^63x
JDATENULL=: 'nnnn.nn.nn'
JDATETIMENULL=: 'nnnn.nn.nnTnn:nn:nn.nnn'
JMINUTENULL=: 'nn:nn'
JMONTHNULL=: 'nnnn.nnm'
JSECONDNULL=: 'nn:nn:nn'
JTIMENULL=: 'nn:nn:nn.nnn'
JTIMESPANNULL=: 'nDnn:nn:nn.nnnnnnnnn'
JTIMESTAMPNULL=: 'nnnn.nn.nnDnn:nn:nn.nnnnnnnnn'

JFLOATNULL8=: 2 fc JFLOATNULL
JREALNULL4=: 1 fc JFLOATNULL

NB. =========================================================
NB. max records read at once
NB. Q aborts the connection if byte length of read is ~230K or more
NB. max read raw of 5000 at 20 bytes/record = 100K
NB. max read format of 4000 at 25 bytes/record = 100K
MAXREAD=: 5000
MAXREADF=: 4000

NB. =========================================================
NB. headers
endian=. a. i. {. 1 ic 1
ASYNC=: (endian,0 0 0) { a.
SYNC=: (endian,1 0 0) { a.
RESPONSE=: (endian,2 0 0) { a.

NB. =========================================================
NB. data types

j=. ];._2 (0 : 0)
boolean   1b                     b     1     1
byte      0xff                   x     4     1
short     23h                    h     5     2     0Nh
int       23                     i     6     4     0N
long      23j                    j     7     8     0Nj
real      2.3e                   e     8     4     0Ne
float     2.3                    f     9     8     0n
char      "a"                    c     10    1     " "
varchar   `ab                    s     11    *     `
timestamp 2003.03.23D08:31:53.x9 p     12    8     0Np
month     2003.03m               m     13    4     0Nm
date      2003.03.23             d     14    4     0Nd
datetime  2003.03.23T08:31:53    z     15    8     0Nz
timespan  5D08:31:53.x9          n     16    8     0Nn
minute    08:31                  u     17    4     0Nu
second    08:31:53               v     18    4     0Nv
time      09:10:35.000           t     19    4     0Nt
enum      `s$`b, where s:`a`b    *     20..  4     `s$..
)

't j c n s z'=. j <;.1~ '';firstones +./j~:' '

DATATYPES=: (<"1 toupper t) -.each ' '
DATANUMS=: 0 ". n
DATASIZES=: _ ". s
('i',each toupper each DATATYPES)=: DATANUMS
