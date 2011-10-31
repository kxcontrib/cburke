/* kfmt.c */
/* format k column
 * Val  - character string for all grid
 * Valp - corresponding list of pointers into Val
 * Valn - corresponding list of numeric inf types
 * Valw - corresponding list of widths (done on first draw)
 * pVal - current position in Val when formatting
 * xVal - current position in Valp, Valw
 */

#include "main.h"
#include "grid.h"
#include "qcon.h"
#include "state.h"
#include "util.h"
#include "win.h"

#define p0W {strcpy(pVal,"0W");n=2;Valn[xVal]=1;}
#define n0W {strcpy(pVal,"-0W");n=3;Valn[xVal]=2;}
#define p0w {strcpy(pVal,"0w");n=2;Valn[xVal]=3;}
#define n0w {strcpy(pVal,"-0w");n=3;Valn[xVal]=4;}
#define null {strcpy(pVal,"");n=0;}

static int k1(K v);
static int k4(K v);
static int k5(K v);
static int k6(K v);
static int k7(K v);
static int k8(K p);
static int k9(K p);
static int k10(K p);
static int k11(K p);
static int kdate(K p);
static int klist(K p);

int kfmt(K p)
{
  switch(p->t){
    case 0 : return klist(p);
    case 1 : return k1(p);
    case 4 : return k4(p);
    case 5 : return k5(p);
    case 6 : return k6(p);
    case 7 : return k7(p);
    case 8 : return k8(p);
    case 9 : return k9(p);
    case 10 : return k10(p);
    case 11 : return k11(p);
    case 12 : return kdate(p);
    case 13 : return kdate(p);
    case 14 : return kdate(p);
    case 15 : return kdate(p);
    case 16 : return kdate(p);
    case 17 : return kdate(p);
    case 18 : return kdate(p);
    case 19 : return kdate(p);
  }
  if((p->t>19)&&(p->t<77))return kfmt(qxf("value",r1(p)));
  kerr("unsupported type for formatting");return FALSE;
}

int k1(K v)
{
  unsigned char *d;
  d=kG(v);
  DO(Rws,{
    pVal[0]="10"[d[i]=='\0'];
    pVal[1]='\0';
    Valp[xVal++]=pVal;
    pVal+=2;});
  return TRUE;
}

int k4(K v)
{
  int n;
  unsigned char *d;
  char fmt[]="0x%x";
  d=kG(v);
  DO(Rws,{
    n=sprintf(pVal,fmt,d[i]);
    Valp[xVal++]=pVal;
    pVal+=n+1;});
  return TRUE;
}

int k5(K v)
{
  int n;
  short int *d;
  char fmt[]="%d";
  d=kH(v);
  DO(Rws,{
    if (d[i]==wh) p0W
    else if (d[i]==-wh) n0W
    else if (d[i]==nh) null
    else n=sprintf(pVal,fmt,d[i]);
    Valp[xVal++]=pVal;
    pVal+=n+1;});
  return TRUE;
}

int k6(K v)
{
  int n,*d;
  char fmt[]="%d";
  d=kI(v);
  DO(Rws,{
    if (d[i]==wi) p0W
    else if (d[i]==-wi) n0W
    else if (d[i]==ni) null
    else n=sprintf(pVal,fmt,d[i]);
    Valp[xVal++]=pVal;
    pVal+=n+1;});
  return TRUE;
}

int k7(K v)
{
  int n;
  long long *d;
  char fmt[]="%lld";
  d=(long long*)kI(v);
  DO(Rws,{
    if (d[i]==wj) p0W
    else if (d[i]==-wj) n0W
    else if (d[i]==nj) null
    else n=sprintf(pVal,fmt,d[i]);
    Valp[xVal++]=pVal;
    pVal+=n+1;});
  return TRUE;
}

int k8(K v)
{
  char buf[30];
  char fmt[]="%0.Xf";
  int j,m,n,*s;
  float *e;

  m=0;
  e=(float *)kE(v);
  s=g_malloc0(Rws*sizeof(int));
  DO(Rws,{
    s[i]=(e[i]==wf)||(e[i]==-wf)||isnan(e[i]);
    if (!s[i]) {
      n=-1+sprintf(buf,"%0.6f",e[i]);
      for(j=0;j<6-m;j++)
        if (buf[n-j]!='0') {m=6-j;break;}
      if (m==6) break;}});

  fmt[3]=(char)48+m;
  DO(Rws,{
    if (s[i]) {
      if (e[i]==wf) p0w
      else if (e[i]==-wf) n0w
      else null
    }
    else n=sprintf(pVal,fmt,e[i]);
    Valp[xVal++]=pVal;
    pVal+=n+1;});
  g_free(s);
  return TRUE;
}

int k9(K v)
{
  char buf[30];
  char fmt[]="%0.Xf";
  int j,m,n,*s;
  double *d;

  m=0;
  d=(double *)kF(v);
  s=g_malloc0(Rws*sizeof(int));
  DO(Rws,{
    s[i]=(d[i]==wf)||(d[i]==-wf)||isnan(d[i]);
    if (!s[i]) {
      n=-1+sprintf(buf,"%0.9f",d[i]);
      for(j=0;j<9-m;j++)
        if (buf[n-j]!='0') {m=9-j;break;}
      if (m==9) break;}});

  fmt[3]=(char)48+m;
  DO(Rws,{
    if (s[i]) {
      if (d[i]==wf) p0w
      else if (d[i]==-wf) n0w
      else null
    }
    else n=sprintf(pVal,fmt,d[i]);
    Valp[xVal++]=pVal;
    pVal+=n+1;});
  return TRUE;
}

int k10(K v)
{
  unsigned char *s=kC(v);
  DO(Rws,{
    Valp[xVal++]=pVal;
    pVal[0]=s[i];
    pVal[1]='\0';
    pVal+=2;});
  return TRUE;
}

int k11(K v)
{
  char **k=kS(v);
  DO(Rws,{
    Valp[xVal++]=pVal;
    strcat(pVal,k[i]);
    pVal+=1+strlen(k[i]);});
  return TRUE;
}

int kdate(K v)
{
  int n;
  char *m;
  K p;
  K s=qxf("string",r1(v));
  DO(Rws,{
    p=kK(s)[i];
    n=p->n;
    m=(char*)kC(p);
    if(n<4){
      if(0==strncmp("0W",m,2))Valn[xVal]=1;
      else if(0==strncmp("-0W",m,3))Valn[xVal]=2;
      else if(0==strncmp("0w",m,2))Valn[xVal]=3;
      else Valn[xVal]=4;
    }
    Valp[xVal++]=pVal;
    strncpy(pVal,m,n);
    pVal[n]='\0';
    pVal+=n+1;});
  return TRUE;
}

int klist(K v)
{
  int n;
  char *m;
  K p;
  DO(Rws,{
    p=kK(v)[i];
    n=p->n;
    m=(char*)kC(p);
    Valp[xVal++]=pVal;
    strncpy(pVal,m,n);
    pVal[n]='\0';
    pVal+=n+1;});
  return TRUE;
}
