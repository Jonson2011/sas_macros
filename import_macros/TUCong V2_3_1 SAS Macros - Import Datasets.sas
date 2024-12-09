
%macro imptsv(lib,ds,folderandfile);
filename tsvfile "&folderandfile." encoding="wlatin1" lrecl=32767;
proc import datafile=tsvfile
     out=&lib..&ds. dbms=tab replace;
guessingrows=100000;	 
run;
%mend imptsv;

%macro impcsv(lib,ds,folderandfile);
proc import datafile="&folderandfile."
     out=&lib..&ds. dbms=csv replace;
guessingrows=100000;	 
run;
%mend impcsv;

%macro impcsv_fr_wlatin1_to_utf8(lib,ds,folderandfile);
filename csvfile "&folderandfile." encoding="wlatin1" lrecl=32767;
proc import datafile=csvfile
     out=&lib..&ds.(encoding="utf-8") dbms=csv replace ;
guessingrows=100000;	 
run;
%mend impcsv_fr_wlatin1_to_utf8;


%macro impcsv_ScanRowNum(lib,ds,folderandfile,ScanRowNum);
filename csvfile "&folderandfile." encoding="utf-8" lrecl=32767;
proc import datafile=csvfile
     out=&lib..&ds. dbms=csv replace;
guessingrows=&ScanRowNum.;	 
run;
%mend impcsv_ScanRowNum;

%macro impcsv_utf8(lib,ds,folderandfile);
filename utf8file "&folderandfile." encoding="utf-8" lrecl=32767;
proc import datafile=utf8file
     out=&lib..&ds. dbms=csv replace ENCODING="utf-8";
	 guessingrows=1000000;	 
run;
%mend impcsv_utf8;

%macro impcsvNoHeader(lib,ds,folderandfile);
filename csvfile "&folderandfile." encoding="utf-8" lrecl=32767;
proc import datafile=csvfile 
     out=&lib..&ds. dbms=csv replace;
guessingrows=10000;	 
GETNAMES=NO;
DATAROW=1;
run;
%mend impcsvNoHeader;

%macro ImpCSVofADW(lib,ds,folderandfile,varlist);
proc import datafile="&folderandfile." 
     out=&lib..&ds. dbms=csv replace;
GETNAMES=NO;
DATAROW=1;
run;
data &lib..&ds.; set &lib..&ds.;
%let L=%sysfunc(length(&varlist.)) ;
%let a=1;
%let j=1;
%do i=1 %to &L.;
%let C=%sysfunc(substrn(&varlist.,&i.,1));
	%if "&C." eq ":" %then %do;
		%let b=%eval(&i.-&a.);
		%let NameOfJ=%sysfunc(substrn(&varlist.,&a.,&b.));
		rename var&j. = &NameOfJ. ;
		%let a=%eval(&i.+1);
		%let j=%eval(&j.+1);
	%end;
%end;
;
run;
%mend ImpCSVofADW;

/*%impcsvofadw(&r.,TESTTTTT,&f0.TESTTTTT.csv,*/
/*INDV_TX_YR:*/
/*INDV_CLT_ID:*/
/*INDV_ITX_ASMT_CNT:*/
/*INDV_TX_ASMT_PDTTM:*/
/*ITX_ASMT_SS_NBR:*/
/*DY_SQNBR:*/
/*decl_tpty_prep_cd:*/
/*CLT_ACCT_ASS_FBAMT:*/
/*indv_rsd_prov_cd:*/
/*indv_tx_jrsd_cd:*/
/*itx_decl_fil_dt:*/
/*itx_decl_fil_mcd:*/
/*ass_farm_ni_amt:*/
/*ass_fish_ni_amt:*/
/*ass_net_bus_incamt:*/
/*ass_net_pro_incamt:*/
/*ass_net_rnt_incamt:*/
/*ass_sei_cmsn_amt:*/
/*gro_bus_incamt:*/
/*gro_farm_incamt:*/
/*gro_fish_incamt:*/
/*gro_pro_incamt:*/
/*gro_rnt_incamt:*/
/*CLT_SIN:*/
/*SPS_SIN:*/
/*SPS_CLT_ID:*/
/*INDV_CLT_MSTUS_CD:*/
/*MSTUS_TCD:*/
/*INDV_CLT_MSTUS_EDT:*/
/*INDV_CLT_MSTUS_XDT:*/
/*)*/


%macro ImpCSVofADW02(lib,ds,folderandfile,varlist);
proc import datafile="&folderandfile." 
     out=&lib..&ds._r dbms=csv replace;
