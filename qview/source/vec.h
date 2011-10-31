/* vec.h */

#ifndef ARRAY
#define ARRAY

/* length, values */
typedef struct {
  int n;
  char **v;
} cvec;

/* length, values */
typedef struct {
  int n;
  double *v;
} dvec;

/* length, values */
typedef struct {
  int n;
  int *v;
} ivec;

/* length, values, rows, cols */
typedef struct {
  int n;
  double *v;
  int r;
  int c;
} dmat;

/* utils */
void cvec_free(cvec *r);
cvec *cvec_new(int len);
void cvec_view(cvec *r);

dvec *dvec_dup(dvec *d);
void dvec_except(dvec *d,double t);
double dvec_first(dvec *d);
void dvec_free(dvec *d);
int dvec_has(dvec *d,double t);
dvec *dvec_int01(int len,int type);
double dvec_last(dvec *d);
double dvec_min(dvec *d);
double dvec_max(dvec *d);
dvec *dvec_new(int len);
dvec *dvec_newv(int len,double *val);
int dvec_runlength(dvec *d,int p);
dvec *dvec_til(int len);
void dvec_view(dvec *r);

void ivec_free(ivec *r);
ivec *ivec_new(int len);
void ivec_view(ivec *r);

void dmat_free(dmat *d);
dmat *dmat_new(int rows, int cols);
dmat *dmat_newv(int rows,int cols,double *val);
void dmat_write(dmat *d,int row,double *v);
void dmat_view(dmat *r);

#endif
