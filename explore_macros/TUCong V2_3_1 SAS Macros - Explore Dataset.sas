
%macro overview(lib,ds);
proc contents data=&lib..&ds.; run;
%mend overview;

/*%copy overview/source;*/

%macro ov(lib,ds);
proc contents data=&lib..&ds.; run;
%mend ov;

%macro ov0(lib,ds);
proc contents data=&lib..&ds. out=&lib..&ds._ov noprint; run;
%td(&lib.,&ds._ov);name=lowcase(name);run;
%mend ov0;

%macro ov0_temp(lib,ds);
proc contents data=&lib..&ds. out=work.&ds._ov noprint; run;
%td(work,&ds._ov);name=lowcase(name);run;
%mend ov0_temp;

%macro ov0_temp01(lib,ds,postfix);
proc contents data=&lib..&ds. out=work.&ds._&postfix. noprint; run;
%td(work,&ds._&postfix.);name=lowcase(name);run;
%mend ov0_temp01;


%macro ov1(lib,ds);
proc contents data=&lib..&ds. out=&lib..&ds._ov noprint; run;
%td(&lib.,&ds._ov);name=lowcase(name);run;
%expxls(&lib.,&ds._ov,&f.);
%mend ov1;

%macro ov2(lib,ds);
proc contents data=&lib..&ds. out=&lib..&ds._ov noprint; run;
%td(&lib.,&ds._ov); 
keep
/*LIBNAME*/
/*MEMNAME*/
/*MEMLABEL*/
/*TYPEMEM*/
NAME
TYPE
LENGTH
VARNUM
LABEL
FORMAT
FORMATL
FORMATD
INFORMAT
/*INFORML*/
/*INFORMD*/
/*JUST*/
/*NPOS*/
NOBS
/*ENGINE*/
/*CRDATE*/
/*MODATE*/
/*DELOBS*/
/*IDXUSAGE*/
/*MEMTYPE*/
/*IDXCOUNT*/
/*PROTECT*/
/*FLAGS*/
/*COMPRESS*/
/*REUSE*/
/*SORTED*/
/*SORTEDBY*/
/*CHARSET*/
/*COLLATE*/
/*NODUPKEY*/
/*NODUPREC*/
/*ENCRYPT*/
/*POINTOBS*/
/*GENMAX*/
/*GENNUM*/
/*GENNEXT*/
/*TRANSCOD*/
; run;
%td(&lib.,&ds._ov);name=lowcase(name);run;
%expxls(&lib.,&ds._ov,&f.);
%mend ov2;


%macro ov2folder(lib,ds,folder);
proc contents data=&lib..&ds. out=&lib..&ds._ov noprint; run;
%td(&lib.,&ds._ov); 
keep
/*LIBNAME*/
/*MEMNAME*/
/*MEMLABEL*/
/*TYPEMEM*/
NAME
TYPE
LENGTH
VARNUM
LABEL
FORMAT
FORMATL
FORMATD
INFORMAT
/*INFORML*/
/*INFORMD*/
/*JUST*/
/*NPOS*/
NOBS
/*ENGINE*/
/*CRDATE*/
/*MODATE*/
/*DELOBS*/
/*IDXUSAGE*/
/*MEMTYPE*/
/*IDXCOUNT*/
/*PROTECT*/
/*FLAGS*/
/*COMPRESS*/
/*REUSE*/
/*SORTED*/
/*SORTEDBY*/
/*CHARSET*/
/*COLLATE*/
/*NODUPKEY*/
/*NODUPREC*/
/*ENCRYPT*/
/*POINTOBS*/
/*GENMAX*/
/*GENNUM*/
/*GENNEXT*/
/*TRANSCOD*/
; run;
%td(&lib.,&ds._ov);name=lowcase(name);run;
%expcsv2(&lib.,&ds._ov,&folder.,&ds._ov);
/*%expxls(&lib.,&ds._ov,&folder.);*/
%mend ov2folder;

%macro ov2Sheet(lib,ds,XLS_FileName,folder);
proc contents data=&lib..&ds. out=&lib..&ds._ov noprint; run;
%td(&lib.,&ds._ov); 
keep
/*LIBNAME*/
/*MEMNAME*/
/*MEMLABEL*/
/*TYPEMEM*/
NAME
TYPE
LENGTH
VARNUM
LABEL
FORMAT
FORMATL
FORMATD
INFORMAT
/*INFORML*/
/*INFORMD*/
/*JUST*/
/*NPOS*/
NOBS
/*ENGINE*/
/*CRDATE*/
/*MODATE*/
/*DELOBS*/
/*IDXUSAGE*/
/*MEMTYPE*/
/*IDXCOUNT*/
/*PROTECT*/
/*FLAGS*/
/*COMPRESS*/
/*REUSE*/
/*SORTED*/
/*SORTEDBY*/
/*CHARSET*/
/*COLLATE*/
/*NODUPKEY*/
/*NODUPREC*/
/*ENCRYPT*/
/*POINTOBS*/
/*GENMAX*/
/*GENNUM*/
/*GENNEXT*/
/*TRANSCOD*/
; run;
%td(&lib.,&ds._ov);name=lowcase(name);run;
/*%expcsv2(&lib.,&ds._ov,&folder.,&ds._ov);*/
%expxls(&lib.,&XLS_FileName.,&ds._ov,&folder.);
%mend ov2Sheet;

