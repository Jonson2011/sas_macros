%macro fetch_nobs(lib,db);
%ov3(&lib.,&db.);
%dd(work,&db._ov(obs=1),xxx);keep NOBS; run;
data work.xxx; set work.xxx; 
call symput('nobs',NOBS) ;
%put &nobs.;
run;
%mend fetch_nobs;
/**you get macro nobs containing the number of observations of dataset db**/


/*%macro fetch_nobs01(lib,db);*/
/*%ov3(&lib.,&db.);*/
/*%dd(work,&db._ov(obs=1),nobs_&db.);keep NOBS; run;*/
/*%td(work,nobs_&db.);*/
/*call symput("nobs_&db.",NOBS);*/
/*%put &&nobs_&db.. ;*/
/*run;*/
/*%mend fetch_nobs01;*/


%macro RcrsvMrg(lib,SourceList,n);
%impcsv(work,&SourceList.,&f.\&SourceList..csv)
data SourceList;set SourceList;
call symput('DataSet'||left(_N_),Dataset);
call symput('Key'||left(_N_),Key);
call symput('KeyContent'||left(_N_),KeyContent);
call symput('KeyNature'||left(_N_),KeyNature);
call symput('FeuDom'||left(_N_),FeuDom);
run;

%do i=1 %to &n.;

	%if "&&KeyNature&i." ne 'num' %then %do; 
		%SameIdNumeric(&lib.,&&DataSet&i.,&&Key&i.); 
	%end;

	%if "&&KeyContent&i." eq "sin" %then %do;
		%if "&&Key&i." ne "sin" %then %do;
			%td(&lib.,&&DataSet&i.); format sin 8.; sin=&&Key&i.; run;
		%end; 
	%end;

	%if "&&KeyContent&i." ne "sin" %then %do;
		%add_sin_by_cltid(&lib,&&DataSet&i.,&&key&i.);
	%end;

	%faireordre(&lib.,&&DataSet&i.,sin);

	%if "&i."="1" %then %do;
  		%dd(&lib.,&&DataSet&i.,Grand);run;
  	%end;

	%if "&i." ne "1" %then %do;
		%lier(&lib,Grand,Grand,1,&&DataSet&i.,&&FeuDom&i.,sin);
	%end;
%end;
%mend RcrsvMrg;


%macro NumVarsScan(lib,dsn);
%ov3(&lib.,&dsn.);

%td(work,&dsn._ov);
If type=1 then do;
if count_of_numvar=. then count_of_numvar=0;
count_of_numvar=count_of_numvar+1;
retain count_of_numvar;
end;
run;

%td(work,&dsn._ov);
If type=1 then do;
call symput('varr'||left(count_of_numvar),name);
call symput("num_of_numvar",count_of_numvar);
end;
run;

%do z=1 %to &num_of_numvar.;
/*%put &&varr&z..;*/
%voila1signaler(&lib.,&dsn.,&&varr&z..);
%if "&z."="1" %then %do;
%MakeCopy02(work,

1temp,work,&dsn._nscans);
%end;
%if "&z." gt "1" %then %do;
%LinkByAnyKeyAcross(work,&dsn._nscans,&dsn._nscans,0,sign,0,work,voila1temp,0,sign,1);
%end;
%end;
run;
/*%expxls(work,&dsn._nscans,&f.);*/

%do z=1 %to &num_of_numvar.;
/*%put &&varr&z..;*/
%univariateOut01(&lib.,&dsn.,&&varr&z..);
%if "&z."="1" %then %do;
%MakeCopy02(work,univ_temp,work,&dsn._nscanv);
%end;
%if "&z." gt "1" %then %do;
%Append2DS2(work,&dsn._nscanv,work,univ_temp,&dsn._nscanv);
%end;
%end;
run;
/*%expxls(work,&dsn._nscanv,&f.);*/

