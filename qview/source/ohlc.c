/* ohlc.c */

#include "main.h"
#include "fmt.h"
#include "plot.h"
#include "state.h"
#include "win.h"
#include "util.h"

static void drawohlcs();

void drawohlc()
{
  int cls,h,my,rws;

  rws=Data->r;
  cls=Data->c;
  PDate=dvec_dup(Date);

  PData=dmat_new(rws,cls);
  DO(Data->n,PData->v[i]=Data->v[i]);

  if (Split) {
    h=roundint(Rh/4);
    setsxywh(Rx,(Ry+Rh-h),Rw,h-Ly);
    setrxywh(Rx,Ry,Rw,Rh-(1+h+Ly));
  }
  my=(int) My;
  setgxywh(Rx,Ry+my,Rw,Rh-(my+LabelHit+Ly));
  getdateaxis(1);
  drawpre(-1);
  drawohlcs();
  drawpost();
  if (!Split) return;
  dmat_free(PData);
  PData=dmat_new(1,cls);
  DO(cls,PData->v[i]=Size->v[i]);
  setrxywh(Sx,Sy,Sw,Sh);
  setgxywh(Sx,Sy+my,Sw,Sh-(my+LabelHit+Ly));
  drawpre(-1);
  drawvolumes();
  drawpost();
}

void drawohlcs()
{
  int cls,h,i,len,rws,w,wid,wid2;
  char *txt;
  double bgn,d,end,*o,*g,*l,*c,*x;

  d=YMax-YMin;
  len=PData->n;
  rws=PData->r;
  cls=PData->c;
  wid=(int)Gw/cls;
  wid2=(int)wid/2.0;

  for(i=0;i<len;i++)
    PData->v[i]=(PData->v[i]-YMin)/d;
  fitgrafy((dvec *)PData);
  fitgrafx(XPos);

  o=PData->v;
  g=o+cls;
  l=g+cls;
  c=l+cls;
  x=XPos->v;

  cairo_set_line_width(CR,1);
  cairo_set_source(CR,DownColor);

  DO (cls,
    if (o[i]<=c[i])
      cairo_rectangle(CR,x[i]-wid2,o[i],wid,c[i]-o[i]));
  cairo_fill(CR);
  DO (cls,
    if (o[i]<=c[i]) {
      cairo_move_to(CR,x[i],g[i]);
      cairo_line_to(CR,x[i],l[i]);});
  cairo_stroke(CR);

  cairo_set_source(CR,UpColor);
  DO (cls,
    if (o[i]>c[i])
      cairo_rectangle(CR,x[i]-wid2,o[i],wid,c[i]-o[i]));
  cairo_fill(CR);
  DO (cls,
    if (o[i]>c[i]) {
      cairo_move_to(CR,x[i],g[i]);
      cairo_line_to(CR,x[i],l[i]);});
  cairo_stroke(CR);

  cairo_set_source(CR,Black);
  pango_layout_set_font_description(PL,LabelFontB);
  drawtext("ohlc",Gx,Gy-(LabelHit+Ly));

  txt=(char *)g_malloc0(30);
  bgn=dvec_first(PDate);
  end=dvec_last(PDate);
  len=fmtdate(bgn,txt,1);
  if (bgn<end)fmtdate(end,txt+len,0);
  pango_layout_set_font_description(PL,LabelFont);
  pango_layout_set_text(PL,txt,-1);
  pango_layout_get_pixel_size(PL,&w,&h);
  cairo_move_to(CR,Gx+Gw-w,Gy-(LabelHit+Ly));
  pango_cairo_show_layout(CR,PL);
}

K plot_ohlc(K p)
{
  int j,n;
  double *t;
  K c,v;

  pType=1;

  v=kK(p->k)[1];
  c=kK(v)[0];
  n=c->n;

  pDate=getdatetime(c);
  if (NULL==pDate)return (K)0;

  pData=dmat_new(4,n);
  for(j=0;j<4;j++) {
    c=kK(v)[j+1];
    t=pData->v+n*j;
    DO(n,t[i]=kF(c)[i]);
  }

  pSplit=v->n>5;

  if (pSplit) {
    pSize=dvec_new(n);
    c=kK(v)[5];
    DO(n,pSize->v[i]=kI(c)[i]);
  }

  pPlot();
  return ki(0);
}
