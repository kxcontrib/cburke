/* volprof.c */

#include "main.h"
#include "fmt.h"
#include "plot.h"
#include "state.h"
#include "win.h"
#include "util.h"

static void drawaccum();
static void drawvols();

void drawvolprof()
{
  int h,len,my;

  len=Date->n;
  PDate=dvec_new(len+1);
  DO(len,PDate->v[i]=Date->v[i]);
  PDate->v[len]=PDate->v[len-1]+PDate->v[1]-PDate->v[0];

  PData=dmat_new(1,len+1);
  PData->v[0]=0;
  DO(len,PData->v[i+1]=PData->v[i]+Data->v[i]);

  h=roundint(Rh * 0.3);
  my=floor(My);
  setsxywh(Rx,(Ry+Rh-h),Rw,h-Ly);
  setrxywh(Rx,Ry,Rw,Rh-(1+h+Ly));
  setgxywh(Rx,Ry+my,Rw,Rh-(my+LabelHit+Ly));

  getdateaxis(0);
  drawpre(-1);
  drawaccum();
  drawpost();

  setrxywh(Sx,Sy,Sw,Sh);
  setgxywh(Rx,Ry+my,Rw,Rh-(my+LabelHit+Ly));
  PData=dmat_new(1,len);
  DO(len,PData->v[i]=Data->v[i]);
  drawpre(0);
  drawvols();
  drawpost();
}

void drawaccum()
{
  int i,n;
  double d,*x,*y;

  x=XPos->v;
  y=PData->v;
  n=PData->n;

  d=1/y[n-1];
  DO(n,y[i]=y[i]*d);
  fitgrafy((dvec *)PData);
  fitgrafx(XPos);

  cairo_set_line_width(CR,1);
  cairo_set_source(CR,glcolor(0));
  cairo_move_to(CR,x[0],y[0]);
  for(i=1;i<n;i++)
    cairo_line_to(CR,x[i],y[i]);
  cairo_stroke(CR);

  cairo_set_source(CR,Black);
  pango_layout_set_font_description(PL,LabelFontB);
  pango_layout_set_text(PL,"Cumulative Volume",-1);
  cairo_move_to(CR,Gx,Gy-(LabelHit+Ly));
  pango_cairo_show_layout(CR,PL);
}

void drawvols()
{
  int i,n,w;
  double d,y,*x,*h;
  dvec *p;

  d=YMax-YMin;
  n=PData->n;
  for(i=0;i<n;i++)
    PData->v[i]=(PData->v[i]-YMin)/d;

  p=dvec_new(n);
  DO(n,p->v[i]=(XPos->v[i]+XPos->v[i+1])/2);

  x=p->v;
  y=Gy+Gh;
  h=PData->v;
  w=MAX(1,((int)floor(Gw/n)-2));

  cairo_set_source(CR,BarColor);
  cairo_set_line_width(CR,w);
  DO(n,{
    cairo_move_to(CR,x[i],y);
    cairo_line_to(CR,x[i],y-roundint(Gh*h[i]));})
  cairo_stroke(CR);

  cairo_set_source(CR,Black);
  pango_layout_set_font_description(PL,LabelFontB);
  pango_layout_set_text(PL,"Volume",-1);
  cairo_move_to(CR,Gx,Gy-(LabelHit+Ly));
  pango_cairo_show_layout(CR,PL);

}

/* minute,volumne */
K plot_volprof(K p)
{
  int n;
  double *t;
  K c,v;

  pTime=1;
  pType=4;

  v=kK(p->k)[1];
  c=kK(v)[0];
  n=c->n;

  pDate=getdatetime(c);
  if (NULL==pDate)return (K)0;

  pData=dmat_new(1,n);
  c=kK(v)[1];
  t=getklist(c);
  if (t==NULL) return (K)0;
  DO(n,pData->v[i]=t[i]);
  g_free(t);

  pPlot();
  return ki(0);
}

