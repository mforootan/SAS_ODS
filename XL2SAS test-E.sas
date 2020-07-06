/* Original data from Yazdi p510*/

PROC IMPORT DATAFILE= "C:\Documents and Settings\forootan\My Documents\RIFR\SAS\XL2SAS test.xls" 
			OUT= roqumi 
        	DBMS=EXCEL2000 REPLACE;
			SHEET="E-Digitized$a1:e121";
			getnames=yes;

label loc='Location';	
label cult='Cultivar';
label rep='Replication';	
label perf='Yield';

ods html file="C:\Documents and Settings\forootan\My Documents\RIFR\SAS\XL2SAS test.html"
CONTENTS="C:\Documents and Settings\forootan\My Documents\RIFR\SAS\CONTENTS.HTML"
PAGE="C:\Documents and Settings\forootan\My Documents\RIFR\SAS\PAGE.HTML"
FRAME="C:\Documents and Settings\forootan\My Documents\RIFR\SAS\THOR.HTML"; 
ods rtf file='C:\Documents and Settings\forootan\My Documents\RIFR\SAS\XL2SAS test.rtf';
ods listing close;

proc print data=roqumi label;

/*here we split all the combined data by separate locations*years*/
data L1Y1 L1Y2 L2Y1 L2Y2 L3Y1 L3Y2 L4Y1 L4Y2;
set roqumi;

if loc = 'one' then do;
if year = 1 then output L1Y1;
else output L1Y2;
end;

if loc = 'two' then do;
if year = 1 then output L2Y1;
else output L2Y2;
end;

if loc = 'three' then do;
if year = 1 then output L3Y1;
else output L3Y2;
end;

if loc = 'four' then do;
if year = 1 then output L4Y1;
else output L4Y2;
end;

/*ANOVA for L1Y1*/
proc print data=L1Y1 label;
proc anova data=L1Y1;
class rep cult;
model perf=cult;
means cult /duncan lines;

/*ANOVA for L1Y2*/
proc print data=L1Y2 label;
proc anova data=L1Y2;
class rep cult;
model perf=cult;
means cult /duncan lines;

/*ANOVA for L2Y1*/
proc print data=L2Y1 label;
proc anova data=L2Y1;
class rep cult;
model perf=cult;
means cult /duncan lines;

/*ANOVA for L2Y2*/
proc print data=L2Y2 label;
proc anova data=L2Y2;
class rep cult;
model perf=cult;
means cult /duncan lines;

/*ANOVA for L3Y1*/
proc print data=L3Y1 label;
proc anova data=L3Y1;
class rep cult;
model perf=cult;
means cult /duncan lines;

/*ANOVA for L3Y2*/
proc print data=L3Y2 label;
proc anova data=L3Y2;
class rep cult;
model perf=cult;
means cult /duncan lines;

/*ANOVA for L4Y1*/
proc print data=L4Y1 label;
proc anova data=L4Y1;
class rep cult;
model perf=cult;
means cult /duncan lines;

/*ANOVA for L4Y2*/
proc print data=L4Y2 label;
proc anova data=L4Y2;
class rep cult;
model perf=cult;
means cult /duncan lines;


/* ANOVA using all locations/years combined */

proc anova data=roqumi;

class loc year cult rep; 
model perf= year loc year*loc rep(year loc) cult year*cult loc*cult year*loc*cult;
test h=year loc year*loc e=rep(year loc);
means year|loc|cult /duncan lines;

run;

ods html close;
ods rtf close;