%do z=1 %to &num_of_numvar. ;
%ChrVarFrq2(&lib.,&dsn.,&&varr&z..);

%if "&z."="1" %then %do;
%MakeCopy02(work,frq_temp,work,&dsn._nscanf);
%end;
%if "&z." gt "1" %then %do;
%LinkByAnyKeyAcross(work,&dsn._nscanf,&dsn._nscanf,0,Nombre,0,work,frq_temp,0,Nombre,1);
%end;

%end;
%expcsv(work,&dsn._nscanf,&temp.);
%impcsv(work,&dsn._nscanf,&temp.\&dsn._nscanf.csv);

/*%expxls(work,&dsn._nscanf,&f.);*/


PROC EXPORT DATA=work.&dsn._nscanv outfile= "&f.\&dsn._nscn.xlsx " dbms=xlsx replace;
sheet="vscn"; run;
PROC EXPORT DATA=work.&dsn._nscans outfile= "&f.\&dsn._nscn.xlsx " dbms=xlsx replace;
sheet="sscn"; run;
PROC EXPORT DATA=work.&dsn._nscanf outfile= "&f.\&dsn._nscn.xlsx " dbms=xlsx replace;
sheet="fscn"; run;

%mend NumVarsScan;





%macro macroname(year);
%let yy=%sysfunc(substrn(&year.,3,2));
%mend macroname;

%macro TakeYYdeYEARS(year);
%let yy=%sysfunc(substrn(&year.,3,2));
%put &yy.;
%mend TakeYYdeYEARS;

%macro donyears(macroname,start_y,n);
%do i=1 %to &n.;
%let year=%eval(&start_y.+&i.-1);
%&macroname.(&year.);
%end;
%mend donyears;



%macro FaireNAns(macroname,start_y,n);
%do FaireNAns_i=1 %to &n.;
%let FaireNAns_year=%eval(&start_y.+&FaireNAns_i.-1);
%&macroname.(&FaireNAns_year.);
%end;
%mend FaireNAns;

%macro FaireNFois(macroname,start_v,n);
%do i=1 %to &n.;
%let v=%eval(&start_v.+&i.-1);
%&macroname.(&v.);
%end;
%mend FaireNFois;

%macro macroname(year);
%mend macroname;

%macro DoBtwYears(macroname,start_y,end_y);
%do year=&start_y. %to &end_y.;
%&macroname.(&year.);
%end;
%mend DoBtwYears;

%macro FaireEntreAns(macroname,start_y,end_y);
%do year=&start_y. %to &end_y.;
%&macroname.(&year.);
%end;
%mend FaireEntreAns;

%macro mymacro(lib,ds,year);
%mend mymacro;

%macro BatchTreat(mymacro,lib,ds,start_i,end_i);
%do i=&start_i. %to &end_i.;
%&mymacro.(&lib.,&ds.&i.,);
%end;
%mend BatchTreat;


%macro freebrackets(fbfmtname,firstbound,lastbound,num);
%let interval=%eval((&lastbound.-&firstbound.)/&num.);
Proc format;
     value &fbfmtname.FMT
     Low-&firstbound.="<=&firstbound."
     %do i=1 %to &num.;
     %let leftbound=%eval(&firstbound.+(&i.-1)*&interval.);
     %let rightbound=%eval(&leftbound.+&interval.);
     &leftbound.<-&rightbound.="&leftbound.<=&rightbound."
     %end;
     &lastbound.<-high=">&lastbound.";
run;
%mend freebrackets;
/*%freebrackets(FiveHundred,0,5000000,500);*/


%macro freebrackets2(fbfmtname,firstbound,lastbound,num);
%let interval=%eval((&lastbound.-&firstbound.)/&num.);
Proc format;
     value &fbfmtname.FMT
     Low-&firstbound.="Less Than &firstbound."
     %do i=1 %to &num.;
     %let leftbound=%eval(&firstbound.+(&i.-1)*&interval.);
     %let rightbound=%eval(&leftbound.+&interval.);
     &leftbound.<-&rightbound.="&leftbound. - &rightbound."
     %end;
     &lastbound.<-high="Larger Than &lastbound.";
