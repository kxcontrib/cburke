/* grid.c */

#include "main.h"
#include "qcon.h"
#include "state.h"
#include "util.h"
#include "win.h"
#include "grid.h"

static int Seq=0;

/*                  0 1 2 3 4 5 6  7  8  9  0 1 2  3 4  5  6  7 8 9 */
static int Width[]={0,1,0,0,4,6,11,20,20,20,1,0,29,7,10,23,21,5,8,12};

static int grid_size(K v);
static int grid_size0(K p);
static int grid_size11(K p);
static void grid_widths();
static void grid_width1(int p);
static void grid_width_date(int c, int type);
static void grid_width_extent(int p);
static void grid_width_fixed(int p, int w);
static void grid_width_list(int p);
static void grid_width_num(int p);

void grid_defs()
{
  Hx=4;
  Hy=1;
}

/* this for any globals not in state (none so far) */
void grid_free(){}

K grid_init(K p)
{
  int len;
  char **nms;
  K c,m,v;

  Index=Keys=0;
  SB=14;

  if (0==Seq++) grid_defs();

  switch(p->t) {
    case 98 : break;
    case 99 :
     if (!iskeyedtable(p))
       return kerr("not a keyed table");
     v=kK(p)[0];
     m=kK(v->k)[0];
     Keys=m->n;
     p=ktd(p);
     if (p==NULL) return p;
     break;
    default : return kerr("not a table");
  }

  grid_free();
  c=kK(p->k)[0];
  v=kK(p->k)[1];

  nms=kS(c);
  Cls=c->n;
  Rws=(kK(v)[0])->n;
  len=Rws*Cls;

/* convert lists to strings */
  DO(Cls,{if(0==kK(v)[i]->t)
    kK(v)[i]=qxf(".Q.s1 each",kK(v)[i]);});

  Val=g_malloc0(Rws*grid_size(v));
  Valp=g_malloc(len*sizeof(char *));
  Valn=g_malloc0(len*sizeof(int));
  Valw=g_malloc(len*sizeof(int));
  pVal=Val;
  xVal=0;
  Ctyp=g_malloc(Cls*sizeof(int));
  Cwid=g_malloc0(Cls*sizeof(int));
  Hnms=g_malloc(Cls*sizeof(char *));
  Hwid=g_malloc0(Cls*sizeof(int));
  DO(Cls,Hnms[i]=g_strdup(nms[i]));

  DO(Cls,{
    m=kK(v)[i];
    Ctyp[i]=m->t;
    if (!kfmt(m)) return FALSE;});

  grid_widths();
  gGrid();
  return ki(0);
}

int grid_size(K v)
{
  int s=0;
  K p;
  DO(v->n,{
    p=kK(v)[i];
    switch (p->t) {
      case 0 : s+=grid_size0(p);break;
      case 11 : s+=grid_size11(p);break;
      default : s+=Width[p->t];
    }
   });

  return s+2*v->n;
}

int grid_size0(K v)
{
  int s=0;
  DO(v->n,s=MAX(s,(kK(v)[i])->n));
  return s;
}

int grid_size11(K v)
{
  int s=0;
  DO(v->n,s=MAX(s,strlen(kS(v)[i])));
  return s;
}

void grid_widths()
{
  int m;
  cairo_surface_t *cs;

  cs=cairo_image_surface_create(CAIRO_FORMAT_RGB24,100,100);
  CR=cairo_create(cs);
  cairo_surface_destroy(cs);
  PL=pango_cairo_create_layout(CR);
  if (NumWid==0)getgridfontsizes();
  pango_layout_set_font_description(PL,CellFont);

  m=Hx*4;
  Twid=0;
  DO(Cls,{
    grid_width1(i);
    Hwid[i]=gettextwidth(Hnms[i]);
    Twid+=Cwid[i]=m+MAX(Cwid[i],Hwid[i]);});
    Lwid=m+NumWid*(1+(int)log10(Rws));

  g_object_unref(PL);
  cairo_destroy(CR);
  PL=NULL;
  CR=NULL;
}

void grid_width1(int c)
{
  switch(Ctyp[c]) {
    case 0 : grid_width_list(c); break;
    case 1 : grid_width_fixed(c,1); break;
    case 4 : grid_width_fixed(c,4); break;
    case 5 : grid_width_num(c); break;
    case 6 : grid_width_num(c); break;
    case 7 : grid_width_num(c); break;
    case 8 : grid_width_num(c); break;
    case 9 : grid_width_num(c); break;
    case 10 : grid_width_extent(c); break;
    case 11 : grid_width_extent(c); break;
    case 12 : grid_width_date(c,12); break;
    case 13 : grid_width_date(c,13); break;
    case 14 : grid_width_date(c,14); break;
    case 15 : grid_width_date(c,15); break;
    case 16 : grid_width_num(c); break;
    case 17 : grid_width_date(c,17); break;
    case 18 : grid_width_date(c,18); break;
    case 19 : grid_width_date(c,19); break;
    default : grid_width_extent(c); break;
  }
}

void grid_width_date(int c, int type)
{
  int a,d,n,m,p,t;
  a=d=n=t=0;
  switch(type) {
    case 12 : d=5;n=23;a=1;break;
    case 13 : d=1;n=6;break;
    case 14 : d=2;n=8;break;
    case 15 : d=5;n=17;t=1;break;
    case 17 : d=1;n=4;break;
    case 18 : d=2;n=6;break;
    case 19 : d=3;n=9;break;
   }
  m=(a*CellFontWid)+(d*DotWid)+(n*NumWid)+(t*TWid);
  p=Rws*c;
  DO(Rws,{
    if(Valn[p])Valw[p]=InfWid[Valn[p]];
    else Valw[p]=m;
    p++;});
  Cwid[c]=m;
}

void grid_width_extent(int c)
{
  int m,n,p;
  m=0;
  p=Rws*c;
  DO(Rws,{
    n=CellFontWid*strlen(Valp[p]);
    Valw[p++]=n;
    m=MAX(m,n);});
  Cwid[c]=m;
}

void grid_width_fixed(int c,int w)
{
  char *v;
  int m,p;
  p=Rws*c;
  v=Valp[p];
  m=gettextwidth(v);
  DO(Rws,Valw[p++]=m);
  Cwid[c]=m;
}

/* for lists get actual extent */
void grid_width_list(int c)
{
  int m,n,p;
  m=0;
  p=Rws*c;
  DO(Rws,{
    pango_layout_set_text(PL,Valp[p],-1);
    pango_layout_get_pixel_size(PL,&n,NULL);
    Valw[p++]=n;
    m=MAX(m,n);});
  Cwid[c]=m;
}

void grid_width_num(int c)
{
  char *v;
  int d,m,n,p;
  m=0;p=Rws*c;
  v=Valp[p];
  n=strlen(v);
  d=0;DO(n,d+=(v[i]=='.')||(v[i]==':'));
  d=d*(DotWid-NumWid);
  d=d+(CellFontWid-NumWid)*strhas(v,'D');
  DO(Rws,{
    if(Valn[p])n=InfWid[Valn[p]];
    else n=d+NumWid*strlen(Valp[p]);
    Valw[p++]=n;
    m=MAX(m,n);});
  Cwid[c]=m;
}

