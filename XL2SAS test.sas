PROC IMPORT DATAFILE= "C:\Documents and Settings\forootan\My Documents\RIFR\SAS\XL2SAS test.xls" 
			OUT= roqumi 
        	DBMS=EXCEL2000 REPLACE;
			SHEET="A-Digitized$a1:e49";
			getnames=yes;

proc print data=roqumi;
/*change names*/
proc glm data=roqumi;
class Rep Irrigation genotype chemical;
model cnt= rep Irrigation rep*Irrigation genotype Irrigation*genotype rep*genotype(irrigation) chemical;
means Irrigation|genotype|chemical / duncan lines;

run;

