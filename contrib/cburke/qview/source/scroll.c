/* scroll.c */

#include "main.h"
#include "state.h"
#include "util.h"
#include "win.h"
#include "grid.h"

static int scrollhs_max();

void scroll_init()
{
  int h,m,p,v,th,tw;
  GtkAdjustment *a;

  tw=Tw-1+VV*SB;
  th=Th-1+HV*SB;

  v=th<(Rws+1)*CellHit;
  h=tw<Lwid+Twid+v*SB;
  if ((h==1)&&(v==0))
    v=th<SB+(Rws+1)*CellHit;

  if ((HV=h)) {
    a=((GtkRange *)HS)->adjustment;
    m=scrollhs_max();
    Nx=MIN(Nx,m);
    gtk_adjustment_configure(a,Nx,0,m,1,1,1);
    gtk_widget_show(HS);
  }
  else gtk_widget_hide(HS);

  if ((VV=v)) {
    a=((GtkRange *)VS)->adjustment;
    p=MAX(0,(int)((th-HV*SB)/CellHit)-1);
    Ny=MIN(Ny,Rws-p);
    gtk_adjustment_configure(a,Ny,0,Rws,1,p,p);
    gtk_widget_show(VS);
  }
  else {
    Ny=0;
    gtk_widget_hide(VS);
  }

  gScroll();
}

int scrollhs_change(GtkRange *r,GtkScrollType s,double v,gpointer d)
{
  int m,w;
  w=Gw-Lwid;

  m=scrollhs_max();
  state_defSB((GtkWidget*)r);

  switch(s) {
   case GTK_SCROLL_JUMP :
     Nx=MAX(0,MIN(m,roundint((v*m)/(m-1)))); break;
   case GTK_SCROLL_STEP_BACKWARD : Nx=MAX(0,Nx-1); break;
   case GTK_SCROLL_STEP_FORWARD : Nx=MIN(m,Nx+1); break;
   case GTK_SCROLL_PAGE_BACKWARD : Nx=MAX(0,Nx-1); break;
   case GTK_SCROLL_PAGE_FORWARD : Nx=MIN(m,Nx+1); break;
   default : return FALSE;
  }

  gScroll();
  drawgrid();
  gtk_widget_queue_draw(DA);
  return FALSE;
}

int scrollhs_max()
{
  int r,t,w;
  t=0;
  w=Gw-Lwid;
  if (Twid<=w) return 0;
  for(r=Cls-1;r>=0;r--) {
    t+=Cwid[r];
    if (w<t) return MIN(r+1,Cls-1);
    if (w==t) return r;
  }
  return 0;
}

int scrollvs_change(GtkRange *r,GtkScrollType s,double v,gpointer d)
{
  int n;
  double p;

  state_defSB((GtkWidget*)r);
  n=roundint(v);
  p=gtk_adjustment_get_page_size(gtk_range_get_adjustment(r));
  n=MAX(0,MIN(n,Rws-p));
  if (Ny==n)return FALSE;
  Ny=n;
  gScroll();
  drawgrid();
  gtk_widget_queue_draw(DA);
  return FALSE;
}

