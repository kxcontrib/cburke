/* main.h */

#ifndef MAIN
#define MAIN

#include <unistd.h>
#include <math.h>
#include <string.h>
#include <gdk/gdkkeysyms.h>
#include <glib/gstdio.h>
#include <gtk/gtk.h>
#include "k.h"
#include "vec.h"
#define NZV(ptr) ((ptr) && (ptr)[0])
#define NZC(ptr) ((ptr) && (0<strlen(ptr)))
char *KES;
void *kerr(char *s);
int maindone();
void mainquit();
K printk(K x);
int pScroll;
char *pCaption,*pTitle;

#endif
