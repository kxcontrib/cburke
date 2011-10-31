/* regnms.c */

#include "main.h"
#include "fmt.h"
#include "plot.h"
#include "state.h"
#include "win.h"
#include "util.h"

void drawregnms()
{
  int len,my;
  double d,*h,*ins,*out,w,w2,y;
  dvec *x;

  my=(int)My;
  setgxywh(Rx,Ry+my,Rw,Rh-(my+LabelHit+Ly));

  len=Date->n;
  PDate=dvec_new(len+1);
  DO(len,PDate->v[i]=Date->v[i]);
  PDate->v[len]=PDate->v[len-1]+PDate->v[1]-PDate->v[0];

  getdateaxis(0);

  ins=Data->v;
  out=Data->v+len;
  PData=dmat_new(1,len);
  DO(len,PData->v[i]=ins[i]+out[i]);
  drawpre(0);

  x=dvec_new(len);
  DO(len,x->v[i]=(XPos->v[i]+XPos->v[i+1])/2);
  fitgrafx(x);

  w=MAX(1,(floor(Gw/len))-2);
  w2=ceil(w/2);
  y=Gy+Gh;

  d=YMax-YMin;
  h=g_malloc(len*sizeof(double));
  DO(len,h[i]=roundint(Gh*(PData->v[i])-YMin)/d);

  cairo_set_line_width(CR,1);
  DO(len,{
    cairo_rectangle(CR,x->v[i]-w2,(y-h[i]),w,h[i]);
    cairo_set_source(CR,InColor);
    cairo_fill_preserve(CR);
    cairo_set_source(CR,BarColor);
    cairo_stroke(CR);});

  DO(len,h[i]=roundint(Gh*(out[i]-YMin)/d));

  DO(len,{
    cairo_rectangle(CR,x->v[i]-w2,(y-h[i]),w,h[i]);
    cairo_set_source(CR,BarColor);
    cairo_fill_preserve(CR);
    cairo_stroke(CR);});

  cairo_set_source(CR,Black);
  pango_layout_set_font_description(PL,LabelFontB);
  pango_layout_set_text(PL,"Trades Inside/Outside NBBO",-1);
  cairo_move_to(CR,Gx,Gy-(LabelHit+Ly));
  pango_cairo_show_layout(CR,PL);

  drawpost();
  dvec_free(x);
  g_free(h);
}

/* minute,inside,outside */
K plot_regnms(K p)
{
  int n;
  double *s,*t;
  K c,v;

  pTime=1;
  pType=3;

  v=kK(p->k)[1];
  c=kK(v)[0];
  pDate=getdatetime(c);
  if (NULL==pDate)return (K)0;

  n=c->n;
  pData=dmat_new(2,n);
  c=kK(v)[1];
  s=getklist(c);
  if (s==NULL) return (K)0;
  t=pData->v;
  DO(n,t[i]=s[i]);
  g_free(s);

  c=kK(v)[2];
  s=getklist(c);
  if (s==NULL) return (K)0;
  t=pData->v+n;
  DO(n,t[i]=s[i]);
  g_free(s);

  pPlot();
  return ki(0);
}

