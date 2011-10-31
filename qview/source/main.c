/* main.c */

#include "main.h"
#include "grid.h"
#include "plot.h"
#include "qcon.h"
#include "state.h"
#include "util.h"
#include "win.h"

static int w4m[2];
static char WBUF[3];
static int RES=0;
static int isINT(K p);
static int isOK(K p);
static char *kchar(K p);
static void maininit();
K mainrun(int type,int win,K p);
static int mainview();
static void mainviewargs(K a);
static struct {int t;int h;K a;K b;} varg;

K grid(K p){return mainrun(0,0,p);}
K plot(K p){return mainrun(1,0,p);}
K grids(K p){return mainrun(0,-1,p);}
K plots(K p){return mainrun(1,-1,p);}

int isINT(K p){return p && (p->t=-6);}
int isOK(K p){return isINT(p) && (p->i==0);}
void *kerr(char *s){KES=g_strdup(s);return 0;}
int maindone(){return write(w4m[1],"1",1);}

int mainadd()
{
  if (!mainview()) return FALSE;
  state_def(pIndex);

  if (WP==NULL)
    win_open();
  else
    if(Class==0)win_resize();
  gtk_widget_queue_resize(DA);
  gdk_window_show(WP->window);
  g_idle_add((GSourceFunc)win_done,&Index);

  return FALSE;
}

void maininit()
{
  gl_init();
  state_init();
  if (!mainview()) {mainquit();return;}
  state_def(pIndex);
  win_init();
  win_open();
  g_idle_add((GSourceFunc)win_done,&Index);
  gtk_main();
  mainquit();
}

void mainquit()
{
  if(GT==NULL) return;
  GT=NULL;
  if (gtk_main_level()) gtk_main_quit();
  m9();
  grid_free();
  plot_free();
  gdk_threads_leave();
}

K mainrun(int type,int win,K p)
{
  int t;
  GError *err=NULL;
  K a,d,r;

  RES=0;
  if (0==p->t){
    d=kK(p)[0];
    a=kK(p)[1];
  }
  else {
    d=p;
    a=(K)0;
  }
  varg.t=type;
  varg.h=win;
  varg.a=a;
  varg.b=b9(1,d);

  if (GT!=NULL) {
    g_free(KES);KES=NULL;
    g_idle_add((GSourceFunc)mainadd,NULL);
  }
  else {
    KES=NULL;
    r=qp_init();
    if (!isOK(r)) return r;
    if (pipe(w4m)==-1) return krr("pipe");
    g_thread_init(NULL);
    gdk_threads_init();
    gdk_threads_enter();
    g_type_init();
    gtk_init(0, NULL);
    GT=g_thread_create((GThreadFunc)maininit,NULL,FALSE,&err);
    if (err) return krr(err->message);
  }
  t=read(w4m[0],WBUF,2);
  if (KES) return krr(KES);
  if (RES) return ki(RES); else return ki(pIndex);
}

int mainview()
{
  K r;
  K p=d9(varg.b);
  pIndex=state_index(varg.h);
  mainviewargs(varg.a);
  if(pIndex<0) {maindone();return FALSE;}
  if (varg.t)
    r=plot_init(p);
  else
    r=grid_init(p);
  if (isOK(r)) return TRUE;
  if (isINT(r)) RES=r->i;
  maindone();
  return FALSE;
}

void mainviewargs(K a)
{
  char *s;
  K v;
  g_free(pCaption);
  g_free(pTitle);
  pScroll=0;
  pCaption=pTitle=0;
  if(a==0)return;
  DO(a->n/2,{
    s=kchar(kK(a)[i*2]);
    v=kK(a)[i*2+1];
    if((0==strcmp("caption",s))) pCaption=kchar(v);
    else if((0==strcmp("title",s))) pTitle=kchar(v);
    else if((0==strcmp("window",s))) pIndex=v->i;
    g_free(s);});
}

char *kchar(K p)
{
  char *r;
  if (p->t<0) {
    r=g_malloc0(2);
    r[0]=p->g;
  }
  else {
    r=g_malloc0(1+p->n);
    strncpy(r,(char*)kC(p),p->n);
  }
  return r;
}
