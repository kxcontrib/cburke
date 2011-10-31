/* fmt.c */

#include "main.h"
#include "jul.h"
#include "state.h"
#include "fmt.h"

static const char *MTH[] = {
   "Jan","Feb","Mar","Apr","May","Jun",
   "Jul","Aug","Sep","Oct","Nov","Dec" };

int fmtdate(int day,char *buf,int first)
{
  int h,m,s,t;
  if (!first) {
    strcpy(buf," - ");
    buf+=3;
  }
  if (Time) {
    h=day/3600;
    t=day%3600;
    if (t==0)
      sprintf(buf,"%02d:00",h);
    else {
      m=t/60;
      s=t%60;
      if (s==0)
        sprintf(buf,"%02d:%02d",h,m);
      else
        sprintf(buf,"%02d:%02d:%02d",h,m,s);
    }
  }
  else {
    q2ymd(day,YMD);
    sprintf(buf,"%d %s %d",YMD[2],MTH[YMD[1]-1],YMD[0]);
  }
  return strlen(buf);
}

cvec *fmtday(dvec *p)
{
  int len=p->n;
  char *s;
  cvec *r=cvec_new(len);
  DO(len,{
    r->v[i]=s=(char *)g_malloc(7);
    q2ymd(p->v[i],YMD);
    sprintf(s,"%d %s",YMD[2],MTH[YMD[1]-1]);});
  return r;
}

cvec *fmtlabel(dvec *p)
{
  int i,dbl,s,scale,len;
  int x[4]={1,1e3,1e6,1e9};
  char *fmt,**t;
  char *fmti[4]={"%'d","%'dK","%'dM","%'dG"};
  char *fmtd[4]={"%'0.2lf","%'0.2lfK","%'0.2lfM","%'0.2lfG"};
  double min;
  cvec *r;

  s=0;
  len=p->n;
  if (len>1)
  {
    min=p->v[0];
    if (min==0)min=p->v[1];
    s=(min>=1e3)+(min>=1e6)+(min>=1e9);
  }
  scale=x[s];

  dbl=0;
  DO(len,
    if (1e-6<fabs(p->v[i]-floor(p->v[i]+0.0001))){dbl=1;break;});

  i=0;
  r=cvec_new(len);
  t=r->v;
  if (p->v[0]==0) {
    i++;t[0]=g_strdup_printf("%d",0);
  }

  if (dbl) {
   fmt=fmtd[s];
   for(;i<len;i++)
     t[i]=g_strdup_printf(fmt,p->v[i]/scale);
  }
  else {
   fmt=fmti[s];
   for(;i<len;i++)
     t[i]=g_strdup_printf(fmt,(int)(p->v[i]/scale));
   }

  return r;
}

cvec *fmtmonth(dvec *p)
{
  int len=p->n;
  char *s;
  cvec *r=cvec_new(len);
  DO(len,{
    r->v[i]=s=(char *)g_malloc(9);
    q2ymd(p->v[i],YMD);
    strcpy(s,MTH[YMD[1]-1]);
    sprintf(s+3," %d",YMD[0]);});
  return r;
}

cvec *fmttime(ivec *p,int w)
{
  int h,m,n,s,t,*y;
  char *v;
  cvec *r;
  n=p->n;
  y=p->v;
  r=cvec_new(n);

  if (0==w%3600) {
  DO(n,{
    r->v[i]=v=(char *)g_malloc(6);
    h=y[i]/3600;
    sprintf(v,"%02d:00",h);})
  }
  else if (0==w%60) {
  DO(n,{
    r->v[i]=v=(char *)g_malloc(6);
    h=y[i]/3600;
    m=(y[i]%3600)/60;
    sprintf(v,"%02d:%02d",h,m);})
  }
  else {
  DO(n,{
    h=y[i]/3600;
    t=y[i]%3600;
    m=t/60;
    s=t%60;
    r->v[i]=v=(char *)g_malloc(9);
    sprintf(v,"%02d:%02d:%02d",h,m,s);})
  }

  return r;
}

cvec *fmtyear(dvec *p)
{
  int len=p->n;
  char *s;
  cvec *r=cvec_new(len);
  DO(len,{
    r->v[i]=s=(char *)g_malloc(7);
    q2ymd(p->v[i],YMD);
    sprintf(s,"%d ",YMD[0]);});
  return r;
}
