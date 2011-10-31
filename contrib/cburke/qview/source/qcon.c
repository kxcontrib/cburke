/* qcon.c */

#include "main.h"
#include "qcon.h"

static int g2m[2], m2g[2];
static char *Qcmd;
static char PBUF[3];
static char *Qinit="";
static K Qres;
static K qcall(int d);
static void qp_initQ(char *s);
static int striota(char *s,char t);

/* callback for new thread */
K qcall(int d)
{
  int r;
  r=read(g2m[0],PBUF,2);
  if (Qres) r0(Qres);
  Qres=k(0,Qcmd,(K)0);
  r=write(m2g[1],PBUF,1);
  return (K)0;
}

K qp_init()
{
  if (pipe(g2m) == -1) return krr("pipe");
  if (pipe(m2g) == -1) return krr("pipe");
  sd1(g2m[0],qcall);
  qp_initQ(Qinit);
  return ki(0);
}

void qp_initQ(char *s)
{
  char *t;
  int blk,len,pos;
  len=strlen(s);
  pos=0;
  while (pos<len) {
    blk=striota(s+pos,'\n');
    t=g_strndup(s+pos,blk);
    k(0,t,(K)0);
    g_free(t);
    pos+=blk+1;
  }
}

/* execute character string in main thread */
K qx(char *s)
{
  int t;
  g_free(Qcmd);
  Qcmd=g_strdup(s);
  t=write(g2m[1],"1",1);
  t=read(m2g[0],PBUF,2);
  return r1(Qres);
}

/* execute function, argument in own thread */
K qxf(char *f,K p) {return k(0,f,p,(K)0);}

/* execute character string in own thread */
K qxs(char *s) {return k(0,s,(K)0);}

/* execute verb, argument in own thread */
K qxv(char *f,K p,K q) {return k(0,f,p,q,(K)0);}

int striota(char *s,char t)
{
  int i;for(i=0;;++i) if((s[i]==t)||(s[i]==0)) return i;
}

