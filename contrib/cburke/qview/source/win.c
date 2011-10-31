/* win */

#include "main.h"
#include "state.h"
#include "util.h"
#include "win.h"

static char TBUF[10];
static int Cw,Ch,Fw,Fh,Pw,Ph;
static int configure_event(GtkWidget *w,GdkEventConfigure *e,gpointer data);
static int expose_event(GtkWidget *w,GdkEventExpose *e,gpointer data);
static int isesckey(GdkEventKey *event);
static void view_close(GtkWidget *w,GdkEvent *e,gpointer data);
static void view_key_press();
static void win_open_grid();
static void win_open_plot();
static void win_open_window(int w,int h);
static void win_setpos(int w,int h);
static void win_settitle();
static void win_sizes();

int configure_event(GtkWidget *w,GdkEventConfigure *e,gpointer data)
{
  cairo_surface_t *cs;
  state_defDA(w);
  Tw=e->width;
  Th=e->height;
  if (CR!=NULL) {g_object_unref(PL);cairo_destroy(CR);}
  cs=cairo_image_surface_create(CAIRO_FORMAT_RGB24,Tw,Th);
  CR=cairo_create(cs);
  cairo_surface_destroy(cs);
  PL=pango_cairo_create_layout(CR);
  sDraw();
  if (Class) drawplot(); else drawgrid();
  return FALSE;
}

int expose_event(GtkWidget *w,GdkEventExpose *e,gpointer data)
{
  state_defDA(w);
  cairo_surface_flush(cairo_get_target(CR));
  cairo_t *cr=gdk_cairo_create(GDK_DRAWABLE(DA->window));
  cairo_set_operator(cr,CAIRO_OPERATOR_SOURCE);
  cairo_set_source_surface(cr,(cairo_get_target(CR)),0,0);
  cairo_paint(cr);
  cairo_destroy(cr);
  return FALSE;
}

int win_done(int *index)
{
  if (Index==*index) maindone();
  return FALSE;
}

void win_init()
{
  GdkScreen *s=gdk_screen_get_default();
  Cw=gdk_screen_get_width(s);
  Ch=gdk_screen_get_height(s);
  Pw=MAX(100,MIN(700,Cw-25));
  Ph=MAX(100,MIN(500,Pw-25));
}

void win_open()
{
  if (Class) win_open_plot(); else win_open_grid();
}

void win_open_grid()
{
  int a,b;
  GtkObject *ha,*va;
  GtkWidget *tb;
  win_sizes();
  a=GTK_FILL;
  b=GTK_FILL|GTK_EXPAND;
  win_open_window(Fw,Fh);
  ha=gtk_adjustment_new(0,0,100,1,10,10);
  va=gtk_adjustment_new(0,0,100,1,10,10);
  HS=gtk_hscrollbar_new((GtkAdjustment *)ha);
  VS=gtk_vscrollbar_new((GtkAdjustment *)va);
  g_signal_connect(HS,"change-value",G_CALLBACK(scrollhs_change),NULL);
  g_signal_connect(VS,"change-value",G_CALLBACK(scrollvs_change),NULL);
  tb=gtk_table_new(2,2,0);
  gtk_table_attach((GtkTable*)tb,DA,0,1,0,1,b,b,0,0);
  gtk_table_attach((GtkTable*)tb,HS,0,1,1,2,b,a,0,0);
  gtk_table_attach((GtkTable*)tb,VS,1,2,0,1,a,b,0,0);
  sWin();
  gtk_container_add(GTK_CONTAINER(WP),tb);
  gtk_widget_show(DA);
  if(HV)gtk_widget_show(HS);else gtk_widget_hide(HS);
  if(VV)gtk_widget_show(VS);else gtk_widget_hide(VS);
  gtk_widget_show(tb);
  gtk_widget_show(WP);
}

void win_open_plot()
{
  win_open_window(Pw,Ph);
  sWin();
  gtk_container_add(GTK_CONTAINER(WP),DA);
  gtk_widget_show_all(WP);
}

void win_open_window(int w, int h)
{
  WP=gtk_window_new(GTK_WINDOW_TOPLEVEL);
  gtk_window_set_default_size(GTK_WINDOW(WP),w,h);
  win_setpos(w,h);
  win_settitle();
  g_signal_connect(WP,"key-press-event",G_CALLBACK(view_key_press),NULL);
  g_signal_connect(WP,"delete-event",G_CALLBACK(view_close),NULL);
  DA=gtk_drawing_area_new();
  g_signal_connect(DA,"configure-event",G_CALLBACK(configure_event),NULL);
  g_signal_connect(DA,"expose-event",G_CALLBACK(expose_event),NULL);
}

void win_resize()
{
  win_sizes();
  if (HV==0)gtk_widget_hide(HS);
  if (VV==0)gtk_widget_hide(VS);
  gtk_window_resize((GtkWindow *)WP,Fw,Fh);
}

void win_setpos(int w, int h)
{
  int pad,px,py,x,y;
  pad=25;
  state_maxxy(&x,&y);
  if ((x==0)||(y==0))
    gtk_window_set_position(GTK_WINDOW(WP),GTK_WIN_POS_CENTER);
  else {
    px=MIN(x+pad,Cw-w);
    py=MIN(y+pad,Ch-h);
    gtk_window_move(GTK_WINDOW(WP),px,py);
  }
}

void win_settitle()
{
  char *s;
  if (pTitle)
    s=pTitle;
  else {
    s=TBUF;
    if (Class)
      g_sprintf(s,"plot %d",Index);
    else
      g_sprintf(s,"grid %d",Index);
  }
  gtk_window_set_title(GTK_WINDOW(WP),s);
}

void win_sizes()
{
  int w,h;

  w=1+Lwid+Twid;
  h=1+(Rws+1)*CellHit;

  VV=h>Ph;
  HV=w>Pw-VV*SB;
  if ((VV==0)&&(HV==1))VV=h>Ph-SB;

  Fw=MAX(100,MIN(Pw,w+VV*SB));
  Fh=MAX(100,MIN(Ph,h+HV*SB));
  gScroll();
}

/* ------------------------------------ */

void fitgrafx(dvec *p)
{
  DO(p->n,p->v[i]=Gx+roundint(Gw*p->v[i]));
}

void fitgrafy(dvec *p)
{
  DO(p->n,p->v[i]=Gy+roundint(Gh*(1-p->v[i])));
}

int isesckey(GdkEventKey *event)
{
  return event->keyval==GDK_Escape;
}

void setgxywh(double x,double y,double w,double h)
{
  Gx=x;Gy=y;Gw=w;Gh=h;
}

void setrxywh(double x,double y,double w,double h)
{
  Rx=x;Ry=y;Rw=w;Rh=h;
}

void setsxywh(double x,double y,double w,double h)
{
  Sx=x;Sy=y;Sw=w;Sh=h;
}

void view_close(GtkWidget *w,GdkEvent *e,gpointer data)
{
  state_defWP(w);
  state_delete(Index);
  if (0<state_count()) return;
  mainquit();
}

void view_key_press(GtkWidget *widget,GdkEventKey *event)
{
  if (isesckey(event)) view_close(widget,NULL,NULL);
}
