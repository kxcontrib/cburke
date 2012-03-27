/* axis.c */

#include "main.h"
#include "fmt.h"
#include "plot.h"
#include "state.h"
#include "util.h"
#include "win.h"

static void actdate(ivec *w,dvec *dates);
static void actdateindex(ivec *w,dvec *dates);
static void actdatesep(ivec *w);
static dvec *getdatesnub(dvec *d,double t);
static void gettimeaxis(int type,int cnt);
static dvec *getdateindex(dvec *dates,dvec *idate, dvec *PDate);

void actdate(ivec *w,dvec *dates)
{
  int b,c,d,len;

  if (dates->n<3){w->n=0;return;}

  len=w->n;
  d=(int)dates->v[2];
  c=0;DO(w->n,c+=d>w->v[i]);
  if (c){DO(len-c,w->v[i]=w->v[i+c]);len=w->n=len-c;}

  d=(int)dates->v[dates->n-3];
  c=0;DO(w->n,c+=d<w->v[i]);
  if (c)len=w->n=len-c;

  do {
    b=c=0;
    DO(len,if (!dvec_has(dates,w->v[i])) {
        c+=1;b=1;w->v[i]=w->v[i]+1;});
   } while(b && c<21);


  c=0;DO(w->n,c+=d<w->v[i]);
  if (c)w->n=len-c;
}

void actdateindex(ivec *w,dvec *dates)
{
  int p=0;

  DO(w->n,{
    while(w->v[i]>dates->v[p])p++;
    w->v[i]=p;});
}

static void actdatesep(ivec *w)
{
  int i=0,j,len;
  len=w->n;
  while(i<len-1) {
    if (2<w->v[i+1]-w->v[i])
      i++;
    else {
      for(j=i+2;j<len;j++)
        w->v[j-1]=w->v[j];
      len=w->n=len-1;
    }
  }
}

/* form: getaxis cnt,min,max
 * cnt is maximum number of tics
 * min, max is data min, max */
axis *getaxis(int cnt,double min,double max)
{
  int len=7,n;
  double c,inx,nmm,ms;
  double s[7]={1,2,5,10,20,50,100};
  axis *r=g_malloc(sizeof(axis));
  dvec *p;

  if (min==max) {
    if (min==0) {min=-1;max=1;}
    else {min=min/1.05;max=max*1.05;}
  }

  nmm=pow(10,floor(log10(max-min)-1));
  min=rounddn(min,nmm);
  max=roundup(max,nmm);

  nmm=pow(10,floor(log10(max-min)-1));
  DO(len,s[i]=s[i]*nmm);

  for(n=0;n<len;n++) {
    c=floor((roundup(max,s[n])-rounddn(min,s[n]))/s[n]);
    if (cnt>=c) break;
  }

  if (n<len){
    p=dvec_til(1+c);
    ms=rounddn(min,s[n]);
    DO(p->n,p->v[i]=ms+p->v[i]*s[n]);
    min=MIN(min,dvec_first(p));
    max=MAX(max,dvec_last(p));
    r->p=p;
  }
  else{
    r->p=dvec_new(0);
    min=max=0;
  }

  if ((min<=0) && (max>=0))
    inx=0;
  else
    if (max>0)
      inx=MAX(min,0);
    else
      inx=max;

  r->inx=inx;
  r->min=min;
  r->max=max;
  return r;
}

/*
 type=0  lines, include y axes
      1  bars, between y axes (even spaced)
 defines XPos,XLab,XTic
*/