run;
%mend freebrackets2;
/*%freebrackets(FiveHundred,0,5000000,500);*/



%macro get_n_of_obs1(lb,ds);
proc sql; create table n_of_obs as select sum(1) as n_of_obs from &lb..&ds.; quit;
data _null_; set n_of_obs; %global n_of_obs; call symputx ("n_of_obs",n_of_obs); run;
/*%put "n_of_obs is " &n_of_obs.;*/
%mend get_n_of_obs1;

%macro get_n_of_obs1_pw(lb,ds);
proc sql; create table n_of_obs as select sum(1) as n_of_obs from &lb..&ds.(pw=&ppcc.); quit;
data _null_; set n_of_obs; %global n_of_obs; call symputx ("n_of_obs",n_of_obs); run;
/*%put "n_of_obs is " &n_of_obs.;*/
%mend get_n_of_obs1_pw;

%macro get_n_of_obs2(lb,ds);
proc sql; create table n_of_obs as select sum(1) as n_of_obs from &lb..&ds.; quit;
data _null_; set n_of_obs; %global n_of_&ds.;
call symputx ("n_of_&ds.",n_of_obs); run;
/*%put "n_of_&ds. is " &&n_of_&ds..;*/
%mend get_n_of_obs2;

%macro get_n_of_obs3(lb,ds,nofobs_name);
proc sql; create table n_of_obs as select sum(1) as n_of_obs from &lb..&ds.; quit;
data _null_; set n_of_obs; %global &nofobs_name.; call symputx ("&nofobs_name.",n_of_obs); run;
/*%put "n_of_obs is " &n_of_obs.;*/
%mend get_n_of_obs3;


%macro get_n_of_obs1_pw(lb,ds);
proc sql; create table n_of_obs as select sum(1) as n_of_obs from &lb..&ds.(pw=&ppcc.); quit;
data _null_; set n_of_obs; %global n_of_obs; call symputx ("n_of_obs",n_of_obs); run;
/*%put "n_of_obs is " &n_of_obs.;*/
%mend get_n_of_obs1_pw;


%macro get_n_of_obs2_pw(lb,ds);
proc sql; create table n_of_obs as select sum(1) as n_of_obs from &lb..&ds.(pw=&ppcc.); quit;
data _null_; set n_of_obs; %global n_of_&ds.;
call symputx ("n_of_&ds.",n_of_obs); run;
/*%put "n_of_&ds. is " &&n_of_&ds..;*/
%mend get_n_of_obs2_pw;

/*%get_n_of_obs(mapsgfk,Canada)*/


%macro seeifthereisdata(lb,ds);

%td(&lb.,&ds.);
array charvars{*} _char_;
array numvars{*} _numeric_;

avoirnum=0;
avoirchar=0;
avoir_num_or_char=0;

do j=1 to dim(numvars);
	if not missing(numvars{j}) then avoirnum=1;
	end;

do i=1 to dim(charvars);
	if charvars{i} ne '' then avoirchar=1;
	end;

avoir_num_or_char=avoirnum+avoirchar;

if avoir_num_or_char >0;

drop i j 
avoir_num_or_char avoirnum avoirchar
;
run;
%get_n_of_obs1(&lb.,&ds.);
%put The number of rows with at least one value in dataset &ds. is &n_of_obs. ;

%mend seeifthereisdata;

/*%seeifthereisdata(work,Q0nx1_1);*/


%macro SeeIfThereIsNumData(lb,ds);
%td(&lb.,&ds.);
array numvars{*} _numeric_;
avoirnum=0;
	do j=1 to dim(numvars);
	if not missing(numvars{j}) then avoirnum=1;
	end;
