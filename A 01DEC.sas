/* Assignment */
/* Data set */

DATA TEST;
input HID $PID $@@;
datalines;
1001 P1 1001 P2 1001 P3
1002 P1
1003 X1 1003 X2
1004 Y1 1004 Y2 1004 Y3 1004 Y4 1004 Y5
1005 H1
;
RUN;

/* Data step that find HID with PID only */
proc sort data=test;
by hid;
run;

data T1;
set test;
by hid;
if first.hid=1 and last.hid=1;
run;


/* show all the obs for the HIDs with multiple PIDs */

data t2;
set test;
by hid;
if (first.hid = 1 and last.hid = 0) 
or (first.hid =0  and last.hid=0)
or (first.hid=0 and last.hid =1)
;
run;







