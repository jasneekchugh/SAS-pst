/* INPUT NAME$ STATE$; */
/* CARDS; */
/* A UP */
/* B MP */
/* C RJ */
/* D GJ */
/* E UP */
/* F MP */
/* G RJ */
/* H GJ */
/* ; */
/* RUN; */
/*  */
/* dATA JASNEEK; */
/* SET PST; */
/* RANDOM=RANUNI(4688); */
/* RUN; */
/*  */
/*  */
/* PROC SORT DATA=JASNEEK; */
/* BY RANDOM; */
/* RUN; */

PROC SURVEYSELECT DATA=PST SAMPSIZE=4 OUT=ASWIN;
RUN;

PROC SURVEYSELECT DATA=PST Rate=0.6 OUT=ASWIN seed =213;
RUN;

PROC SURVEYSELECT DATA=PST Rate=0.4 OUT=ASWIN seed =213;
RUN;

PROC SURVEYSELECT DATA=PST Rate=0.4 OUT=ASWIN seed =213 method=srs;
strata STATE;
RUN;

PROC SORT DATA=PST OUT=PST1;
BY STATE;
RUN;

PROC SURVEYSELECT DATA=PST1 Rate=0.4 OUT=ASWIN seed =213 method=srs;
strata STATE;
RUN;

PROC SURVEYSELECT DATA=PST1 Rate=0.4 OUT=ASWIN seed =213 method=srs outall;
strata STATE;
RUN;





