if avoirnum ne 0;
drop j avoirnum;
run;
%get_n_of_obs1(&lb.,&ds.);
%put The number of rows with at least one value in dataset &ds. is &n_of_obs.;
%mend SeeIfThereIsNumData;

/*%SeeIfThereIsNumData(work,Kq1n_k)*/


%macro AnnihilateChars(lb,ds);
%td(&lb.,&ds.);
array charvars{*} _char_;
	do i=1 to dim(charvars);
	charvars{i}='';
	end;
drop i; run;
%mend AnnihilateChars;

%macro AnnihilateNums(lb,ds);
%td(&lb.,&ds.);
array numvars{*} _numeric_;
	do i=1 to dim(numvars);
	numvars{i}=.;
	end;
drop i; run;
%mend AnnihilateNums;


%macro formatcopy(lb,ds,dsnew);
data &lb..&dsnew.;set &lb..&ds.(obs=1);run; 
%AnnihilateChars(&lb.,&dsnew.);
%AnnihilateNums(&lb.,&dsnew.);
%mend formatcopy;

%macro formatcopy_pw(lb,ds,dsnew);
data &lb..&dsnew.;set &lb..&ds.(obs=1 pw=&ppcc.);run; 
%AnnihilateChars(&lb.,&dsnew.);
%AnnihilateNums(&lb.,&dsnew.);
%mend formatcopy_pw;

%macro formatcopy_pw2(lb1,ds,lb2,dsnew);
data &lb2..&dsnew.;set &lb1..&ds.(obs=1 pw=&ppcc.);run; 
%AnnihilateChars(&lb2.,&dsnew.);
%AnnihilateNums(&lb2.,&dsnew.);
%mend formatcopy_pw2;


%macro GenerateMacroVarSeriesfromDS(LBN,DSN,VarForList);
%get_n_of_obs1(&LBN.,&DSN.);
%do GenerateValueListfromDS_i=1 %to &n_of_obs.;
	%global Value&GenerateValueListfromDS_i.;
%end;
%global Overall_Num;
data null; set &LBN..&DSN.;
call symputx('Value'||left(_n_),&VarForList.);
call symputx('Overall_Num',_n_);
run;

%mend GenerateMacroVarSeriesfromDS;

%macro GenerateMacroVarSeriesfromDS1(LBN,DSN,VarForList,MacroVarStem);
%get_n_of_obs1(&LBN.,&DSN.);
%do GenerateValueListfromDS_i=1 %to &n_of_obs.;
	%global &MacroVarStem.&GenerateValueListfromDS_i.;
%end;
%global n_of_&MacroVarStem.;
data null; set &LBN..&DSN.;
call symputx("&MacroVarStem."||left(_n_),&VarForList.);
call symputx("n_of_&MacroVarStem.",_n_);
run;
%mend GenerateMacroVarSeriesfromDS1;


%macro GenerateMacroVarSeriesfromDS2(LBN,DSN,VarForList,MacroVarStem);
%get_n_of_obs1(&LBN.,&DSN.);
%do GenerateValueListfromDS_i=1 %to &n_of_obs.;
	%global &MacroVarStem.&GenerateValueListfromDS_i.;
%end;
%global &MacroVarStem._combien;
data &LBN..&DSN.; set &LBN..&DSN.;
call symputx("&MacroVarStem."||left(_n_),&VarForList.);
call symputx("&MacroVarStem._combien",_n_);
run;
%mend GenerateMacroVarSeriesfromDS2;

%macro GenerateMacroVarSeriesfromDS3(LBN,DSN,VarForList,MacroVarStem);
%get_n_of_obs1(&LBN.,&DSN.);
%do GenerateValueListfromDS_i=1 %to &n_of_obs.;
	%global &MacroVarStem.&GenerateValueListfromDS_i. ;