void getdateaxis(int type)
{
  int cnt,d,len,m,n;
  double b,last,min,max,wid;
  dvec *dates,*idate,*p,*s,*val;
  ivec *w;

  len=PDate->n;
  cnt=MIN(8,(Rw-2*Lx)/XLabWid);
  min=floor(dvec_min(PDate));
  max=ceil(dvec_max(PDate));

  if (Time) return gettimeaxis(type,cnt);

  idate=dvec_dup(PDate);
  DO(len,idate->v[i]=floor(idate->v[i]));
  dates=getdatesnub(idate,max);
  val=getdateindex(dates,idate,PDate);

  if (type==1)
    XPos=dvec_int01(val->n,0);
  else {
    last=val->v[val->n-1];
    DO(val->n,val->v[i]=val->v[i]/last);
    XPos=dvec_dup(val);
  }

  len=dates->n;

  if (len < 16) {
    b=dates->v[1];
    d=len-2;
    n=1+d/cnt;
    p=dvec_til(d/n);
    DO(p->n,p->v[i]=b+n*(1+p->v[i]));
    XLab=fmtday(p);
    DO(p->n,p->v[i]=(p->v[i]-b)/d);
    XTic=dvec_dup(p);
    g_free(dates);g_free(idate);g_free(p);g_free(val);
    return;
  }

  int t[]={7,15,30,90,180,360};
  for(n=0;n<5;n++)
    if (len<cnt*t[n])break;

  m=((int)min)-t[n];

  w=NULL;
  switch(n) {
    case 0 : w=xweek(m);break;
    case 1 : w=xweek2(m);break;
    case 2 : w=xmonth(m);break;
    case 3 : w=xquarter(m);break;
    case 4 : w=xsemi(m);break;
    case 5 : d=(int)(dvec_last(dates)-dvec_first(dates));
             w=xyear(m,d);break;
  }

  actdate(w,dates);
  actdateindex(w,dates);
  actdatesep(w);

  len=w->n;
  XTic=dvec_new(len);

  if (type) {
    wid=dates->n;
    DO(len,XTic->v[i]=(w->v[i]+0.5)/wid);
  }
  else {
    wid=dates->n-1;
    DO(len,XTic->v[i]=(w->v[i])/wid);
  }

  s=dvec_new(len);
  DO(len,s->v[i]=dates->v[w->v[i]]);

  if (n<3) XLab=fmtday(s);
  else if (n<5) XLab=fmtmonth(s);
  else XLab=fmtyear(s);

  g_free(dates);g_free(idate);
  g_free(s);g_free(val);
}

dvec *getdateindex(dvec *dates,dvec *idate, dvec *PDate)
{
  int i,j,len,m,p;
  double s,t;
  len=idate->n;
  dvec *r=dvec_new(len);

  m=p=0;
  DO(len,if(idate->v[i]<PDate->v[i]){m=1;break;});

  if(m==0) {
    DO(len,{while(dates->v[p]<idate->v[i]) p++;
    r->v[i]=p+PDate->v[i]-(int)PDate->v[i];});
    return r;
  }

  i=p=0;
  while(i<len) {
    m=dvec_runlength(idate,i);
    s=1.0/m;
    t=s/2;
    for(j=0;j<m;j++)
      r->v[i+j]=p+t+j*s;
    i+=m;
    p++;
  }

  return r;
}

/* assumes list is ordered. t is additional end element */
dvec *getdatesnub(dvec *d,double t)
{
  int j=0;
  double m=DBL_MIN;
  dvec *r=dvec_new(d->n+1);
  DO(d->n,if (m != d->v[i])r->v[j++]=m=d->v[i]);
  if (m != t)r->v[j++]=t;
  r->n=j;
  return r;
}

void gettimeaxis(int type,int cnt)
{
  int n,w;
  int pd,pb,pe,pn;
  int s[13] = {1,2,5,10,30,60,120,300,600,900,1800,3600,7200};
  double b,d,e,*y;
  dvec *pdate;
  ivec *p;

  pdate=dvec_dup(PDate);
  n=pdate->n;
  y=pdate->v;

  b=y[0];
  e=y[n-1];
  d=e-b;

  XPos=dvec_dup(pdate);
  DO(XPos->n,XPos->v[i]=(XPos->v[i]-b)/d);

  for(n=0;n<12;n++)
    if (d<=cnt*s[n])break;
  w=s[n];

  pd=XLabWid*d/Gw;
  pb=roundint(roundup(b+pd,w));
  pe=roundint(rounddn(e-pd,w));
  pn=MAX(1,1+roundint((pe-pb)/w));

  p=ivec_new(pn);
  DO(pn,p->v[i]=pb+i*w);

  XLab=fmttime(p,w);
  XTic=dvec_new(pn);
  DO(XTic->n,XTic->v[i]=(p->v[i]-b)/d);
}

void getyaxis(double mindef)
{
  int cnt;
  double min,max;
  axis *x;
  cnt=MAX(2,floor(Gh-LabelHit)/MinTic);
  if (mindef<0)
    min=dvec_min((dvec *)PData);
  else
    min=mindef;
  max=dvec_max((dvec *)PData);
  x=getaxis(cnt,min,max);
  YLab=fmtlabel(x->p);

  YMin=x->min;
  YMax=x->max;
  YTic=dvec_dup(x->p);
  DO(YTic->n,YTic->v[i]=(YTic->v[i]-YMin)/(YMax-YMin));

  dvec_free(x->p);
  g_free(x);
}
