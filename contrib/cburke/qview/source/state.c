/* state.c */

#include "main.h"
#include "win.h"
#include "state.h"

static int Len=20;

/* grid state
 * HS    = horizontal scroll
 * HV    = if HS visible
 * VS    = vertical scroll
 * VV    = if VS visible
 * Rws   = table rows
 * Cls   = table columns
 * Val   = data values
 * Valp  = data pointers
 * Valn  = data inf types
 * Valw  = data widths
 * Ctyp  = column types (integers)
 * Cwid  = column widths (include padding)
 * Twid  = total of Cwid
 * Hnms  = column header names
 * Hwid  = column header widths
 * Lwid  = label width (include padding)
 * Nx    = scrolled columns
 * Ny    = scrolled rows
 */

typedef struct {
  GtkWidget *hs;
  int hv;
  GtkWidget *vs;
  int vv;
  int rws;
  int cls;
  char *val;
  char **valp;
  int *valn;
  int *valw;
  int *caln;
  int *ctyp;
  int *cwid;
  int twid;
  char **hnms;
  int *hwid;
  int lwid;
  int nx;
  int ny;
} gstate;

typedef struct {
  char *cap;
  cvec *key;
  ivec *kex;
  dvec *date;
  dvec *size;
  dmat *data;
  int split;
  int time;
  int type;
} pstate;

typedef struct {
  GtkWidget *wp;
  GtkWidget *da;
  cairo_t *cr;
  PangoLayout *pl;
  int class;
  union {gstate *g;pstate *p;};
} state;

static state **states;
static void gdef(gstate *g);
static void pdef(pstate *p);

/* ----------------------------------------------------- */
void sDraw()
{
  state *s=states[Index];
  s->cr=CR;
  s->pl=PL;
}

void sWin()
{
  state *s=states[Index];
  s->wp=WP;
  s->da=DA;
  if (Class) return;
  gstate *g=s->g;
  g->hs=HS;
  g->vs=VS;
}

/* ----------------------------------------------------- */
void gGrid()
{
  gstate *g;
  state *s=states[pIndex];
  if (s && (s->class==1)) {
    state_delete(pIndex);
    s=NULL;
  }
  if (s==NULL){
    s=g_malloc0(sizeof(state));
    states[pIndex]=s;
    s->g=g_malloc0(sizeof(gstate));
    s->class=0;
    s->g->hv=1;s->g->vv=1;
  }
  g=s->g;
  g->rws=Rws;
  g->cls=Cls;
  g->val=Val;
  g->valp=Valp;
  g->valn=Valn;
  g->valw=Valw;
  g->ctyp=Ctyp;
  g->cwid=Cwid;
  g->twid=Twid;
  g->hnms=Hnms;
  g->hwid=Hwid;
  g->lwid=Lwid;
}

void gScroll()
{
  state *s=states[Index];
  gstate *g=s->g;
  g->nx=Nx;
  g->ny=Ny;
  g->hv=HV;
  g->vv=VV;
}

void gdef(gstate *g)
{
  HS=g->hs;
  HV=g->hv;
  VS=g->vs;
  VV=g->vv;
  Rws=g->rws;
  Cls=g->cls;
  Val=g->val;
  Valp=g->valp;
  Valn=g->valn;
  Valw=g->valw;
  Ctyp=g->ctyp;
  Cwid=g->cwid;
  Twid=g->twid;
  Hnms=g->hnms;
  Hwid=g->hwid;
  Lwid=g->lwid;
  Nx=g->nx;
  Ny=g->ny;
}

/* ----------------------------------------------------- */
void pPlot()
{
  pstate *p;
  state *s=states[pIndex];
  if (s && (s->class==0)) {
    state_delete(pIndex);
    s=NULL;
  }
  if (s==NULL){
    s=g_malloc0(sizeof(state));
    states[pIndex]=s;
    s->class=1;
    s->p=g_malloc0(sizeof(pstate));
  }
  p=s->p;
  p->cap=g_strdup(pCaption);
  p->data=pData;
  p->date=pDate;
  p->kex=pKex;
  p->key=pKey;
  p->size=pSize;
  p->split=pSplit;
  p->time=pTime;
  p->type=pType;
}