%end;
%global &MacroVarStem._n ;
data &LBN..&DSN.; set &LBN..&DSN.;
call symputx("&MacroVarStem."||left(_n_),&VarForList.);
call symputx("&MacroVarStem._n",_n_);
run;
%mend GenerateMacroVarSeriesfromDS3;

%macro MacroVarSeries_fr_List(MacroVarNameStem,CSV_with_fullpath);
%impcsv(work,MacroVarSeries,&CSV_with_fullpath.);
%get_n_of_obs1(work,MacroVarSeries)
%do MacroVarSeries_fr_List_i=1 %to &n_of_obs.;
%global &MacroVarNameStem.&MacroVarSeries_fr_List_i.;
%end;
%global Num_of_MacroVarSeries;
data null; set MacroVarSeries;
call symputx("&MacroVarNameStem."||left(_n_),&MacroVarNameStem.);
call symputx('Num_of_MacroVarSeries',_n_);
run;
%mend MacroVarSeries_fr_List;

/*%MacroVarSeries_fr_List(PhysicalName,E:\002 My Career\AviAnalyst\02 TCCA Analytics\03 MyAviWork\SAS Coding\WorkScript\MacroVarList.csv);*/


%macro MacroVars_fr_CSV(MacroVarCol_inCSV,ValueCol_inCSV,CSV_with_fullpath);
%impcsv(work,MacroVarsTable,&CSV_with_fullpath.);
data MacroVarsTable; set MacroVarsTable;
call symputx('MacroVarName'||left(_n_),&MacroVarCol_inCSV.);
call symputx('MacroVarValue'||left(_n_),&ValueCol_inCSV.);
call symputx('Overall_Num',_n_);
run;
%do MacroVars_fr_CSV_i=1 %to &Overall_Num.;
%global &&MacroVarName&MacroVars_fr_CSV_i..;
/*call symputx(&&MacroVarName&MacroVars_fr_CSV_i..,&&MacroVarValue&MacroVars_fr_CSV_i..);*/
%let &&MacroVarName&MacroVars_fr_CSV_i..=&&MacroVarValue&MacroVars_fr_CSV_i..;
%end;
%mend MacroVars_fr_CSV;

/*Output of MacroVars_fr_CSV is as following:*/
/*%global FileName1 FileName2 FileName3 TotNum;*/
/*%let FileName2=StatCan_20171229_113005;*/
/*%let FileName1=StatCan_20170116_113006;*/
/*%let FileName3=StatCan_20171124_113007;*/
/*%let TotNum=3;*/



%macro MacroVarSeries_fr_List(MacroVarNameStem,CSV_with_fullpath);
%impcsv(work,MacroVarSeries,&CSV_with_fullpath.);
%get_n_of_obs1(work,MacroVarSeries)
%do MacroVarSeries_fr_List_i=1 %to &n_of_obs.;
%global &MacroVarNameStem.&MacroVarSeries_fr_List_i.;
%end;
%global Num_of_MacroVarSeries;
data null; set MacroVarSeries;
call symputx("&MacroVarNameStem."||left(_n_),&MacroVarNameStem.);
call symputx('Num_of_MacroVarSeries',_n_);
run;
%mend MacroVarSeries_fr_List;

%macro MacroVars_fr_CSV(MacroVarCol_inCSV,ValueCol_inCSV,CSV_with_fullpath);
%impcsv(work,MacroVarsTable,&CSV_with_fullpath.);
data null; set MacroVarsTable;
call symputx('MacroVarName'||left(_n_),&MacroVarCol_inCSV.);
call symputx('MacroVarValue'||left(_n_),&ValueCol_inCSV.);
call symputx('Overall_Num',_n_);
run;
%do MacroVars_fr_CSV_i=1 %to &Overall_Num.;
%global &&MacroVarName&MacroVars_fr_CSV_i..;
/*call symputx(&&MacroVarName&MacroVars_fr_CSV_i..,&&MacroVarValue&MacroVars_fr_CSV_i..);*/
%let &&MacroVarName&MacroVars_fr_CSV_i..=&&MacroVarValue&MacroVars_fr_CSV_i..;
%end;
%mend MacroVars_fr_CSV;