GETNAMES=NO;
DATAROW=1;
run;
data &lib..&ds._r; set &lib..&ds._r;
%let L=%sysfunc(length(&varlist.)) ;
%let a=1;
%let j=1;
%do i=1 %to &L.;
%let C=%sysfunc(substrn(&varlist.,&i.,1));
	%if "&C." eq ":" %then %do;
		%let b=%eval(&i.-&a.);
		%let NameOfJ=%sysfunc(substrn(&varlist.,&a.,&b.));
		rename var&j. = &NameOfJ. ;
		%let a=%eval(&i.+1);
		%let j=%eval(&j.+1);
	%end;
%end;
;
run;
PROC SORT 	DATA=&lib..&ds._r 
			DUPOUT=&lib..&ds._d 
			NODUPKEY 
			OUT=&lib..&ds.;
by INDV_CLT_ID; run;
%mend ImpCSVofADW02;

/*ImpCSVofADW02 will incorporate ImpCSVofADW while detecting the duplicates in ADW extraction directly by */
/*outputting &ds._r(aw from ADW) into working dataset &ds. and the one with removed duplicates by INDV_CLT_ID*/

/*%ImpCSVofADW02(&r.,TESTTTTT,&f0.TESTTTTT.csv,*/
/*INDV_TX_YR:*/
/*INDV_CLT_ID:*/
/*INDV_ITX_ASMT_CNT:*/
/*INDV_TX_ASMT_PDTTM:*/
/*ITX_ASMT_SS_NBR:*/
/*DY_SQNBR:*/
/*decl_tpty_prep_cd:*/
/*CLT_ACCT_ASS_FBAMT:*/
/*indv_rsd_prov_cd:*/
/*indv_tx_jrsd_cd:*/
/*itx_decl_fil_dt:*/
/*itx_decl_fil_mcd:*/
/*ass_farm_ni_amt:*/
/*ass_fish_ni_amt:*/
/*ass_net_bus_incamt:*/
/*ass_net_pro_incamt:*/
/*ass_net_rnt_incamt:*/
/*ass_sei_cmsn_amt:*/
/*gro_bus_incamt:*/
/*gro_farm_incamt:*/
/*gro_fish_incamt:*/
/*gro_pro_incamt:*/
/*gro_rnt_incamt:*/
/*CLT_SIN:*/
/*SPS_SIN:*/
/*SPS_CLT_ID:*/
/*INDV_CLT_MSTUS_CD:*/
/*MSTUS_TCD:*/
/*INDV_CLT_MSTUS_EDT:*/
/*INDV_CLT_MSTUS_XDT:*/
/*)*/



%macro imptxt(lib,ds,folderandfile,delimiter);
proc import datafile="&folderandfile." 
			out=&lib..&ds. dbms=dlm replace;
	delimiter='&delimiter.';
 	getnames=yes;
run;
%mend imptxt;

%macro imptxt2(lib,ds,folderandfile);
proc import datafile="&folderandfile." 
			out=&lib..&ds. dbms=tab replace;
/*	delimiter='&delimiter.';*/
 	getnames=yes;
run;
%mend imptxt2;

%macro imptxt3(lib,ds,folder,file,ext);
proc import datafile="&folder.\&file..&ext." 
			out=&lib..&ds. dbms=tab replace;
/*	delimiter='&delimiter.';*/
 	getnames=no;
	datarow=1;
guessingrows=10000;	 
run;
%mend imptxt3;


%macro ImpLines(lib,ds,folder,LineFileNm,ext);
data &lib..&ds.;
infile "&folder.\&LineFileNm..&ext." truncover dsd;
/*truncover option makes sure to read all rows!*/
length ligne $32767;
input ligne $32767.; 
run;
%dt(&lib.,&ds.);longue_de_ligne=length(ligne);run;
%MeansOut02(&lib.,&ds.,longue_de_ligne,max,longue_de_ligne);
%dt(&lib.,longue_de_ligne);where _stat_="MAX"; keep longue_de_ligne; run;
%global longue_de_ligne;
%dt(&lib.,longue_de_ligne); call symputx("longue_de_ligne",longue_de_ligne);run;
%dt(&lib.,&ds.);length ligne_courte $&longue_de_ligne.; 
ligne_courte=ligne; 
drop ligne longue_de_ligne; 
rename ligne_courte=line; run;
%mend ImpLines;




%macro cimpbin(lib,ds,folderandfile);
proc cimport data=&lib..&ds.
			 infile="&folderandfile..bin" ; 
run;
%mend cimpbin;



%macro cimpmuext(lib,ds,folderandfile);
proc cimport data=&lib..&ds.
			 infile="&folderandfile..bin" ; 
run;
%mend cimpmuext;

%macro cimpmainframe(lib,ds,folderandfile);
proc cimport data=&lib..&ds.
			 infile="&folderandfile." ; 
run;
%mend cimpmainframe;