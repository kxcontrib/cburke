/* date.c  */

#include "main.h"
#include "jul.h"
#include "state.h"

static double d2t=864e11;
static int iftime(dvec *d);
static int nextmonday(int d){return d+7-(d+5)%7;}
static void addmonth(int n);

void addmonth(int n)
{
  YMD[1]=YMD[1]+n;
  if (YMD[1]>12){YMD[1]=1;YMD[0]=YMD[0]+1;}
}

/* return
 * datetime, Time=0
 * second,   Time=1 */
dvec *getdatetime(K p)
{
  int n;
  double *v;
  dvec *r;

  n=p->n;
  r=dvec_new(n);
  v=r->v;

  switch(p->t) {
    case 12 : DO(n,v[i]=(kJ(p)[i])/d2t);pTime=iftime(r);break;
    case 13 : DO(n,v[i]=m2q(kI(p)[i]));pTime=0;break;
    case 14 : DO(n,v[i]=kI(p)[i]);pTime=0;break;
    case 15 : DO(n,v[i]=kF(p)[i]);pTime=iftime(r);break;
    case 17 : DO(n,v[i]=60*kI(p)[i]);pTime=1;break;
    case 18 : DO(n,v[i]=kI(p)[i]);pTime=1;break;
    case 19 : DO(n,v[i]=kI(p)[i]/1000);pTime=1;break;
    default : dvec_free(r);return (dvec *)kerr("invalid time column");;
  }

  return r;
}

int iftime(dvec *d)
{
  return (d->n>0) && (d->v[d->n-1]==d->v[0]);
}

ivec *xmonth(int day)
{
  ivec *r=ivec_new(12);
  q2ymd(day,YMD);
  YMD[2]=1;
  DO(12,{r->v[i]=nextmonday(ymd2q(YMD));addmonth(1);});
  return r;
}

ivec *xquarter(int day)
{
  ivec *r=ivec_new(12);
  q2ymd(day,YMD);
  YMD[2]=1;
  YMD[1]=YMD[1]-(YMD[1]-1)%3;
  DO(12,{r->v[i]=nextmonday(ymd2q(YMD));addmonth(3);});
  return r;
}

ivec *xsemi(int day)
{
  ivec *r=ivec_new(12);
  q2ymd(day,YMD);
  YMD[2]=1;
  YMD[1]=YMD[1]-(YMD[1]-1)%6;
  DO(12,{r->v[i]=nextmonday(ymd2q(YMD));addmonth(6);});
  return r;
}

ivec *xyear(int day,int len)
{
  len=2+len/360;
  ivec *r=ivec_new(len);
  q2ymd(day,YMD);
  YMD[1]=YMD[2]=1;
  DO(len,{r->v[i]=nextmonday(ymd2q(YMD));YMD[0]=YMD[0]+1;});
  return r;
}

ivec *xweek(int day)
{
  int m;
  ivec *w=ivec_new(20);
  m=nextmonday(day);
  DO(w->n,w->v[i]=m+7*i);
  return w;
}

ivec *xweek2(int day)
{
  int m;
  ivec *w=ivec_new(20);
  m=nextmonday(day);
  DO(w->n,w->v[i]=m+14*i);
  return w;
}

