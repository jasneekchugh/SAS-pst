data test;
input DTOB;
INFORMAT DTOB DATE7.;
DATALINES;
02JAN60
;
RUN;

/* Year Cutoff */

OPTIONS YEARCUTOFF=2068;
data test;
input DTOB;
INFORMAT DTOB DATE7.;
FORMAT DTOB DATE9.;
DATALINES;
02JAN60
03MAR12
04JAN66
12FEB40
;

RUN;

data test;
input DTOB;
INFORMAT DTOB DATE7.;
FORMAT DTOB DATE9. DT DATE9.;
DT= DATEPART (DTOB);
DATALINES;
31JAN1960
;
RUN;

/* It will subract 6 from seconds. It will treat as*/
data test;
input DTOB;
FORMAT DTOB DATETIME20.;
DATALINES;
-6
;
RUN;

/*Column input method */

data test;
input age $1-7 age sal;
datalines;
Mr. Ram 23 23000
Mr. Rom 23 23000
Mr, Robert 23 23000
;
run;


/* how many obs ? */
data test;
input n1 n2 n3;
datalines;
1 2 3 4 5 6
7 8
7 7 7 9 8 8 
9 0
7
3 4
1 1 1 
0
run;

data test;
put _ALL_;
input n1 n2 n3;
PUT _ALL_;
datalines;
1 2 3 4 5 6
7 8
7 7 7 9 8 8 
9 0
7
3 4
1 1 1 
0
run;
















