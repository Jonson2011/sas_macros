
%macro ExpLines(lib,ds,outfile,ext,outfolder, varname);
	data _null_ ;
��� set &lib..&ds. ; 
��� FILE� "&outfolder.\&outfile.&ext." ; 
��� PUT &varname.; 
run ;
%mend ExpLines;


%macro exptxt(lib,ds,outfolder);
proc export data=&lib..&ds. 
	 outfile="&outfolder.\&ds..txt" dbms=tab replace;
/*putnames=no;*/
run;
%mend exptxt;

%macro exptxt2(lib,ds,outfile,outfolder);
proc export data=&lib..&ds. 
	 outfile="&outfolder.\&outfile..txt" dbms=tab replace;
putnames=no;
run;
%mend exptxt2;

%macro exptxt3(lib,ds,outfile,ext,outfolder);
proc export data=&lib..&ds. 
	 outfile="&outfolder.\&outfile..&ext." dbms=txt;
putnames=no;
run;
%mend exptxt3;




%macro expcsv(lib,ds,outfolder);
proc export data=&lib..&ds. 
	outfile="&outfolder.\&ds..csv"
	dbms=csv
	replace;
run;
%mend expcsv;

%macro expcsv2(lib,ds,outfolder,outname);
proc export data=&lib..&ds. 
	outfile="&outfolder.\&outname..csv"
	dbms=csv
	replace;
run;
%mend expcsv2;

%macro expcsv3(lib,ds,outfolder,outname,extname);
proc export data=&lib..&ds. 
	outfile="&outfolder.\&outname..&extname."
	dbms=csv
	replace;
run;
%mend expcsv3;

%macro expsascode(lib,ds,outfolder,outname);
proc export data=&lib..&ds. 
	outfile="&outfolder.\&outname..sas"
	dbms=csv
	replace;
	putnames=no;
run;
%mend expsascode;



%macro expcsv999(lib,ds,outfolder,outname);
proc export data=&lib..&ds. 
	outfile="&outfolder.\&outname..pdf"
	dbms=csv
	replace;
run;
%mend expcsv999;

%macro expcsv998(lib,ds,outfolder,outname);
proc export data=&lib..&ds. 
	outfile="&outfolder.\&outname..jpg"
	dbms=csv
	replace;
run;
%mend expcsv998;


%macro expcsv3(lib,ds,outfile,ext,outfolder);
proc export data=&lib..&ds. 
	outfile="&outfolder.\&outfile..&ext."
	dbms=csv
	replace;
run;
%mend expcsv3;

%macro expcsv2prac(ds);
proc export data=&ds. 
	outfile="C:\Users\cxc366\temporary\02saslearning\practice\&ds..csv"
	dbms=csv
	replace;
run;
%mend expcsv2prac;

%macro expcsv2auto(ds);
proc export data=&ds. 
	outfile="C:\Users\cxc366\temporary\01travail\02 SAS Coding\001 MyCodeWealth\Automation\&ds..csv"
	dbms=csv
	replace;
run;
%mend expcsv2auto;

%macro expxls(lib,ds,outfolder);
proc export data=&lib..&ds. 
	outfile="&outfolder.\&ds..xls"
	dbms=excel2000
	replace;
run;
%mend expxls;

%macro expxlsx(lib,ExlName,SheetName,outfolder);
	%let SheetNameTruc=%sysfunc(substrn(&SheetName.,1,30));
proc export data=&lib..&SheetName. 
	outfile="&outfolder.\&ExlName..xlsx"
	dbms=xlsx
	replace;
	sheet="&SheetNameTruc." ;
run;
%mend expxlsx;

%macro expxls(lib,ExlName,DSNAME,outfolder);
	%let SheetName=%sysfunc(substrn(&DSNAME.,1,30));
proc export data=&lib..&DSNAME. 
	outfile="&outfolder.\&ExlName..xls"
	dbms=xls
	replace;
	sheet="&SheetName." ;
run;
%mend expxls;

/*PROC EXPORT DATA=work.&dsn._nscanv */
/*outfile= "&f.\&dsn._nscn.xlsx " */
/*dbms=xlsx replace;*/
/*sheet="vscn"; run;*/


%macro expxls2prac(ds);
PROC EXPORT DATA=&ds.
 OUTFILE= "C:\Users\cxc366\temporary\02saslearning\practice\&ds..xls"
            DBMS=EXCEL2000 REPLACE;
RUN;
run;
%mend expxls2prac;


%macro expxls2prac2(lb,ds);
PROC EXPORT DATA=&lb..&ds.
 OUTFILE= "C:\Users\cxc366\temporary\02saslearning\practice\&ds..xls"
            DBMS=EXCEL2000 REPLACE;
RUN;
run;
%mend expxls2prac2;


%macro Output2csv(lb,ds,oudecsv,quoidefaire);   
ods csvall file="&oudecsv..csv";
&quoidefaire.;
ods csvall close;
%mend Output2csv;

%macro Output2pdf(lb,ds,oudepdf,quoidefaire);   
ODS pdf file="&oudepdf..pdf";
&quoidefaire.;
ODS pdf close;
%mend Output2pdf;
