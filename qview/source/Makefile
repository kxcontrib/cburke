# qview makefile

MS=$(shell getconf LONG_BIT)

WALL=-Wall

SRC=$(wildcard *.c)
OBJ=$(SRC:%.c=%.o)
Q=~/q/l$(MS)

CFLAGS=-g -O -fPIC -m$(MS) -shared
LIBS=`pkg-config --cflags --libs glib-2.0 gtk+-2.0 gthread-2.0`
TGT=$(Q)/qview.so

all: clean $(OBJ)
	gcc $(WALL) $(CFLAGS) $(OBJ) $(LIBS) -o $(TGT)
	chmod 644 $(TGT)
	ls -l $(TGT)

%.o: %.c
	gcc $(WALL) $(CFLAGS) $(LIBS) -c $<

cleanall: clean
	rm -rf $(OBJ)

clean:
	rm -rf $(TGT) *~