%macro GenerateMVarSeriesFrTable1(MVNameCol,MVValCol,FolderAndCSVTable);
%impcsv(work,MacroVarsSource,&FolderAndCSVTable.);
%dd2(work,MacroVarsSource,jcc,MacroVarsSource);run;

%dt(work,MacroVarsSource); CutoffDate_Y=Year(CutoffDate);CutoffDate_M=Month(CutoffDate);CutoffDate_D=Day(CutoffDate);
%get_n_of_obs1(work,MacroVarsSource);
/*%do GenerateMVarSeriesFrTable_i=1 %to &n_of_obs.;*/
/*	%global &MVNameCol.&GenerateMVarSeriesFrTable_i.*/
/*			&MVValCol.&GenerateMVarSeriesFrTable_i.;*/
/*;*/
/*%end;*/
%global GenerateMVarSeriesFrTable_tot;
%dt(work,MacroVarsSource);
call symputx('MVName'||left(_n_),&MVNameCol.);
call symputx('MVVal'||left(_n_),&MVValCol.);
call symputx('LaDateCoupee_Y'||left(_n_),CutoffDate_Y);
call symputx('LaDateCoupee_M'||left(_n_),CutoffDate_M);
call symputx('LaDateCoupee_D'||left(_n_),CutoffDate_D);
call symputx('GenerateMVarSeriesFrTable_tot',_n_);
run;
%do GenerateMVarSeriesFrTable_j=1 %to &GenerateMVarSeriesFrTable_tot.;
	%global &&MVName&GenerateMVarSeriesFrTable_j..  LaDateCoupee&GenerateMVarSeriesFrTable_j. ;
	%let &&MVName&GenerateMVarSeriesFrTable_j.. =&&MVVal&GenerateMVarSeriesFrTable_j..;
	%let LaDateCoupee&GenerateMVarSeriesFrTable_j. =&&LaDateCoupee_Y&GenerateMVarSeriesFrTable_j..-&&LaDateCoupee_M&GenerateMVarSeriesFrTable_j..-&&LaDateCoupee_D&GenerateMVarSeriesFrTable_j..;
%end;
%mend GenerateMVarSeriesFrTable1;

%GenerateMVarSeriesFrTable1(DataBizName,CurrentDataSetName,&whereNow.\Production\JAVI_ProdDataSetList.csv);































%macro jumbo_file(jumbo_file);
%impcsv(work,&jumbo_file.,&xfld.\jumbo.csv);
%mend jumbo_file;

%macro jumbo_expxls2prac(jumbo_file);
%impcsv(work,&jumbo_file.,&xfld.\jumbo.csv);
%expxls2prac(&jumbo_file.);
%mend jumbo_expxls2prac;

%macro jumbo_exptxt2prac(jumbo_file);
%impcsv(work,&jumbo_file.,&xfld.\jumbo.csv);
%exptxt(work,&jumbo_file.,&xfld.);
%mend jumbo_exptxt2prac;



%macro propre(lb);
%let xfld=&jct_fldr.;
%impcsv(&lb.,jmb1,&xfld.\jumbo.csv);
%do i=1 %to 20;
%let j=%eval(&i.+1);
%Append2DS(&lb.,jmb&i.,jmb&i.,jmb&j.);run;
%end;
%mend propre;
/*%propre(&qq.)*/

%macro propre02(lb);
/*%impcsv(&lb.,jmb1,&xfld.\jumbo.csv);*/
%do i=21 %to 26;
%let j=%eval(&i.+1);
%Append2DS(&lb.,jmb&i.,jmb&i.,jmb&j.);run;
%end;
%mend propre02;