void pdef(pstate *p)
{
  Caption=p->cap;
  Data=p->data;
  Date=p->date;
  Kex=p->kex;
  Key=p->key;
  Size=p->size;
  Split=p->split;
  Time=p->time;
  Type=p->type;
}

/* ----------------------------------------------------- */
int state_count()
{
  int p=0;
  state *s;
  DO(Len,{
    s=states[i];
    if (s==NULL) continue;
    p+=s->wp!=NULL;});
  return p;
}

void state_def(int i)
{
  state *s=states[i];
  Index=i;
  WP=s->wp;
  DA=s->da;
  CR=s->cr;
  PL=s->pl;
  Class=s->class;
  if (Class) pdef(s->p); else gdef(s->g);
}

void state_defDA(GtkWidget *w)
{
  state *s;
  DO(Len,{
    s=states[i];
    if ((s!=NULL)&&(w==s->da)){state_def(i);break;}});
}

void state_defSB(GtkWidget *w)
{
  state *s;
  DO(Len,{
    s=states[i];
    if ((s!=NULL)&&(s->class==0))
      if ((s->g->hs==w)||(s->g->vs==w))
        {state_def(i);break;}});
}

void state_defWP(GtkWidget *w)
{
  state *s;
  DO(Len,{
    s=states[i];
    if ((s!=NULL)&&(w==s->wp)){state_def(i);break;}});
}

/* free data
 * draw should be freed on destroying widget */
void state_delete(int i)
{
  state *s=states[i];
  if(s->wp) gtk_widget_destroy(s->wp);
  if (Class){
    pstate *p=s->p;
    g_free(p->cap);
    dvec_free(p->date);
    dvec_free(p->size);
    dmat_free(p->data);
    g_free(p);
  }
  else {
    gstate *g=s->g;
    g_free(g->val);
    g_free(g->valp);
    g_free(g->valn);
    g_free(g->valw);
    g_free(g->ctyp);
    g_free(g->cwid);
    g_free(g->hnms);
    g_free(g->hwid);
    g_free(g);
  }
  g_free(s);
  states[i]=NULL;
}

int state_index(int n)
{
  if ((n>=0) && (n<Len)) return n;
  if (n==-1) {
    DO(Len,if (states[i]==NULL)return i;);
    kerr("max views");
  }
  else kerr("window");
  return -1;
}

void state_init()
{
  states=g_malloc0(Len*sizeof(state *));
}

void state_maxxy(int *mx,int *my)
{
  int px,py,x,y;
  px=py=x=y=0;
  state *s;
  DO(Len,{
    s=states[i];
    if ((s!=NULL) && (s->wp!=NULL)){
      gtk_window_get_position(GTK_WINDOW(s->wp),&x,&y);
      px=MAX(px,x);py=MAX(py,y);}});
  *mx=px;*my=py;
}

void state_view()
{
  int i,Max=5000;
  char *r=(char*) g_malloc0 (Max*sizeof(char));
  g_strlcat(r,g_strdup_printf("state_view len %d\n",Len),Max);
  gstate *g;
  pstate *p;
  state *s;
  for(i=0;i<Len;i++){
    s=states[i];
    if (s==NULL) continue;
    g_strlcat(r,g_strdup_printf(
     "i=%d wp=%p da=%p cr=%p pl=%p ",
     i,s->wp,s->da,s->cr,s->pl),Max);
    if (s->class){
      p=s->p;
      g_strlcat(r,g_strdup_printf(
        "date=%p key=%p kex=%p size=%p data=%p type=%d\n",
        p->date,p->key,p->kex,p->size,p->data,p->type),Max);
    }
    else {
      g=s->g;
      g_strlcat(r,g_strdup_printf(
        "rws=%d cls=%d\n",g->rws,g->cls),Max);
      g_strlcat(r,g_strdup_printf(
        "val=%p valp=%p valp=%n valw=%p ctyp=%p cwid=%p ",
        g->val,g->valp,g->valn,g->valw,g->ctyp,g->cwid),Max);
      g_strlcat(r,g_strdup_printf(
        "hnms=%p hwid=%p lwid=%d\n",
        g->hnms,g->hwid,g->lwid),Max);
     }
    }
  O("%s",r);
  g_free(r);
}
