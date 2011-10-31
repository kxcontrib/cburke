/* price.c */

#include "main.h"
#include "fmt.h"
#include "plot.h"
#include "state.h"
#include "win.h"
#include "util.h"

static void drawprices();

void drawprice()
{
  int cls,h,my,rws;

  if (Kex!=NULL){drawpricesym();return;}

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
  getdateaxis(0);
  drawpre(-1);
  drawprices();
  drawpost();
  drawkeys();

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

void drawkeys()
{
  int len,h2,x,y,*kx;
  len=Key->n;
  if (2>len) return;
  h2=LabelHit/2;
  kx=g_malloc(len*sizeof(int));
  pango_layout_set_font_description(PL,LabelFont);
  DO(len,kx[i]=gettextwidth(Key->v[i]));
  x=Gx+Gw-(10+KeyWid+maxi(len,kx));
  y=Gy+10+h2;
  cairo_set_line_width(CR,2);
  DO(len,{
    cairo_set_source(CR,glcolor(i));
    cairo_move_to(CR,x,y);
    cairo_line_to(CR,x+KeyWid,y);
    cairo_stroke(CR);
    y+=LabelHit;
  });
  pango_layout_set_font_description(PL,LabelFont);
  cairo_set_source(CR,Black);
  x=x+KeyWid+4;
  y=Gy+10;
  DO(len,{
    cairo_move_to(CR,x,y);
    pango_layout_set_text(PL,Key->v[i],-1);
    pango_cairo_show_layout(CR,PL);
    y+=LabelHit;
  });
}

void drawprices()
{
  int cls,i,j,len,rws;
  double d,*x,*y;

  d=YMax-YMin;
  len=PData->n;
  rws=PData->r;
  cls=PData->c;
  for(i=0;i<len;i++)
    PData->v[i]=(PData->v[i]-YMin)/d;
  fitgrafy((dvec *)PData);
  fitgrafx(XPos);
  cairo_set_line_width(CR,1);
  x=XPos->v;
  for(i=0;i<rws;i++) {
    y=PData->v+cls*i;
    cairo_set_source(CR,glcolor(i));
    cairo_move_to(CR,x[0],y[0]);
    for(j=1;j<cls;j++)
      cairo_line_to(CR,x[j],y[j]);
    cairo_stroke(CR);
  }

}

void drawpricefini()
{
  int h,len,w;
  double bgn,end;
  char *txt;
  cairo_set_source(CR,Black);
  pango_layout_set_font_description(PL,LabelFontB);
  pango_layout_set_text(PL,"Price",-1);
  cairo_move_to(CR,Gx,Gy-(LabelHit+Ly));
  pango_cairo_show_layout(CR,PL);

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

void drawvolumes()
{
  char buf[80];
  dvec *pdata;
  int h,i,len,w;
  int o,l,g,c;
  double d,*p,*x,y;

  pdata=(dvec *)PData;
  d=YMax-YMin;
  len=pdata->n;

  o=dvec_first(pdata);
  l=dvec_min(pdata);
  g=dvec_max(pdata);
  c=dvec_last(pdata);

  DO(len,pdata->v[i]=roundint(Gh*(pdata->v[i]-YMin)/d));
  x=XPos->v;
  y=Gy+Gh;
  p=pdata->v;
  cairo_set_line_width(CR,1);
  cairo_set_source(CR,VolColor);
  for(i=0;i<len;i++) {
    cairo_move_to(CR,x[i],y);
    cairo_line_to(CR,x[i],y-p[i]);
  }
  cairo_stroke(CR);

  cairo_set_source(CR,Black);
  pango_layout_set_font_description(PL,LabelFontB);
  pango_layout_set_text(PL,"Volume   ",-1);
  pango_layout_get_pixel_size(PL,&w,&h);
  cairo_move_to(CR,Gx,Gy-(LabelHit+Ly));
  pango_cairo_show_layout(CR,PL);

  sprintf(buf,"open:%d high:%d low:%d close:%d",o,g,l,c);
  pango_layout_set_font_description(PL,LabelFont);
  pango_layout_set_text(PL,buf,-1);
  cairo_move_to(CR,Gx+w,Gy-(LabelHit+Ly));
  pango_cairo_show_layout(CR,PL);
}

K plot_price(K p)
{
  int j,n,r;
  char **nms;
  double *d,*t;
  K c,s,v;

  pType=2;

  s=kK(p->k)[0];
  v=kK(p->k)[1];
  c=kK(v)[0];
  n=c->n;
  pDate=getdatetime(c);
  if (NULL==pDate)return (K)0;

  nms=kS(s);
  if (0==strcmp("sym",nms[1]))
    return plot_pricesym(p);

  pSplit=0==strcmp("size",nms[v->n-1]);

  if (pSplit) {
    pSize=dvec_new(n);
    c=kK(v)[v->n-1];
    DO(n,pSize->v[i]=kI(c)[i]);
  }

  r=v->n-(pSplit+1);
  pData=dmat_new(r,n);

  for(j=0;j<r;j++) {
    c=kK(v)[j+1];
    t=getklist(c);
    if (t==NULL) return (K)0;
    d=pData->v+n*j;
    DO(n,d[i]=t[i]);
    g_free(t);
  }

  pKey=cvec_new(r);
  DO(r,pKey->v[i]=g_strdup(nms[i+1]));

  pPlot();
  return ki(0);
}