%macro ov2_pw(lib,ds);
proc contents data=&lib..&ds.(pw=&ppcc.) out=&lib..&ds._ov noprint; run;
%td(&lib.,&ds._ov); 
keep
/*LIBNAME*/
/*MEMNAME*/
/*MEMLABEL*/
/*TYPEMEM*/
NAME
TYPE
LENGTH
VARNUM
LABEL
FORMAT
FORMATL
FORMATD
INFORMAT
/*INFORML*/
/*INFORMD*/
/*JUST*/
/*NPOS*/
NOBS
/*ENGINE*/
/*CRDATE*/
/*MODATE*/
/*DELOBS*/
/*IDXUSAGE*/
/*MEMTYPE*/
/*IDXCOUNT*/
/*PROTECT*/
/*FLAGS*/
/*COMPRESS*/
/*REUSE*/
/*SORTED*/
/*SORTEDBY*/
/*CHARSET*/
/*COLLATE*/
/*NODUPKEY*/
/*NODUPREC*/
/*ENCRYPT*/
/*POINTOBS*/
/*GENMAX*/
/*GENNUM*/
/*GENNEXT*/
/*TRANSCOD*/
; run;
%td(&lib.,&ds._ov);name=lowcase(name);run;
%expxls(&lib.,&ds._ov,&f.);
%mend ov2_pw;

%macro ov3(lib,ds);
proc contents data=&lib..&ds. out=&ds._ov noprint; run;
%td(work,&ds._ov); 
keep
/*LIBNAME*/
/*MEMNAME*/
/*MEMLABEL*/
/*TYPEMEM*/
NAME
TYPE
LENGTH
VARNUM
LABEL
FORMAT
FORMATL
FORMATD
INFORMAT
/*INFORML*/
/*INFORMD*/
/*JUST*/
/*NPOS*/
NOBS
/*ENGINE*/
/*CRDATE*/
/*MODATE*/
/*DELOBS*/
/*IDXUSAGE*/
/*MEMTYPE*/
/*IDXCOUNT*/
/*PROTECT*/
/*FLAGS*/
/*COMPRESS*/
/*REUSE*/
/*SORTED*/
/*SORTEDBY*/
/*CHARSET*/
/*COLLATE*/
/*NODUPKEY*/
/*NODUPREC*/
/*ENCRYPT*/
/*POINTOBS*/
/*GENMAX*/
/*GENNUM*/
/*GENNEXT*/
/*TRANSCOD*/
; run;
%td(work,&ds._ov);name=lowcase(name);run;
/*%expxls(&lib.,&ds._ov,&f.);*/
%mend ov3;

%macro ov4(lib,ds,outfld);
proc contents data=&lib..&ds. out=&lib..&ds._ov noprint; run;
%td(&lib.,&ds._ov); 
keep
/*LIBNAME*/
/*MEMNAME*/
/*MEMLABEL*/
/*TYPEMEM*/
NAME
TYPE
LENGTH
VARNUM
LABEL
FORMAT
FORMATL
FORMATD
INFORMAT
/*INFORML*/
/*INFORMD*/
/*JUST*/
/*NPOS*/
NOBS
/*ENGINE*/
/*CRDATE*/
/*MODATE*/
/*DELOBS*/
/*IDXUSAGE*/
/*MEMTYPE*/
/*IDXCOUNT*/
/*PROTECT*/
/*FLAGS*/
/*COMPRESS*/
/*REUSE*/
/*SORTED*/
/*SORTEDBY*/
/*CHARSET*/
/*COLLATE*/
/*NODUPKEY*/
/*NODUPREC*/
/*ENCRYPT*/
/*POINTOBS*/
/*GENMAX*/
/*GENNUM*/
/*GENNEXT*/
/*TRANSCOD*/
; run;
%td(&lib.,&ds._ov);name=lowcase(name);run;
%expxls(&lib.,&ds._ov,&outfld.);
%mend ov4;





%Macro OVC(DSN);
%ov2folder(JCC,&DSN.,&JCC_Fldr.)
%mend OVC;

%Macro OVA(DSN);
%ov2folder(JCA,&DSN.,&JCA_Fldr.)
%mend OVA;

%Macro OVP(DSN);
%ov2folder(JCP,&DSN.,&JCP_Fldr.)
%mend OVP;

%Macro OVT(DSN);
%ov2folder(JCT,&DSN.,&JCT_Fldr.)
%mend OVT;
