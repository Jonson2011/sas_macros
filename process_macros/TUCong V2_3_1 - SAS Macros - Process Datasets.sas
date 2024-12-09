
/*QuickStart for MacroDev*/
/*%Macro AMName(LBN, DSN,blah, Blah, Blah);*/
/*%mend AMName;*/
/*%FairelEssai(lb,ds,obsnum)*/
/*%AMName(LBN, DSN,blah, Blah, Blah);*/
/*';*/
Options ls=256 ps=512 compress=yes;
/*;*';*";*/;quit;run;*/
/*;*%mend;*);*';*";**/;*/
/*run;*/

/*translate(stringvar,"&good.","&bad.")*/

/**************************************************************************************/
/**************************************************************************************/
/*5-This is to set the syntax check mode so that SAS won't run;*/
/**************************************************************************************/
/**************************************************************************************/

/*OPTIONS SYNTAXCHECK;*/
/*OPTIONS DMSSYNCHK;*/
/*OPTIONS OBS=0 NOREPLACE;*/

/*OPTIONS NOREPLACE;*/
/*permanent data sets with the same name will not be replaced.*/
/*%let address = %sysfunc(pathname(WORK));*/
/*%put &address;*/


/**************************************************************************************/
/**************************************************************************************/
/*6- l'Empire des codes d'AviCong commence d'ici! ^_* :-) */
/**************************************************************************************/
/**************************************************************************************/
;
%macro WhereNowRippling(IllusionWhereNow);
%SetWhereNowMyAvi(&IllusionWhereNow.);
%SetWhereNowMyPhD(&IllusionWhereNow.,&TodayPhDTopic.);
%mend WhereNowRippling;
/*WhereNowRippling is designed for running DonnezMoiRaw by diverting all libname to nonexisting place*/
/*so that only MPrint works to generate the standard SAS code without substantial effect on any datasets*/
/*%WhereNowRippling(NoWhere);*/



%macro rename_var_serial(lib,ds,VarSerial_stem,varlist);
data &lib..&ds.; set &lib..&ds.;
%let L=%sysfunc(length(&varlist.)) ;
%let a=1;
%let j=1;
%do i=1 %to &L.;
%let C=%sysfunc(substrn(&varlist.,&i.,1));
	%if "&C." eq ":" %then %do;
		%let b=%eval(&i.-&a.);
		%let NameOfJ=%sysfunc(substrn(&varlist.,&a.,&b.));
		rename &VarSerial_stem.&j. = &NameOfJ. ;
		%let a=%eval(&i.+1);
		%let j=%eval(&j.+1);
	%end;
%end;
;
run;
%mend rename_var_serial;

/*%rename_var_serial(&r.,data01,col,*/
/*N_2007:*/
/*MIN_2007:*/
/*MAX_2007:*/
/*MEAN_2007:*/
/*STD_2007:*/
/*N_2008:*/
/*MIN_2008:*/
/*MAX_2008:*/
/*MEAN_2008:*/
/*STD_2008:)*/






%macro DataTreat(lb,ds);
data &lb..&ds.;
set &lb..&ds.;
%mend DataTreat;

%macro TreatData(lb,ds);
data &lb..&ds.;
set &lb..&ds.;
%mend TreatData;

%macro TD(lb,ds);
data &lb..&ds.;
set &lb..&ds.;
%mend TD;

%macro DT(lb,ds);
data &lb..&ds.;
set &lb..&ds.;
%mend DT;

%macro TraiterData(lb,ds);
data &lb..&ds.;
set &lb..&ds.;run;
%mend TraiterData;

%macro TestTreat(lb,ds,obsnum);
data &lb..test;
set &lb..&ds.(obs=&obsnum.); run;
%mend TestTreat;

%macro TestTraiter(lb,ds,obsnum);
data &lb..test;
set &lb..&ds.(obs=&obsnum.);run;
%mend TestTraiter;

%macro FairelEssai(lb,ds,obsnum);
data work.test;
set &lb..&ds.(obs=&obsnum.);run;
%mend FairelEssai;

%macro FairelEssai2(lb,ds,obsnum,DSN_Test);
data work.&DSN_Test.;
set &lb..&ds.(obs=&obsnum.);run;
%mend FairelEssai2;

%macro FairelEssai3(lb,ds,obsnum,DSN_Test);
data &lb..&DSN_Test.;
set &lb..&ds.(obs=&obsnum.);run;
%mend FairelEssai3;

%macro DeriveData(lb,ds1,ds2);
data &lb..&ds2.;
set &lb..&ds1.;
%mend DeriveData;

%macro DeriverData(lb,ds1,ds2);
data &lb..&ds2.;
set &lb..&ds1.;
%mend DeriverData;

%macro DD(lb,ds1,ds2);
data &lb..&ds2.;
set &lb..&ds1.;
%mend DD;

%macro DD2(lb1,ds1,lb2,ds2);
data &lb2..&ds2.;
set &lb1..&ds1.;
%mend DD2;

%macro DupDS(lb,ds1,ds2);
data &lb..&ds2.;
set &lb..&ds1.;
run;
%mend DupDS;

%macro Append2DS(lb,ds1,ds2,ds_target);
data &lb..&ds_target.;
set &lb..&ds1.
	&lb..&ds2.;
	run;
%mend Append2DS;

%macro Append2DS2(lb1,ds1,lb2,ds2,ds_target);
data &lb1..&ds_target.;
set &lb1..&ds1.
	&lb2..&ds2.;
	run;
%mend Append2DS2;

%macro Append3DS(lb,ds1,ds2,ds3,ds_target);
data &lb..&ds_target.;
set &lb..&ds1.
	&lb..&ds2.
	&lb..&ds3.
;
	run;
%mend Append3DS;

%macro Append4DS(lb,ds1,ds2,ds3,ds4,ds_target);
data &lb..&ds_target.;
set &lb..&ds1.
	&lb..&ds2.
	&lb..&ds3.
	&lb..&ds4.
;
	run;
%mend Append4DS;

%macro Append5DS(lb,ds1,ds2,ds3,ds4,ds5,ds_target);
data &lb..&ds_target.;
set &lb..&ds1.
	&lb..&ds2.
	&lb..&ds3.
	&lb..&ds4.
	&lb..&ds5.
;
	run;
%mend Append5DS;

%macro Append6DS(lb,ds1,ds2,ds3,ds4,ds5,ds6,ds_target);
data &lb..&ds_target.;
set &lb..&ds1.
	&lb..&ds2.
	&lb..&ds3.
	&lb..&ds4.
	&lb..&ds5.
	&lb..&ds6.
;
	run;
%mend Append6DS;

%macro Append7DS(lb,ds1,ds2,ds3,ds4,ds5,ds6,ds7,ds_target);
data &lb..&ds_target.;
set &lb..&ds1.
	&lb..&ds2.
	&lb..&ds3.
	&lb..&ds4.
	&lb..&ds5.
	&lb..&ds6.
	&lb..&ds7.
;
	run;
%mend Append7DS;

%macro Append8DS(lb,ds1,ds2,ds3,ds4,ds5,ds6,ds7,ds8,ds_target);
data &lb..&ds_target.;
set &lb..&ds1.
	&lb..&ds2.
	&lb..&ds3.
	&lb..&ds4.
	&lb..&ds5.
	&lb..&ds6.
	&lb..&ds7.
	&lb..&ds8.
;
	run;
%mend Append8DS;

%macro Append9DS(lb,ds1,ds2,ds3,ds4,ds5,ds6,ds7,ds8,ds9,ds_target);
data &lb..&ds_target.;
set &lb..&ds1.
	&lb..&ds2.
	&lb..&ds3.
	&lb..&ds4.
	&lb..&ds5.
	&lb..&ds6.
	&lb..&ds7.
	&lb..&ds8.
	&lb..&ds9.
;
	run;
%mend Append9DS;

%macro AppendNDSdetemp(lb,ds_list,ds_target);
data &lb..&ds_target.;
set &ds_list.;
run;
%mend AppendNDSdetemp;


%macro AppendNDS_Sv(lb,DSN_Stem,Start_v,n,ds_target);
data &lb..&ds_target.;
set 
%do i=1 %to &n.;
%let v=%eval(&start_v.+&i.-1);
&lb..&DSN_stem.&v. 
%end;
;
run;
%mend AppendNDS_Sv;

%macro AppendNDS_SvS(lb,DSN_Stem1,DSN_Stem2,Start_v,n,ds_target);
data &lb..&ds_target.;
set 
%do i=1 %to &n.;
%let v=%eval(&start_v.+&i.-1);
&lb..&DSN_stem1.&v.&DSN_Stem2. 
%end;
;
run;
%mend AppendNDS_SvS;

%macro AppendNDS_SvSv(lb,DSN_Stem1,DSN_Stem2,Start_v,n,ds_target);
data &lb..&ds_target.;
set 
%do i=1 %to &n.;
%let v=%eval(&start_v.+&i.-1);
&lb..&DSN_stem1.&v.&DSN_Stem2. 
%end;
;
run;
%mend AppendNDS_SvSv;

%macro AppendNDS_SvSvS(lb,DSN_Stem1,DSN_Stem2,DSN_Stem3,Start_v,n,ds_target);
data &lb..&ds_target.;
set 
%do i=1 %to &n.;
%let v=%eval(&start_v.+&i.-1);
&lb..&DSN_stem1.&v.&DSN_Stem2.&v.&DSN_Stem3.  
%end;
;
run;
%mend AppendNDS_SvSvS;


%macro MakeOrder(lib, dbs, key);
proc sort data=&lib..&dbs.; by &key.; run;
%mend MakeOrder;

%macro FaireOrdre(lib, dbs, key);
proc sort data=&lib..&dbs.; by &key.; run;
%mend FaireOrdre;

%macro MakeOrderOut(lib, dbs, dbs_nouveau,key);
proc sort data=&lib..&dbs. out=&lib..&dbs_nouveau. ; by &key.; run;
%mend MakeOrderOut;

%macro FaireOrdreDehors(lib, dbs, dbs_nouveau,key);
proc sort data=&lib..&dbs. out=&lib..&dbs_nouveau. ; by &key.; run;
%mend FaireOrdreDehors;

%macro FaireOrdreDehors3(lib, dbs, dbs_nouveau,key);
proc sort data=&lib..&dbs. out=&dbs_nouveau. ; by &key.; run;
%mend FaireOrdreDehors3;


%macro FaireOrdreDehors2(lib,dbs,key);
%let keytrunc=%sysfunc(substrn(&key.,1,4));
PROC SORT DATA=&lib..&dbs. DUPOUT=&lib..&dbs._dupby_&keytrunc. NODUPKEY OUT=&lib..&dbs._uniby_&keytrunc.;by &key.; run;
%mend FaireOrdreDehors2;


%macro RenameAVar(lib,dbs,var,newname);
data &lib..&dbs. ;
set &lib..&dbs. ;
rename &var.=&newname.; run;
%mend RenameAVar;

%macro RenommerUneVar(lib,dbs,var,newname);
data &lib..&dbs. ;
set &lib..&dbs. ;
rename &var.=&newname.; run;
%mend RenommerUneVar;

%macro RenommerUneVarDehors(lib,dbs,TargetLib,TargetDbs,var,newname);
data &TargetLib..&TargetDbs. ;
set &lib..&dbs. ;
rename &var.=&newname.; run;
%mend RenommerUneVarDehors;

%macro RenameAVarOut(lib,dbs,TargetLib,TargetDbs,var,newname);
data &TargetLib..&TargetDbs. ;
set &lib..&dbs. ;
rename &var.=&newname.; run;
%mend RenameAVarOut;

%macro RenameTwoVars(lib,dbs,var1,newname1,var2,newname2);
data &lib..&dbs. ;
set &lib..&dbs. ;
rename 
&var1.=&newname1.
&var2.=&newname2.;
run;
%mend RenameTwoVars;

%macro RenameThreeVars(lib,dbs,var1,newname1,var2,newname2,var3,newname3);
data &lib..&dbs. ;
set &lib..&dbs. ;
rename 
&var1.=&newname1. 
&var2.=&newname2.
&var3.=&newname3.;
run;
%mend RenameThreeVars;


%macro RenommerDeuxVars(lib,dbs,var1,newname1,var2,newname2);
data &lib..&dbs. ;
set &lib..&dbs. ;
rename 
&var1.=&newname1.
&var2.=&newname2.;
run;
%mend RenommerDeuxVars;

%macro RenommerTroisVars(lib,dbs,var1,newname1,var2,newname2,var3,newname3);
data &lib..&dbs. ;
set &lib..&dbs. ;
rename 
&var1.=&newname1. 
&var2.=&newname2.
&var3.=&newname3.;
run;
%mend RenommerTroisVars;

%macro reordervars(lib,dbs,VarListinOrder);
data &lib..&dbs. ;
retain &VarListinOrder. ;
set &lib..&dbs. ; run;
%mend reordervars;


%macro NewSinNumeric(lib,dbs,oldsin,newsin);
data &lib..&dbs. ;
set &lib..&dbs. ;
format &newsin. 9.0; 
&newsin.=input(&oldsin.,9.0);
/*drop &oldsin.; */
run;
%mend NewSinNumeric;

%macro SameSinNumeric(lib,dbs,oldsin);
data &lib..&dbs. ;
set &lib..&dbs. ;
format sin_temp 9.0; 
sin_temp=input(&oldsin.,9.0);
drop &oldsin.; 
rename sin_temp=&oldsin.;run;
%mend SameSinNumeric;



%macro SameFieldNumeric(lib,dbs,oldfield,digits);
data &lib..&dbs. ;
set &lib..&dbs. ;
format newfield &digits..0; 
newfield=input(&oldfield.,&digits..0);
drop &oldfield.; 
rename newfield=&oldfield.;run;
%mend SameFieldNumeric;


%macro ConvertChar2Num_withNoise(lbn,dsn,charvarname,digits,noiseword);
%let Digits_minus_1=%eval(&digits.-1);
%if "&noiseword." ne "none" %then %do;
%let FakeNum=9;
%do i=1 %to &Digits_minus_1.;
%let FakeNum=&FakeNum.9;
%end;
%td(&lbn.,&dsn.); if  lowcase(&charvarname.) eq "&noiseword." then &charvarname.="&FakeNum."; run;
%end;
%SameFieldNumeric(&lbn.,&dsn.,&charvarname.,&digits.);
%td(&lbn.,&dsn.); if  &charvarname. =&FakeNum. then &charvarname.=.; run;
%mend ConvertChar2Num_withNoise;


/*%ConvertChar2Num_withNoise(JCC,NCDB992&ending_yr.,V_YEAR,4,unknown);*/

%macro SameFieldDecimal(lib,dbs,oldfield,HowManyDecimal);
data &lib..&dbs. ;
set &lib..&dbs. ;
format newfield 8.&HowManyDecimal.; 
newfield=input(&oldfield.,8.&HowManyDecimal.);
drop &oldfield.; 
rename newfield=&oldfield.;run;
%mend SameFieldDecimal;


%macro ConvertChar2Decimal_withNoise(lbn,dsn,charvarname,CombienDecimal,noiseword);
%let FakeNum=99999999;
%if "&noiseword." ne "none" %then %do;
%td(&lbn.,&dsn.); if  lowcase(&charvarname.) eq "&noiseword." then &charvarname.="&FakeNum."; run;
%end;
%SameFieldDecimal(&lbn.,&dsn.,&charvarname.,&CombienDecimal.);
%if "&noiseword." ne "none" %then %do;
%td(&lbn.,&dsn.); if  &charvarname. eq &FakeNum. then &charvarname.=.; run;
%end;
%mend ConvertChar2Decimal_withNoise;
/*%ConvertChar2Decimal_withNoise(work,BarLineDeAggr_Horse_stack,&LaVar_deValeur.,2,none);*/


%macro NewFieldNumeric(lib,dbs,oldfield,newfield,digits);
data &lib..&dbs. ;
set &lib..&dbs. ;
format &newfield. &digits..0;
&newfield.=input(&oldfield.,&digits..0);
drop &oldfield.; run;
%mend NewFieldNumeric;


%macro SameIdNumeric(lib,dbs,oldid);
data &lib..&dbs. ;
set &lib..&dbs. ;
format sin_temp 9.0; 
sin_temp=input(&oldid.,9.0);
drop &oldid.; 
rename sin_temp=&oldid.;run;
%mend SameIdNumeric;

%macro NewSinNumeric(lib,dbs,dbs1,oldid,newid);
data &lib..&dbs1. ;
set &lib..&dbs. ;
format &newid. best12.0; 
&newid.=input(trim(&oldid.),9.0);
drop &oldid.; run;
%mend NewSinNumeric;

%macro NewSinChar(lib,dbs,oldsin,newsin);
data &lib..&dbs. ;
set &lib..&dbs. ;
format &newsin. $9.0; 
&newsin.=put(&oldsin.,9.0);
drop &oldsin.; run;
%mend NewSinChar;

%macro SameSinChar(lib,dbs,oldsin);
data &lib..&dbs. ;
set &lib..&dbs. ;
format sin_temp $9.0; 
sin_temp=put(&oldsin.,9.0);
drop &oldsin.; 
rename sin_temp=&oldsin.;run;
%mend SameSinChar;

%macro NewFieldChar(lib,dbs,oldField,newField,length);
data &lib..&dbs. ;
set &lib..&dbs. ;
format &newField. $&length..0; 
&newField.=put(&oldField.,&length..0);
drop &oldField.; run;
%mend NewFieldChar;

%macro SameFieldChar(lib,dbs,oldField,length);
data &lib..&dbs. ;
set &lib..&dbs. ;
format newField $&length..0; 
newField=put(&oldField.,&length..0);
drop &oldField.; 
rename newField=&oldField.;
run;
%mend SameFieldChar;

%macro RenameADS(lib,dbs,newname);
proc datasets lib=&lib. noprint;
	change &dbs.=&newname.;
run;quit;
%mend RenameADS;

%macro RenameADS_PW(lib,dbs,newname);
proc datasets lib=&lib. noprint;
	change &dbs.(pw=&ppcc.)=&newname.(pw=&ppcc.);
run;quit;
%mend RenameADS_PW;

%macro renommerunebdd(lib,dbs,newname);
proc datasets lib=&lib. noprint;
	change &dbs.=&newname.;
run;quit;
%mend renommerunebdd;

%macro CopyADS(lib1,dbs,lib2);
proc datasets lib=&lib1. noprint;
		copy out=&lib2.;
		select &dbs.;
run;quit;
%mend CopyADS;

%macro CopyAllLibDS(lib1,lib2);
proc datasets lib=&lib1. noprint;
		copy out=&lib2.;
run;quit;
%mend CopyAllLibDS;


%macro copierunebdd(lib1,dbs,lib2);
proc datasets lib=&lib1. noprint;
		copy out=&lib2.;
		select &dbs.;
run;quit;
%mend copierunebdd;

%macro MoveADS(lib1,dbs,lib2);
proc datasets lib1=&lib1. noprint;
		copy out=&lib2. move;
		select &dbs.;
run;quit;
%mend MoveADS;

%macro deplacerunebdd(lib1,dbs,lib2);
proc datasets lib1=&lib1. noprint;
		copy out=&lib2. move;
		select &dbs.;
run;quit;
%mend deplacerunebdd;

%macro DeleteDS(lib,dbslist);
proc datasets lib=&lib. noprint;
	delete &dbslist.;
run;quit;
%mend DeleteDS;
/*%DeleteDS(work,mtrx: vctr: temp:)*/

%macro DeleteDS_N(lib,DbsStem,StartNum,EndNum);
proc datasets lib=&lib. noprint;
	delete 
%do DeleteDS_Nj=&StartNum. %to &EndNum.;
&DbsStem.&DeleteDS_Nj.
%end;
;
run;quit;
%mend DeleteDS_N;


%macro DeleteDS_PW(lib,dbslist);
proc datasets lib=&lib. noprint;
	delete &dbslist. (pw=&ppcc.) ;
run;quit;
%mend DeleteDS_PW;

%macro supprimerbdd(lib,dbslist);
proc datasets lib=&lib. noprint;
	delete &dbslist.;
run;quit;
%mend supprimerbdd;

%macro removelabel(lib,ds);
proc datasets lib=&lib. nolist noprint;
       modify &ds. ;
        attrib _all_ label='' ; 
         format _all_;
run;quit;
%mend removelabel;

%macro EliminerMarqueur(lib,ds);
proc datasets lib=&lib. nolist noprint;
       modify &ds. ;
        attrib _all_ label='' ; 
         format _all_;
run;quit;
%mend EliminerMarqueur;

%macro sdelete(lib,ds);
data &lib..&ds.(pw="&ppcc." encrypt=yes);
set &lib..&ds.(obs=0 pw="&ppcc."); 
run;
%mend sdelete;

%macro sdeleteN();
%do i=1 %to 135;
%sdelete(work,stem_&i.);
%end;
%mend sdeleteN;

%macro vrrllr(lib,ds);
data &lib..&ds.(pw="&ppcc." encrypt=yes);
set &lib..&ds.; 
run;
%mend vrrllr;

%macro KeepVars(lib,dbs,list_of_vars);
data &lib..&dbs. ;
set &lib..&dbs. ;
keep  &list_of_vars.; run;
%mend KeepVars;

%macro TenirVars(lib,dbs,list_of_vars);
data &lib..&dbs. ;
set &lib..&dbs. ;
keep  &list_of_vars.; run;
%mend TenirVars;

%macro KeepVarsOut(lib,dbs,dbs_nouveau,list_of_vars);
data &lib..&dbs_nouveau. ;
set &lib..&dbs. ;
keep  &list_of_vars.; run;
%mend KeepVarsOut;

%macro TenirVarsDehors(lib,dbs,dbs_nouveau,list_of_vars);
data &lib..&dbs_nouveau. ;
set &lib..&dbs. ;
keep  &list_of_vars.; run;
%mend TenirVarsDehors;

%macro DropVars(lib,dbs,list_of_vars);
data &lib..&dbs. ;
set &lib..&dbs. ;
drop  &list_of_vars.; run;
%mend DropVars;

%macro LaisserTomberVars(lib,dbs,list_of_vars);
data &lib..&dbs. ;
set &lib..&dbs. ;
drop  &list_of_vars.; run;
%mend LaisserTomberVars;

%macro DropVarsOut(lib,dbs,dbs_nouveau,list_of_vars);
data &lib..&dbs_nouveau. ;
set &lib..&dbs. ;
drop  &list_of_vars.; run;
%mend DropVarsOut;

%macro LaisserTomberVarsDehors(lib,dbs,dbs_nouveau,list_of_vars);
data &lib..&dbs_nouveau. ;
set &lib..&dbs. ;
drop  &list_of_vars.; run;
%mend LaisserTomberVarsDehors;

%macro create_suffix_vars(lib,dsn,suffix);
proc transpose data=&lib..&dsn. out=suffixvars; run;
data suffixvars;
	set suffixvars;
	suffix_vars=cats(_name_,"_&suffix.");
	keep suffix_vars;
run;
proc transpose data=suffixvars out=suffixvars;
	id suffix_vars; 
run;
data suffixvars;
	set suffixvars;
	drop _name_;
run;
data &lib..&dsn.;
	merge 	&lib..&dsn.
			suffixvars;
run;
%mend create_suffix_vars;

%macro create_numbered_vars(lib,dsn,var_name_stem,number);
data &lib..&dsn.;
	set &lib..&dsn.;
	%do i = 0 %to &number.;
		&var_name_stem.&i. = . ;
	%end;
run;
%mend create_numbered_vars;



%macro add_cltid_by_sin(lib,db,sinvar);
%LinkByAnyKeyAcross(
&lib.,&db._01,
&db.,1,&sinvar.,0,
r2014404,
sin_cltid_tous,0,sin,1)
%mend add_cltid_by_sin;


%macro add_sin_by_cltid(lib,db,CltidVar);
%LinkByAnyKeyAcross(
&lib.,&db._01,
&db.,1,&CltidVar.,0,
r2014404,
cltid_sin_tous,0,cltid,1)
%mend add_sin_by_cltid;

%macro add_sin_by_cltid_prcq(lib,db,CltidVar);
%LinkByAnyKeyAcross(
&lib.,&db._01,
&db.,1,&CltidVar.,0,
&qq.,
cltid_sinttn,0,cltid,1)
%mend add_sin_by_cltid_prcq;



%macro compress(lib, ds, charorbin);
data &lib..&ds.(compress=&charorbin.);
set &lib..&ds.; 
run;
%mend compress;

%macro comprimer(lib, ds, charorbin);
data &lib..&ds.(compress=&charorbin.);
set &lib..&ds.; 
run;
%mend comprimer;

%macro index_1(lb,ds,key1);
data &lb..&ds.(index=(&key1.));
set &lb..&ds.;
run;
%mend index_1;

%macro index_1p(lb,ds,key1);
data &lb..&ds.(index=(&key1.) pw="&ppcc." encrypt=yes);
set &lb..&ds.(pw="&ppcc.");run;
%mend index_1p;


%macro index_2(lb,ds,key1,key2);
data &lb..&ds.(index=(&key1. &key2.));
set &lb..&ds.;run;
%mend index_2;

%macro index_2p(lb,ds,key1,key2);
data &lb..&ds.(index=(&key1. &key2. ) pw="&ppcc." encrypt=yes);
set &lb..&ds.(pw="&ppcc.");run;
%mend index_2p;


%macro index_3(lb,ds,key1,key2,key3);
data &lb..&ds.(index=(&key1. &key2. &key3.));
set &lb..&ds.;run;
%mend index_3;

%macro index_3p(lb,ds,key1,key2,key3);
data &lb..&ds.(index=(&key1. &key2. &key3.) pw="&ppcc." encrypt=yes);
set &lb..&ds.(pw="&ppcc.");run;
%mend index_3p;


%macro index_4(lb,ds,key1,key2,key3,key4);
data &lb..&ds.(index=(&key1. &key2. &key3. &key4.));
set &lb..&ds.;run;
%mend index_4;

%macro index_4p(lb,ds,key1,key2,key3,key4);
data &lb..&ds.(index=(&key1. &key2. &key3. &key4.) pw="&ppcc." encrypt=yes);
set &lb..&ds.;run;
%mend index_4p;

%macro index_Np(lb,ds,keyList);
data &lb..&ds.(index=(&keyList.) pw="&ppcc." encrypt=yes);
set &lb..&ds.(pw="&ppcc.");run;
%mend index_Np;

%macro MakeCopy01(lib,ds,affix);
data &lib..&ds._&affix.;
set &lib..&ds.(pw='asdf1234');run;
%mend MakeCopy01;

%macro MakeCopy(lib,ds);
data &lib..&ds.;
set &lib..&ds.;run;
%mend MakeCopy;

%macro MakeCopy02(lib1,ds1,lib2,ds2);
data &lib2..&ds2.;
set &lib1..&ds1.;run;
%mend MakeCopy02;

%macro MakeCopy2Work(lib,ds);
data &ds.;
set &lib..&ds.;
%mend MakeCopy2Work;

%macro FaireCopie(lib,ds,affix);
data &lib..&ds._&affix.;
set &lib..&ds.(pw='asdf1234');
%mend FaireCopie;

%macro psswrd(lib,ds,psw);
data &lib..&ds.(pw="&psw.");
set &lib..&ds.;
run;
%mend psswrd;

%macro motdepasse(lib,ds,psw);
data &lib..&ds.(pw=&psw.);
set &lib..&ds.;
run;
%mend motdepasse;






%macro MUExtract(ReqYear,ReqNumber,MUYear,var_list);
libname MU2014 "/disk/data/sas/kdit4/T1Analyst/prdv9/t1/sasdata/t1an/t1_csr/2014/srcData/MU_cummulate/backup";
libname MU2013 "/disk/data/sas/kdit4/T1Analyst/prdv9/t1/sasdata/t1an/t1_csr/2013/srcData/MU_cummulate";
libname MU2012 "/disk/data/sas/kdit4/T1Analyst/prdv9/t1/sasdata/t1an/t1_csr/2012";
libname MU2011 "/disk/data/sas/kdit4/T1Analyst/prdv9/t1/sasdata/t1an/t1_csr/2011";
libname R&ReqYear.&ReqNumber. "/disk/data/sas/kdit7/SRGAnalyst/prdv9/cls/sasdata/mthdan/adhoc_requests/&ReqYear.-&ReqNumber.";

data R&ReqYear.&ReqNumber..MU&MUyear.Ext4R&ReqYear.&ReqNumber.; set
%if &MUYear.=2014 %then MU2014.was24_cummulate_2014;
%if &MUYear.=2013 %then MU2013.g0062v00_all_2013; 
%if &MUYear.=2012 %then 
	MU2012.mu_2012a
   	MU2012.mu_2012b
   	MU2012.mu_2012c
   	MU2012.mu_2012d
   	MU2012.mu_2012e
   	MU2012.mu_2012f;
%if &MUYear.=2011 %then 
	MU2011.mu_2012a
   	MU2011.mu_2012b
   	MU2011.mu_2012c
   	MU2011.mu_2012d
   	MU2011.mu_2012e
   	MU2011.mu_2012f;
    keep &var_list.; run;
%mend MUExtract;



***************************;
*check no SIN appearing in elsewhere;
***************************;

%macro check_no_SIN_leak(lib,dbs,SINVarName);
%let DBS_racine=%sysfunc(substrn(&dbs.,1,6));
%dd(&lib.,&dbs.,&DBS_racine._SIN_RISK);
array vars{*} _character_;
do i=1 to dim(vars);
   if length(vars(i)) ge 9 then do;
	%let varlength=%sysfunc(length(vars(i)));
	%let jloopnum=%eval(&varlength.-8);
	sin_risk=0;
	risk_var=0;
	risk_pos=0;
	do j=1 to &jloopnum.;
		if substrn(vars(i),j,9)=input(&SINVarName.,$9.0) then do;
			sin_risk=sin_risk+1;
			risk_var=i;
			risk_pos=j;
		end;
	end;
    end;
end;
if sin_risk >0; 
run;
%mend check_no_SIN_leak;

***************************************************************;
*check no continuous 9 digits appearing in any character vars;
***************************************************************;

%macro SIN_Divulgation_Verifieur(lib,dbs);
%dd(&lib.,&dbs.,&dbs._SIN_check);
array vars{*} _character_;
do i=1 to dim(vars);
   if length(vars(i)) ge 9 then do;
		%let varlength=%sysfunc(length(vars(i)));
		%let jloopnum=%eval(&varlength.-8);
		sin_risk_count=0;
		last_risk_var=0;
		last_risk_pos=0;
		Here_Is_A_SIN=0;
		AllDigitSoFar=1;
			do j=1 to &jloopnum.;
					do k=0 to 8;
						IamDigit=("0" <= substrn(vars(i),j+k,1) AND substrn(vars(i),j+k,1) <= "9");
						AllDigitSoFar = AllDigitSoFar*IamDigit;
					end;
					Here_Is_A_SIN = AllDigitSoFar;
				if Here_Is_A_SIN=1 then do;
					sin_risk_count=sin_risk_count+1;
					last_risk_var=i;
					last_risk_pos=j;
				end;
			end;
  	end;
end;
run;
%dd(&lib.,&dbs._SIN_check,&dbs._SIN_risk);
where sin_risk_count >0; 
drop i j k IamDigit Here_Is_A_SIN AllDigitSoFar;
run;
%mend SIN_Divulgation_Verifieur;


%macro lowcaseall(lib,ds);
%td(&lib,&ds);
array vars{*} _char_;
	do i=1 to dim(vars);
	vars{i}=lowcase(vars{i});
	end;
	drop i;
run;
%mend lowcaseall;


%macro upcaseall(lib,ds);
%td(&lib,&ds);
array vars{*} _char_;
	do i=1 to dim(vars);
	vars{i}=upcase(vars{i});
	end;
	drop i;
run;
%mend upcaseall;


%macro propcaseall(lib,ds);
%td(&lib,&ds);
array vars{*} _char_;
	do i=1 to dim(vars);
	vars{i}=propcase(vars{i});
	end;
	drop i;
run;
%mend propcaseall;


%macro compresstrimnall(lib,ds);
%td(&lib,&ds);
array vars{*} _char_;
	do i=1 to dim(vars);
	vars{i}=compress(trimn(vars{i}));
	end;
	drop i;
run;
%mend compresstrimnall;

%macro COMPBL_trimall(lib,ds);
%td(&lib,&ds);
array vars{*} _char_;
	do i=1 to dim(vars);
/*	vars{i}=trim(vars{i});*/
/*	vars{i}=COMPBL(vars{i});*/
	vars{i}=COMPBL(trim(vars{i}));
	end;
	drop i;
run;
%mend COMPBL_trimall;

%macro COMPBL_trimnall(lib,ds);
%td(&lib,&ds);
array vars{*} _char_;
	do i=1 to dim(vars);
	vars{i}=COMPBL(trimn(vars{i}));
	end;
	drop i;
run;
%mend COMPBL_trimnall;

%macro ReplaceUnprintablesAll(lib,ds);
%td(&lib,&ds);
array vars{*} _char_;
	do i=1 to dim(vars);
		do until(test=0);
      		test=notprint(vars{i});
      		if test>0 then do;
         		substr(vars{i},test,1)=' ';
      		end;
   		end;
	end;
	drop i test;
run;
%mend ReplaceUnprintablesall;






%macro Blank2ACharAll(lib,ds,WhichChar);
%td(&lib,&ds);
array vars{*} _char_;
	do i=1 to dim(vars);
	vars{i}=translate(vars{i},"&WhichChar."," ");
	end;
	drop i;
run;
%mend Blank2ACharAll;

%macro AChar2BlankAll(lib,ds,WhichChar);
%td(&lib,&ds);
array vars{*} _char_;
	do i=1 to dim(vars);
	vars{i}=translate(vars{i}," ","&WhichChar.");
	end;
	drop i;
run;
%mend AChar2BlankAll;

%macro COMPBL_stripall(lib,ds);
%td(&lib,&ds);
array vars{*} _char_;
	do i=1 to dim(vars);
	vars{i}=COMPBL(strip(vars{i}));
	end;
	drop i;
run;
%mend COMPBL_stripall;

%macro missing2zerotous(lib,ds);
%td(&lib,&ds);
array vars{*} _numeric_;
	do i=1 to dim(vars);
	if missing(vars{i}) then vars{i}=0;
	end;
	drop i;
run;
%mend missing2zerotous;


%macro zero2missingtous(lib,ds);
%td(&lib,&ds);
array vars{*} _numeric_;
	do i=1 to dim(vars);
	if vars{i}=0 then vars{i}=missing;
	end;
	drop i;
run;
%mend zero2missingtous;


%macro missing2zero_charvar(lib,ds,charvarname);
%td(&lib,&ds);
	if missing(&charvarname.) then &charvarname.='0';
run;
%mend missing2zero_charvar;


%macro zero2missingtous_charvar(lib,ds,charvarname);
%td(&lib,&ds);
	if &charvarname.='0' then &charvarname.='';
run;
%mend zero2missingtous_charvar;



/*%macro SameFieldCharTous(lib,ds);*/
/*%td(&lib,&ds);*/
/*array vars{*} _numeric_;*/
/*	do i=1 to dim(vars);*/
/*	format newField $8.; */
/*	newField=put(vars{i},&8.);*/
/*	drop vars{i}; */
/*	rename newField=vars{i};*/
/*	end;*/
/*	drop i;*/
/*run;*/
/*%mend SameFieldCharTous;*/

%macro nounknownall(lib,ds);
%td(&lib,&ds);
array vars{*} _char_;
	do i=1 to dim(vars);
	if lowcase(vars{i}) eq 'unknown' then delete_feu=1;
	end;
	drop i;
	if delete_feu ne 1;
	drop delete_feu;
run;
%mend nounknownall;
















%macro transpose(lib,ds);
proc transpose data=&lib..&ds. 
				out=&lib..&ds._Trns; 
run;
%mend transpose;



%macro CustomLineMacro(XXX);
/*%define any CustomLine that contains &XXX. as you want for your code;*/
/*example 1:*/
/*if not missing(&xxx.);*/
/*example 2:*/
rename var&MakeIt_j. = &MakeIt_NameOfJ.;
/*Essentially here MakeIt_j and MakeIt_NameOfJ are both global macro vars as defined within MakeIt2EachInList*/
%mend CustomLineMacro;

%macro MakeIt2EachInList(Varlist,CustomLineMacroNM);
/*MakeIt2EachInList must be used with CustomLineMacro*/
/*Vars should segregated by one colon in a list ending with a colon*/
%global MakeIt_L MakeIt_a MakeIt_b MakeIt_i MakeIt_j;
%let MakeIt_L=%sysfunc(length(&Varlist.)) ;
%let MakeIt_a=1;
%let MakeIt_j=1;
%do MakeIt_i=1 %to &MakeIt_L.;
%let C=%sysfunc(substrn(&Varlist.,&MakeIt_i.,1));
	%if "&C." eq ":" %then %do;
		%let MakeIt_b=%eval(&MakeIt_i.-&MakeIt_a.);
		%let MakeIt_NameOfJ=%sysfunc(substrn(&Varlist.,&MakeIt_a.,&MakeIt_b.));
		%&CustomLineMacroNM.(&MakeIt_NameOfJ.)
		%let MakeIt_a=%eval(&MakeIt_i.+1);
		%let MakeIt_j=%eval(&MakeIt_j.+1);
	%end;
%end;
%mend MakeIt2EachInList;

%macro CustomLineMacroNM(element);
/*MakeIt2EachInList must be used with CustomLineMacro*/
/*%define any CustomLine that contains &XXX. as you want for your code;*/
/*example 1:*/
/*if not missing(&element.);*/
/*example 2:*/
rename var&MakeIt_j. = &element. ;
/*Essentially here MakeIt_j is a global macro vars as defined within MakeIt2EachInList*/
%mend CustomLineMacroNM;

/*Examples of MakeIt2EachInList and CustomLineMacroNM*/
/**/
/*Firstly define the operation for each var you want with template for CustomLineMacroNM*/
/*%macro ChangeVarNameInSeries(element);*/
/*rename Var&MakeIt_j. = &element. ;*/
/*%mend ChangeVarNameInSeries;*/
/**/
/*Secondly simply invoke the MakeIt2EachInList with CustomLineMacroNM replaced */
/*by the actual name like ChangeVarNameInSeries*/
/*%MakeIt2EachInList(*/
/*varname1:*/
/*varname2:*/
/*varname3:*/
/*,ChangeVarNameInSeries);*/
/**/
/*The above invocation of  MakeIt2EachInList can generate the below codes:*/
/**/
/*rename Var1 = Varname1;*/
/*rename Var2 = Varname2;*/
/*rename Var3 = Varname3;*/
/**/
/*The reason we need to have this MakeIt2EachInList is you needn't to know the number */
/*of vars in that list. YOu simpply put the list in the macro MakeIt2EachInList as long as*/
/*you want. Without this automatic identification of every single var in the list, you cannot*/
/*write a macro as you are uncertain about how many inputs as well as how many comas you need*/
/*to write in the macro. */

%macro BreakUpDSbyVarval(BrkUP_lb,BrkUP_ds,byVar,byVarValues);
%global &BrkUP_lb. &BrkUP_ds. &byVar.; 
%macro OutputDSNM(element);
&BrkUP_lb..&BrkUP_ds.&element.
%mend OutputDSNM;
%macro IfThenOutput(element);
if &byVar. = "&element." then output &BrkUP_lb..&BrkUP_ds.&element.;
%mend IfThenOutput;
data 
%MakeIt2EachInList(&byVarValues,OutputDSNM)
;
set &BrkUP_lb..&BrkUP_ds.;
%MakeIt2EachInList(&byVarValues,IfThenOutput)
run;
%mend BreakUpDSbyVarval;

%macro BreakUpDSbyVarval_numeric(BrkUP_lb,BrkUP_ds,byVar,byVarValues);
%global &BrkUP_lb. &BrkUP_ds. &byVar.; 
%macro OutputDSNM(element);
&BrkUP_lb..&BrkUP_ds.&element.
%mend OutputDSNM;
%macro IfThenOutput(element);
if &byVar. = &element. then output &BrkUP_lb..&BrkUP_ds.&element.;
%mend IfThenOutput;
data 
%MakeIt2EachInList(&byVarValues,OutputDSNM)
;
set &BrkUP_lb..&BrkUP_ds.;
%MakeIt2EachInList(&byVarValues,IfThenOutput)
run;
%mend BreakUpDSbyVarval_numeric;

%macro MakeOrderedProv(lb,ds,ProvVar);
%dt(&lb.,&ds.);
format &ProvVar. 8. order 8.;
If &ProvVar.=110 then order=1; else
If &ProvVar.=104 then order=2; else
If &ProvVar.=101 then order=3; else
If &ProvVar.=100 then order=4; else
If &ProvVar.=105 then order=5; else
If &ProvVar.=103 then order=6; else
If &ProvVar.=99  then order=7; else
If &ProvVar.=106 then order=8; else
If &ProvVar.=97  then order=9; else
If &ProvVar.=98  then order=10; else
If &ProvVar.=107 then order=11; else
If &ProvVar.=102 then order=12; else
If &ProvVar.=108 then order=13; else
If &ProvVar.=372 then order=14; else
order=.;
&ProvVar.=&ProvVar.+1000*order;
drop order;
run;
%mend MakeOrderedProv;



%macro PearsonCorr(lb,ds,varlist);
proc corr data = &lb..&ds.;
var &varlist.; run;
%mend PearsonCorr;
/*%copy PearsonCorr/source;*/



%macro SpaceUnderscoreInVar(lb,ds,var);
%dd(&lb.,&ds.,&ds._01);
&var.=translate(trim(&var.)," ","_");
run;
%mend SpaceUnderscoreInVar;



%macro DePanelize(lb,ds,ts,cs,anavar,FlatByWhich);
%let ds_trunc=%sysfunc(substrn(&ds.,1,9));

%dd2(&lb.,&ds.,work,&FlatByWhich.);
keep &FlatByWhich.;run;
%faireordre(work,&FlatByWhich. nodupkey,&FlatByWhich.)
%td(work,&FlatByWhich.);
call symput("FlatByWhich"||left(_n_), trim(left(&FlatByWhich.)));
call symput('Num_of_Prov',_n_);
run;

%do z=1 %to &Num_of_Prov.;

%dd2(&lb.,&ds.,work,&&FlatByWhich&z..);
%if "&FlatByWhich."="&cs." %then keep &ts. &anavar.;;
%if "&FlatByWhich."="&ts." %then keep &cs. &anavar.;;
where &FlatByWhich.=trim("&&FlatByWhich&z..");
run;

%td(work,&&FlatByWhich&z..);
rename &anavar.=&&FlatByWhich&z..;
run;

%if &z. eq 1 %then %do;
%DD(work,&&FlatByWhich&z..,Flat_&ds_trunc.);run;
%end;
%if &z. ne 1 %then %do;
%if "&FlatByWhich."="&cs." %then %lier(work,Flat_&ds_trunc.,Flat_&ds_trunc.,0,&&FlatByWhich&z..,0,&ts.);;
%if "&FlatByWhich."="&ts." %then %lier(work,Flat_&ds_trunc.,Flat_&ds_trunc.,0,&&FlatByWhich&z..,0,&cs.);;
%end;

%end;

%DD2(work,Flat_&ds_trunc.,&lb.,Flat_&ds_trunc._by_&FlatByWhich.);run;
%mend DePanelize;

/*%DePanelize(&r.,Panel_PerCapitaGas_Yearly01,year,prov,PerCapitaGas,prov)*/
/*%DD(&r.,Panel_PerCapitaGas_Yearly01,Panel_PerCapitaGas_Yearly02);format Time $6.; Time=("YR"||left(Year));run;*/
/*%DePanelize(&r.,Panel_PerCapitaGas_Yearly02,time,prov,PerCapitaGas,time)*/

%macro All_in_1_Plot(lb,ds,h_var,hvarlabel,h_var_fmt,v_varlist,vlabel,vunit,title1,title2,source);
%let L=%sysfunc(length(&v_varlist.)) ;
%let a=1;
%let j=1;
%do i=1 %to &L.;										 
%let C=%sysfunc(substrn(&v_varlist.,&i.,1));
	%if "&C." eq ":" %then %do;
		%let b=%eval(&i.-&a.);
		%let NameOfJ=%sysfunc(substrn(&v_varlist.,&a.,&b.));
		%let v_var&j. = &NameOfJ. ;
		%let a=%eval(&i.+1);
		%let j=%eval(&j.+1);
	%end;
%end;
%let j=%eval(&j.-1);

goptions reset=all border; 

title1 "&title1."; 
title2 "&title2.";
footnote j=l " Source:&source." 
         j=r "&sysday. &sysdate. &systime.  "; 
%do x=1 %to &j.;
/*%let value=%sysfunc(byte(&x.+64));*/
/*%put &value.;*/
	symbol&x. 
	font=marker 
/*	value=D */
/*	value=%sysfunc(byte(&x.+64))*/
	value=dot
	interpol=join 
	color=_style_; 
%end;

axis1 
order=(1990 to 2016 by 5) 
      label=(j=r "&hvarlabel.") 
      major=(height=2) 
      minor=(number=4 height=1) 
      offset=(2,2) 
      width=3
; 

axis2 																
/*order=(0 to 200 by 20) */
      label=(j=r "&vlabel." j=r "&vunit.")
/*      major=(height=1.5)  offset=(0,0) */
/*      minor=(number=1 height=1)*/
; 		

proc gplot data=&lb..&ds.; 
plot 

%do x=1 %to &j.;
		&&v_var&x..*&h_var.     
%end;

   / 
overlay legend=legend1 
					haxis=axis1 
                    vaxis=axis2 
/*                    hminor=3 */
/*                    vminor=1 */
/*                    lvref=2 */
/*                    vref=500 1000 1500 2000 2500*/
                    ; 
format &h_var. &h_var_fmt..;
run;

quit; 
title1;
title2;
footnote;
%mend All_in_1_Plot;





%macro BubblePlot(lb,ds,vvar,vvarlabel,vunit,hvar,hvarlabel,hvarformat,BubbleVar,title1,title2,source);
goptions reset=all border;
options nodate;
data _null_;
call symput ('timenow',put (time(),time.));
call symput ('datenow',put (date(),date9.));
run;

title1 "&title1."; 	
title2 "&title2."; 															   
 
/*footnote j=r "Source: &source." ; */
footnote j=l " Source: &source." 
         j=r "&sysday. &datenow. &timenow.  ";
/* define symbol characteristics */ 
/*symbol1 interpol=join width=2 value=dot*/
/*symbol1 interpol=join width=2  value=dot*/
/*symbol1 interpol=join width=1.5  value=circle*/
/*symbol interpol=spline width=2 value=none*/
;

/*symbol1 interpol=spline width=2 value=triangle c=steelblue;*/
/*symbol2 interpol=spline width=2 value=circle c=indigo;*/
/*symbol3 interpol=spline width=2 value=square c=orchid;*/

/* define axis characteristics */ 
axis1 
order=(1995 to 2016 by 3) 

      label=(j=r "&hvarlabel.") 
/*      major=(height=2) */
/*      minor=(number=4 height=1) */
/*      offset=(2,2) */
/*      width=3*/
; 
axis2 																
order=(0 to 40000000 by 10000000) 
      label=(j=c "&vvarlabel." j=c "&vunit.")
/*      major=(height=1.5)  offset=(0,0) */
/*      minor=(number=1 height=1)*/
; 			 


proc gplot data=&lb..&ds.;
format &hvar. &hvarformat..;
   bubble &vvar.*&hvar.=&BubbleVar. / 
						haxis=axis1
                     	vaxis=axis2 
/*                     	vref=(5000000 10000000 15000000 20000000 25000000)*/
;
run;quit;
title1;title2;footnote;
%mend BubblePlot;



%macro ChangeVarLength(lb,ds,var,length);
%td(&lb.,&ds.);				   
length &var._tmp $&Length.;
format &var._tmp $&Length..;
&var._tmp=&var.;
drop &var.;
rename &var._tmp=&var.;
run;
%mend ChangeVarLength;

/*Magic command lines*/
;*';*";*/;
/*;*';*";*/;quit;*/;

%macro CreatePanelLags(lb,ds,cs,ts,var,Length_of_Lags);
%faireordre(&lb.,&ds.,&cs. &ts.);
proc panel data=&lb..&ds.;
id &cs. &ts.;
lag &var.(
%do i=1 %to &Length_of_Lags.;
&i. 
%end;
)/out=&lb..&ds._lag;
run; quit;
%mend CreatePanelLags;

%macro forecast(lb,ds,groupvar,timevar,interval,seriesvar,seriesvar_label,lead,Plot_Ind,Plot_Title,PlotResid_Ind,PlotResid_Title,source);
%dt(&lb.,&ds.);label &seriesvar.="&seriesvar_label.";run;
%faireordre(&lb.,&ds.,&groupvar. &timevar.);
proc forecast data=&lb..&ds. interval=&interval. lead=&lead.
/*              method=expo trend=2*/
				METHOD=STEPAR 
				out=&lb..&ds._pred outfull outresid
              	outest=&lb..&ds._est outfitstats;
   by &groupvar.;
   id &timevar.;
   var &seriesvar.;
run;
%if "&Plot_Ind." = "1" %then %do;
goptions reset=all border; options nodate;
%global timenow1 datenow1;
data _null_; 
call symput ('timenow1',put(time(),time.));
call symput ('datenow1',put(date(),date9.)); run;
title1 "&Plot_Title."; 	
footnote j=l " Source: &source. and Forecast by STEPAR " 
         j=r "&sysday. &datenow1. &timenow1.  ";
proc sgplot data=&lb..&ds._pred;
   series x=&timevar. y=&seriesvar. / group=_type_ lineattrs=(pattern=1);
   by &groupvar.;
   where _type_ ne 'RESIDUAL';
   xaxis values=('1jan93'd to '1dec25'd by qtr);
   refline '31dec15'd / axis=x;
/*   yaxis values=(6000 to 24000 by 3000);*/

run;quit;
title1;footnote;
%end;

%if "&PlotResid_Ind."="1" %then %do;
goptions reset=all border; options nodate;
%global timenow2 datenow2;
data _null_; 
call symput ('timenow2',put(time(),time.));
call symput ('datenow2',put(date(),date9.)); run;
title1 "&PlotResid_Title."; 
footnote j=l " Source: &source. and Forecast by STEPAR " 
         j=r "&sysday. &datenow2. &timenow2.  ";	
proc sgplot data=&lb..&ds._pred;
   where _type_='RESIDUAL';
   needle x=&timevar. y=&seriesvar. / markers;
   xaxis values=('1jan93'd to '1dec16'd by qtr);
   by &groupvar. ;
run;quit;
title1;footnote;
%end;
%mend forecast;

/*%forecast(carbon,CanGasSold_byMonth_001,prov,YearMonth,month,*/
/*Gross_GasSales,Gross Gasoline Sold (1000 litre),120,*/
/*1,Gross Gasoline Sold Actual and Predicted,*/
/*1,The Residues of Gross Gasoline Sold Predicted,*/
/*Statistics Canada);*/


%macro minimize_distance_merge(lb,ds1,ds2,targetds,
ds1_exactkey1,ds2_exactkey1,
ds1_minidiskey1,ds2_minidiskey1,
ds1_minidiskey2,ds2_minidiskey2);
%get_n_of_obs1(&lb.,&ds1.);
%do seq=1 %to 
/*50;*/
&n_of_obs.;
%dd(&lb.,&ds1.,obtemp);if _n_=&seq.;run;

proc sql;
create table work.targettemp as
select 
obtemp.*,
&ds2..*

from 
&lb..obtemp, 
&lb..&ds2.;
run;
quit;

%dt(&lb.,targettemp);
dis_1=compged(&ds1_exactkey1.,&ds2_exactkey1.);
dis_2=compged(&ds1_minidiskey1.,&ds2_minidiskey1.);
dis_3=compged(&ds1_minidiskey2.,&ds2_minidiskey2.);
key3_diff=abs(&ds1_minidiskey2.-&ds2_minidiskey2.);
run;

%dt(&lb.,targettemp);
where dis_1=0;
run;

%faireordre(&lb.,targettemp,dis_2 key3_diff dis_3);
%dt(&lb.,targettemp);if _n_=1; run;

%if &seq.=1 %then %do;
%dd(&lb.,targettemp,&targetds.);run;
%end;%else %do;
%append2ds(&lb.,&targetds.,targettemp,&targetds.);
%end;

%end;

%mend minimize_distance_merge;

/*%minimize_distance_merge(work,*/
/*sales_makeyearmodel_mssfixms,*/
/*VehiEco_for_stg2Prob,*/
/*sales_fueleco_ok3_byminidis,*/
/*make,make01,*/
/*model,model01,*/
/*year,year01);*/


%macro voila_xls311(lb,ds,folderandfilename,classvar1,classvar2,classvar3,ana1,stat1);
ODS TAGSETS.EXCELXP
	file	="&folderandfilename..xls" 
	STYLE	=statistical
	OPTIONS (	Orientation 	= 'landscape'
				FitToPage 		= 'yes'
				Pages_FitWidth 	= '1'
				Pages_FitHeight = '100' 
			);
proc tabulate data=&lb..&ds. order=formatted;
class &classvar1. &classvar2. &classvar3. ;
var  &ana1.;
tables (&classvar1. all)* (&classvar2. all), (&classvar3. all)*&ana1.*&stat1.;
run;
ods tagsets.excelxp close;
%mend voila_xls311;

%macro voila_xls211(lb,ds,folderandfilename,classvar1,classvar2,ana1,stat1);
ODS TAGSETS.EXCELXP
	file	="&folderandfilename..xls" 
	STYLE	=statistical
	OPTIONS (	Orientation 	= 'landscape'
				FitToPage 		= 'yes'
				Pages_FitWidth 	= '1'
				Pages_FitHeight = '100' 
			);
proc tabulate data=&lb..&ds. order=formatted;
class &classvar1. &classvar2. ;
var  &ana1.;
tables (&classvar1. all), (&classvar2. all)*&ana1.*&stat1.;
run;
ods tagsets.excelxp close;
%mend voila_xls211;


/*create new text variable assigned with formatted value as text of an existing variable*/
%macro AssignFormatValue(lb,ds,var,formatname);
data &lb..&ds; set &lb..&ds;
&var._neo = put(&var, &formatname..); run;
%mend AssignFormatValue;
/*%dd(cs,Csdata009(obs=10000),testttttt);run;*/
/*%AssignFormatValue(cs,testttttt,complexity,$COMPLEX06CSENGFMT);*/
/*%AssignFormatValue(cs,testttttt,CMACA_CD,$CMACA06CSENGFMT);*/
/*%AssignFormatValue(cs,testttttt,filing_date,yymmdd10);*/


%macro MatchSpouseInfoFromSameDS(lb,ds,NewDSSuffix,indv_id,sps_id,var);
%dd(&lb.,&ds.,sps_&var.);
keep &indv_id. &var. ; run;
%dt(&lb.,sps_&var.);
rename &indv_id.=&sps_id. &var.=sps_&var.; run;
%lier(&lb.,&ds._&NewDSSuffix.,&ds.,1,sps_&var.,0,&sps_id.);
%mend MatchSpouseInfoFromSameDS;
/*%MatchSpouseInfoFromSameDS(glq,coupleana_2016,sx,indv_clt_sin_ttn,decl_sps_sin_ttn,indv_clt_gndr_cd);*/
/*%MatchSpouseInfoFromSameDS(glq,coupleana_2016_sx,bd,indv_clt_sin_ttn,decl_sps_sin_ttn,indv_clt_brth_dt);*/


%macro Get_1STs_by_2Vars_pw(lb,ds,FirstByVar,SecondByVar,SecondByVar_Order);
%faireordredehors(&lb.,&ds.(pw=&ppcc.),&ds._1(pw=&ppcc.),
&FirstByVar. &SecondByVar_Order. &SecondByVar.);
%dt(&lb.,&ds._1(pw=&ppcc.));
if first.&FirstByVar.; by &FirstByVar.; run;
%mend Get_1STs_by_2Vars_pw;

%macro Get_1STs_by_2Vars(lb,ds,FirstByVar,SecondByVar,SecondByVar_Order);
%faireordredehors(&lb.,&ds.,&ds._1,&FirstByVar. &SecondByVar_Order. &SecondByVar.);
%dt(&lb.,&ds._1);if first.&FirstByVar.; by &FirstByVar.; run;
%mend Get_1STs_by_2Vars;


%macro Get_1STs_by_3Vars_pw(lb,ds,FirstByVar,SecondByVar,ThirdByVar,ThirdByVar_Order);
%faireordredehors(&lb.,&ds.(pw=&ppcc.),&ds._1(pw=&ppcc.),
&FirstByVar. &SecondByVar. &ThirdByVar_Order. &ThirdByVar.);
%dt(&lb.,&ds._1(pw=&ppcc.));
if first.&SecondByVar.; by &FirstByVar. &SecondByVar. ; run;
%mend Get_1STs_by_3Vars_pw;


%macro Get_1STs_by_3Vars(lb,ds,FirstByVar,SecondByVar,ThirdByVar,ThirdByVar_Order);
%faireordredehors(&lb.,&ds.,&ds._1,
&FirstByVar. &SecondByVar. 
%If "&ThirdByVar_Order." eq "descending" %then %Do;
&ThirdByVar_Order. 
%end;
&ThirdByVar.);
%dt(&lb.,&ds._1);
if first.&SecondByVar.; 
by &FirstByVar. &SecondByVar. ;
run;
%mend Get_1STs_by_3Vars;

/*%impcsv(pracq,test_of_first,C:\Users\cxc366\temporary\02saslearning\practice\test_of_first.csv)*/
/*%Get_1STs_by_3Vars(pracq,test_of_first,id,x,y,descending);*/
/*impcsv(lib,ds,folderandfile)*/

%macro TousBonsChars(lb,ds);
%let lesmauvais = "���������������������������������������������������������#";
%let lesbons    = "AAAAAACEEEEIIIIDNOOOOOOUUUUYaaaaaaceeeeiiiidnoooooouuuuyy ";
%td(&lb.,&ds.); 
array vars{*} _char_;
do i=1 to dim(vars);
vars{i}=translate(vars{i},&lesbons.,&lesmauvais.);
end;
drop i;
run;
%mend TousBonsChars;

/********Below not yet archived in excel****************************************************************************/;
%macro ExpXls2PracNoEmpty(lb,ds);
%seeifthereisdata(&lb.,&ds.);
%if &n_of_obs. >0 %then %do;
%expxls2prac(&ds.);
%end; %else %do;
%put Il y a rien dans &ds.;
%end;
%mend ExpXls2PracNoEmpty;

%macro CountByACat(lib,dsn,CatVar,IDVar,Cat_Result,Count_Result,DSN_Result);
proc sql;
create table &lib..&DSN_Result. as
select count(&IDVar.) as &Count_Result.,
		&CatVar. as &Cat_Result.
from &lib..&dsn.
group by &CatVar.;
run;
quit;
%mend CountByACat;

%macro SumByACat(lib,dsn,CatVar,IDVar,Cat_Result,Sum_Result,DSN_Result);
proc sql;
create table &lib..&DSN_Result. as
select Sum(&IDVar.) as &Sum_Result.,
		&CatVar. as &Cat_Result.
from &lib..&dsn.
group by &CatVar.;
run;
quit;
%mend SumByACat;

%macro CountSumByACat(lib,dsn,CatVar,Cat_Result,Var4Count,Count_Result,Var4Sum,Sum_Result,DSN_Result);
proc sql;
create table &lib..&DSN_Result. as
select 
count(&Var4Count.) as &Count_Result.,
Sum(&Var4Sum.) as &Sum_Result.,
&CatVar. as &Cat_Result.

from &lib..&dsn.
group by &CatVar.;
run;
quit;
%mend CountSumByACat;


%macro Run1Macro4ObjectList(MacroName,ObjectList);
%let Run1Macro4ObjectList_L=%sysfunc(length(&ObjectList.)) ;
%let Run1Macro4ObjectList_a=1;
%let Run1Macro4ObjectList_j=1;
%do Run1Macro4ObjectList_i=1 %to &Run1Macro4ObjectList_L.;
%let Run1Macro4ObjectList_C=%sysfunc(substrn(&ObjectList.,&Run1Macro4ObjectList_i.,1));
	%if "&Run1Macro4ObjectList_C." eq ":" %then %do;
		%let Run1Macro4ObjectList_b=%eval(&Run1Macro4ObjectList_i.-&Run1Macro4ObjectList_a.);
		%let Run1Macro4ObjectList_NameOfJ=%sysfunc(substrn(&ObjectList.,&Run1Macro4ObjectList_a.,&Run1Macro4ObjectList_b.));
		%&MacroName.(&Run1Macro4ObjectList_NameOfJ.);
		%let Run1Macro4ObjectList_a=%eval(&Run1Macro4ObjectList_i.+1);
		%let Run1Macro4ObjectList_j=%eval(&Run1Macro4ObjectList_j.+1);
	%end;
%end;
;
run;
%mend Run1Macro4ObjectList;
/**/
/*%macro DonnerMoiVarListinDS(DSN);*/
/*%ov2folder(JCC,&DSN.,&JCA_Fldr.);*/
/*%mend DonnerMoiVarListinDS;*/
/**/
/*%Run1Macro4ObjectList(DonnerMoiVarListinDS,*/
/*TSB_ASIS_AIRCRAFT190107:*/
/*TSB_ASIS_ATM190107:*/
/*TSB_ASIS_ENGINE190107:*/
/*TSB_ASIS_ENVIRON190107:*/
/*TSB_ASIS_EVENTPHASES190107:*/
/*TSB_ASIS_FIRE190107:*/
/*TSB_ASIS_INJURY190107:*/
/*TSB_ASIS_LANDING_TO190107:*/
/*TSB_ASIS_OPERATION190107:*/
/*TSB_ASIS_OVERVIEW190107:*/
/*TSB_ASIS_SURVIVABILITY190107:)*/

%Macro TameAllChars(LBN,DSN);
%RemoveNPCs_OnlyControls(&LBN.,&DSN.,&DSN.);
%TousBonsChars(&LBN.,&DSN.);
%lowcaseall(&LBN.,&DSN.);
%COMPBL_stripall(&LBN.,&DSN.);
%Mend TameAllChars;

%Macro TameAllChars2(LBN,DSN);
%let lesmauvais = "���������������������������������������������������������#";
%let lesbons    = "AAAAAACEEEEIIIIDNOOOOOOUUUUYaaaaaaceeeeiiiidnoooooouuuuyy ";
%td(&lbN.,&dsN.); 
  array charvars _char_;
    length npschars $32;
/* *32 is the total number of control characters from 0 to 31;*/
    retain npschars;

if _N_=1 then do;
     do i=0 to 31;
      	if i=0 then npschars=byte(i);else 
		npschars=trim(npschars)||byte(i);
     end;
end;

array vars{*} _char_;
do i=1 to dim(vars);
	vars{i}=compress(vars{i}, npschars);
	vars{i}=translate(vars{i},&lesbons.,&lesmauvais.);
	vars{i}=lowcase(vars{i});
	vars{i}=COMPBL(strip(vars{i}));
end;
drop i npschars;
run;
%Mend TameAllChars2;

%Macro TameAllCharsKeepAllAccent(LBN,DSN);
%RemoveNPCs_OnlyControls(&LBN.,&DSN.,&DSN.);
%lowcaseall(&LBN.,&DSN.);
%COMPBL_stripall(&LBN.,&DSN.);
%Mend TameAllCharsKeepAllAccent;

%Macro TameAllCharsKeepFrenchAccent(LBN,DSN);
%let lesmauvais = "������������������������������������������#";
%let lesbons    = "AAAAAEIIIDNOOOOOOUUYaaaaaeiiidnoooooouuuyy ";
%td(&lbN.,&dsN.); 
length npschars $32;
/* *32 is the total number of control characters from 0 to 31;*/
retain npschars;
if _N_=1 then do;
     do i=0 to 31;
      	if i=0 then npschars=byte(i);else 
		npschars=trim(npschars)||byte(i);
     end;
end;

array vars{*} _char_;
do i=1 to dim(vars);
/*	vars{i}=compress(vars{i}, npschars);*/
	vars{i}=translate(vars{i},'                                ',npschars);
	vars{i}=translate(vars{i},&lesbons.,&lesmauvais.);
	vars{i}=lowcase(vars{i});
	vars{i}=COMPBL(strip(vars{i}));
end;
drop i npschars;
run;
%Mend TameAllCharsKeepFrenchAccent;











;


%macro ExploreACharVar(LBN,DSN,CharVar);
%global CharVarTrunc lngthMcr lngthMcr_moin1;
%let one=1;
%let DSNTrunc=%sysfunc(substr(&DSN.,1,8));
%let CharVarTrunc=%sysfunc(substr(&CharVar.,1,8));
/*%let VarlngthMcr_moin1=%eval(&Varlngth.-&one.);*/

data work.&DSNTrunc._&CharVarTrunc.; set &LBN..&DSN.; 
keep &CharVar.; 
/*%do j=1 %to &VarlngthMcr_moin1.;*/
/*		%let max_start_pos=%eval(&Varlngth.-&j.+&one.);*/
/*	%do k=1 %to &max_start_pos. ;*/
/*		%let end_pos = %eval(&k.+&j.-&one.);*/
/*		;*/
/*		Mvng_&j._Chars_fr_&k._to_&end_pos. = "";*/
/*	%end;*/
/*%end;*/
run;

%dt(work,&DSNTrunc._&CharVarTrunc.);
Lngth_&CharVarTrunc.=length(&CharVar.);
Lngthplus_&CharVarTrunc.=length(&CharVar.)+1;
call symputx('lngthMcr',Lngth_&CharVarTrunc.);

If Lngth_&CharVarTrunc. ge 1 then do; 
	Frst1_&CharVarTrunc.=substr(&CharVar.,1,1);
	end;

If Lngth_&CharVarTrunc. ge 2 then do; 
	Frst2_&CharVarTrunc.=substr(&CharVar.,1,2);
	end;
If Lngth_&CharVarTrunc. ge 3 then do; 
	Frst3_&CharVarTrunc.=substr(&CharVar.,1,3);
	end;

If Lngth_&CharVarTrunc. ge 3 then do;


if Lngth_&CharVarTrunc. ge 2 then do;

%let lngthMcr_moin1=%eval(&lngthMcr.-&one.);
%do i=2 %to &lngthMcr_moin1. ;
	%let lngthMcr_moin&i.=%eval(&lngthMcr.-&i.);
%end;
end;

%do j=1 %to &lngthMcr_moin1.;
		%let max_start_pos=%eval(&lngthMcr.-&j.+&one.);
	%do k=1 %to &max_start_pos. ;
		%let end_pos=%eval(&k.+&j.-&one.);
		Mvng_&j._Chars_fr_&k._to_&end_pos. = substr(&CharVar.,&k.,&j.);
	%end;
%end;

end;

Pos_1stLttr_&CharVarTrunc.	=AnyAlpha(&CharVar.);
Pos_1stNmbr_&CharVarTrunc.	=AnyDigit(&CharVar.);
Pos_1stCtrl_&CharVarTrunc.	=AnyCNTRL(&CharVar.);
Pos_1stGrph_&CharVarTrunc.	=AnyGraph(&CharVar.);
Pos_1stSASC_&CharVarTrunc.	=AnyFirst(&CharVar.);

if Pos_1stLttr_&CharVarTrunc. eq 1 and Pos_1stNmbr_&CharVarTrunc. gt 1 then do;
		Start_Is_Lttr_&CharVarTrunc.=1;
		Start_Is_Nmbr_&CharVarTrunc.=0;
		IsMx_LttrNmbr_&CharVarTrunc. =1;
		IsMx_LttrGo1st_&CharVarTrunc.=1;
		IsMx_NmbrGo1st_&CharVarTrunc.=0;
		IsMx_Pre_Sbstr_&CharVarTrunc.=substr(&CharVar.,1,Pos_1stNmbr_&CharVarTrunc.-1);
		IsMx_Pst_Sbstr_&CharVarTrunc.=substr(&CharVar.,Pos_1stNmbr_&CharVarTrunc.,lngth_&CharVarTrunc.-Pos_1stNmbr_&CharVarTrunc.+1);
		end; else
if Pos_1stLttr_&CharVarTrunc. gt 1 and Pos_1stNmbr_&CharVarTrunc. eq 1 then do;
		Start_Is_Lttr_&CharVarTrunc.=0;
		Start_Is_Nmbr_&CharVarTrunc.=1;
		IsMx_LttrNmbr_&CharVarTrunc. =1;
		IsMx_LttrGo1st_&CharVarTrunc.=0;
		IsMx_NmbrGo1st_&CharVarTrunc.=1;
		IsMx_Pre_Sbstr_&CharVarTrunc.=substr(&CharVar.,1,Pos_1stLttr_&CharVarTrunc.-1);
		IsMx_Pst_Sbstr_&CharVarTrunc.=substr(&CharVar.,Pos_1stLttr_&CharVarTrunc.,lngth_&CharVarTrunc.-Pos_1stLttr_&CharVarTrunc.+1);
		end; else
if Pos_1stLttr_&CharVarTrunc. eq 1 and Pos_1stNmbr_&CharVarTrunc. eq 0 then do;
		Start_Is_Lttr_&CharVarTrunc.=1;
		Start_Is_Nmbr_&CharVarTrunc.=0;
		IsMx_LttrNmbr_&CharVarTrunc. =0;
		IsPure_Lttr_&CharVarTrunc.=1;
		IsPure_Nmbr_&CharVarTrunc.=0;
		end; else
if Pos_1stLttr_&CharVarTrunc. eq 0 and Pos_1stNmbr_&CharVarTrunc. eq 1 then do;
		Start_Is_Lttr_&CharVarTrunc.=0;
		Start_Is_Nmbr_&CharVarTrunc.=1;
		IsMx_LttrNmbr_&CharVarTrunc. =0;
		IsPure_Lttr_&CharVarTrunc.=0;
		IsPure_Nmbr_&CharVarTrunc.=1;
		end; 
run;

%voila211(work,&DSNTrunc._&CharVarTrunc.,&f.\&DSN._&CharVar._Analysis Pos_1stLttr_ x Pos_1stNmbr_,
Pos_1stLttr_&CharVarTrunc.,8,
Pos_1stNmbr_&CharVarTrunc.,8,
Lngth_&CharVarTrunc.,n);

%voila311(work,&DSNTrunc._&CharVarTrunc.,&f.\&DSN._&CharVar._Analysis Lngth x Pos_1stLttr x Pos_1stNmbr,
Lngth_&CharVarTrunc.,8,
Pos_1stLttr_&CharVarTrunc.,8,
Pos_1stNmbr_&CharVarTrunc.,8,
Lngthplus_&CharVarTrunc.,n);

%freq(work,&DSNTrunc._&CharVarTrunc.,
Lngth_&CharVarTrunc.
Frst1_&CharVarTrunc.
Frst2_&CharVarTrunc.
Frst3_&CharVarTrunc.

Pos_1stLttr_&CharVarTrunc.
Pos_1stNmbr_&CharVarTrunc.
Pos_1stCtrl_&CharVarTrunc.
Pos_1stGrph_&CharVarTrunc.
Pos_1stSASC_&CharVarTrunc.

Start_Is_Lttr_&CharVarTrunc.
Start_Is_Nmbr_&CharVarTrunc.

IsMx_LttrNmbr_&CharVarTrunc. 
IsMx_LttrGo1st_&CharVarTrunc.
IsMx_NmbrGo1st_&CharVarTrunc.
IsMx_Pre_Sbstr_&CharVarTrunc.
IsMx_Pst_Sbstr_&CharVarTrunc.
IsPure_Lttr_&CharVarTrunc.
IsPure_Nmbr_&CharVarTrunc.

%do j=1 %to &lngthMcr_moin1.;
		%let max_start_pos=%eval(&lngthMcr.-&j.+&one.);
	%do k=1 %to &max_start_pos. ;
		%let end_pos=%eval(&k.+&j.-&one.);
		Mvng_&j._Chars_fr_&k._to_&end_pos. 
	%end;
%end;

);

%mend ExploreACharVar;


/*%FairelEssai(JCC,NCAMS10218_04CA_TOP3,200000);*/
/*%ExploreACharVar(work,test,aircrafttype);*/
/*Great! 2019-03-04*/

/*Go to Production NOW!!!*/
/* 2019-03-04*/

%macro DistillEtExplorer_CharVarVals(LBN,DSN,CharVar);
%global CharVarTrunc CharVarTrunc;
%let CharVarTrunc=%sysfunc(substr(&CharVar.,1,9));
%let DSNTrunc=%sysfunc(substr(&DSN.,1,9));
%dd2(&LBN.,&DSN.,work,&DSNTrunc._&CharVarTrunc.); where not missing(&CharVar.); run;
%dd(work,&DSNTrunc._&CharVarTrunc.,&DSNTrunc._&CharVarTrunc.1); keep &CharVar.; run;
%faireordre(work,&DSNTrunc._&CharVarTrunc.1 nodupkey, &CharVar.);
%expcsv2(work,&DSNTrunc._&CharVarTrunc.1,&JCC_Fldr.,The Values of &CharVar. in &DSN.);
%ExploreACharVar(work,&DSNTrunc._&CharVarTrunc.1,&CharVar.);
%mend DistillEtExplorer_CharVarVals;

%macro ExploreMissingVals(LBN,DSN,VarName,CatVar,CatVarFMT);
%global VarNameTrunc CatVarTrunc;
%let VarNameTrunc=%sysfunc(substr(&VarName.,1,6));
%let DSNTrunc=%sysfunc(substr(&DSN.,1,6));
%dd2(&LBN.,&DSN.,work,&DSNTrunc._&VarNameTrunc.);
if missing(&VarName.) then &VarNameTrunc._Is_Missing=1; else &VarNameTrunc._Is_Missing=0;
one=1;
keep &VarName. &CatVar. &VarNameTrunc._Is_Missing one;
run;
%voila211(work,&DSNTrunc._&VarNameTrunc.,&jcc_fldr.\Missing Values of &VarName. by &CatVar. in &LBN..&DSN.,
&CatVar.,&CatVarFMT.,
&VarNameTrunc._Is_Missing,8,
one,n);
%mend ExploreMissingVals;


%Macro RemoveDuplicateObs(LBN,DSN);
%faireordre(&LBN.,&DSN. nodupkey,_all_);
%mend RemoveDuplicateObs;
/*%RemoveDuplicateObs(LBN,DSN);*/




%macro DisplayASCIITable(LBN);
  data &LBN..ASCII_Table ;

%do i=0 %to 255;
	data un_char;i=&i.;byte_i=byte(i);run;
	%if i=0 %then %do; %dd(work,un_char,Javi_ASCII_Table);run;%end; %else %do;
	%append2ds(work,Javi_ASCII_Table,un_char,Javi_ASCII_Table);
	%end;
%end;
%dd2(work,Javi_ASCII_Table,&LBN.,Javi_ASCII_Table);run;
%mend DisplayASCIITable;
/*%DisplayASCIITable(jcc);*/
/*%dd2(work,Javi_ASCII_Table,jcc,Javi_ASCII_Table);run;*/


%macro RemoveNPCs(lb,ds);
  data &lb..&ds ;
     set &lb..&ds;
  
   array charvars _char_;
    length npschars $161;
/* *161 is the total number of characters from 0 to 31, 127 to 255;*/
    retain npschars;

if _N_=1 then do;
     do i=0 to 31, 127 to 255;
      if i= 0 then npschars=byte(i);
      else npschars=trim(npschars)||byte(i);
     end;
    end;

  do over charvars;
      charvars=compress(charvars, npschars);
  end;
drop npschars i;
run;  
%mend RemoveNPCs;



%macro RemoveNPCs01(lb,ds,ds_new);
  data &lb..&ds_new ;
     set &lb..&ds;
  
   array charvars _char_;
    length npschars $161;
/* *161 is the total number of characters from 0 to 31, 127 to 255;*/
    retain npschars;

if _N_=1 then do;
     do i=0 to 31, 127 to 255;
      if i= 0 then npschars=byte(i);
      else npschars=trim(npschars)||byte(i);
     end;
    end;

  do over charvars;
      charvars=compress(charvars, npschars);
  end;
drop npschars i;
run;  
%mend RemoveNPCs01;


%macro RemoveNPCs_OnlyControls(lb,ds,ds_new);
  data &lb..&ds_new ;
     set &lb..&ds;
  
   array charvars _char_;
    length npschars $32;
/* *32 is the total number of control characters from 0 to 31;*/
    retain npschars;

if _N_=1 then do;
     do i=0 to 31;
      	if i=0 then npschars=byte(i);else 
		npschars=trim(npschars)||byte(i);
     end;
end;

do over charvars;
      charvars=compress(charvars, npschars);
end;
drop npschars i;
run;  
%mend RemoveNPCs_OnlyControls;

%macro RemoveMacroEmpechement(LBN,DSN);
%dt(&LBN.,&DSN.); 
array vars{*} _char_;
do i=1 to dim(vars);
	vars{i}=translate(vars{i},%nrstr(" -- -  "),%nrstr(",/\%':%""));
end;
drop i;
run;
%mend RemoveMacroEmpechement;


%macro ArnfManufacture(ManufactureName);
%dd2(jcc,AERONEF_DESIGNATOR190310,work,&ManufactureName.); if find(typmnfctr, "&ManufactureName."); run;
%faireordre(work,&ManufactureName. nodupkey,descending typmaxseat descending TypMtow)
%mend ArnfManufacture;



%macro ArnfMaxSeat(MaxSeat);
%dd2(jcc,AERONEF_DESIGNATOR190310,work,SeatsMoreThan_&MaxSeat.); if typmaxseat >= "&MaxSeat."; run;
%faireordre(work,SeatsMoreThan_&MaxSeat. nodupkey,descending typmaxseat descending TypMtow);
%mend ArnfMaxSeat;


%macro ArnfType(TheType);
%EnleverNonAlphanum(&TheType.,TheTypeTreated);
%dd2(jcc,AERONEF_DESIGNATOR190310,work,ArnfType_&TheTypeTreated.); if find(typtrdnm, "&TheType."); run;
%faireordre(work,ArnfType_&TheTypeTreated. nodupkey,typtrdnm descending typmaxseat descending TypMtow);
%mend ArnfType;


%macro ArnfTypeCode(TheTypeCode);
%EnleverNonAlphanum(&TheTypeCode.,TheTypeTreated);
%dd2(jcc,AERONEF_DESIGNATOR190310,work,ArnfType_&TheTypeTreated.); if find(typdsgntr, "&TheTypeCode."); run;
%faireordre(work,ArnfType_&TheTypeTreated. nodupkey,typdsgntr descending typmaxseat descending TypMtow);
%mend ArnfTypeCode;
/**/
/**/
/*%ArnfManufacture(embraer);*/
/*%ArnfManufacture(bombardier);*/
/*%ArnfManufacture(airbus);*/
/*%ArnfManufacture(boeing);*/
/**/
/*%ArnfType(e-190);*/
/*%ArnfTypeCode(b38m);*/
/*%ArnfTypeCode(b738);*/
/**/
/*%ArnfMaxSeat(350);*/


%macro CaptureValueFromCatInclMissing(LBN,DSN,CatName);
%dd2(&LBN.,&DSN.,work,&CatName.); keep &CatName.; run;
%TameAllChars2(work,&CatName.);
%RemoveNPCs(work,&CatName.);
%faireordre(work,&CatName. nodupkey,&CatName.);
%dt(work,&CatName.); if missing(&CatName.) or anyalnum(&CatName.) eq 0 then &CatName. = "not available"; run;
%faireordre(work,&CatName. nodupkey,&CatName.);
%GenerateMacroVarSeriesfromDS2(work,&CatName.,&CatName.,&CatName.);
%mend CaptureValueFromCatInclMissing;
/*Output is global macro vars - &CatName._1  &CatName._2 ... and &CatName._combien for the Values of &CatName.*/


%macro CaptureValueFromCatInclMissing2(LBN,DSN,CatName,Outfolder);
%dd2(&LBN.,&DSN.,work,&CatName.); keep &CatName.; run;
%TameAllChars2(work,&CatName.);
%RemoveNPCs(work,&CatName.);
%faireordre(work,&CatName. nodupkey,&CatName.);
%dt(work,&CatName.); if missing(&CatName.) or anyalnum(&CatName.) eq 0 then &CatName. = "not available"; run;
%faireordre(work,&CatName. nodupkey,&CatName.);
%GenerateMacroVarSeriesfromDS2(work,&CatName.,&CatName.,&CatName.);
%expcsv(work,&CatName.,&Outfolder.);
%mend CaptureValueFromCatInclMissing2;
/*Output is global macro vars - &CatName._1  &CatName._2 ... and &CatName._combien for the Values of &CatName.*/


%macro CaptureValuesFromList(ListInColons,CaptureName);
%global &CaptureName._combien;
%global CaptureValuesFromList_L CaptureValuesFromList_a CaptureValuesFromList_b CaptureValuesFromList_i CaptureValuesFromList_j;
%let CaptureValuesFromList_L=%sysfunc(length(%quote(&ListInColons.))) ;
%let CaptureValuesFromList_a=1;
%let CaptureValuesFromList_j=1;
%do CaptureValuesFromList_i=1 %to &CaptureValuesFromList_L.;
	%let C=%sysfunc(substrn(%quote(&ListInColons.),&CaptureValuesFromList_i.,1));
		%if "%quote(&C.)" eq ":" %then %do;
			%global &CaptureName._&CaptureValuesFromList_j.;
			%let CaptureValuesFromList_b=%eval(&CaptureValuesFromList_i.-&CaptureValuesFromList_a.);
			%let &CaptureName._&CaptureValuesFromList_j.=%sysfunc(substrn(%quote(&ListInColons.),&CaptureValuesFromList_a.,&CaptureValuesFromList_b.));
			%let CaptureValuesFromList_a=%eval(&CaptureValuesFromList_i.+1);
			%let CaptureValuesFromList_j=%eval(&CaptureValuesFromList_j.+1);
		%end;
%end;
%let &CaptureName._combien=%eval(&CaptureValuesFromList_j.-1);
%mend CaptureValuesFromList;
/*Output is global macro vars - &CaptureName._1  &CaptureName._2 ... and &CaptureName._combien for the ListInColons.*/
/*%CaptureValuesFromList(alberta:british columbia:ontario:quebec:,prov);*/
/*It's great!*/


%macro CaptureValuesFromList02(ListInColons,CaptureName);
%let ListInColons=%sysfunc(translate(&ListInColons.,"!^","',"));
%global &CaptureName._combien;
%global CaptureValuesFromList_L CaptureValuesFromList_a CaptureValuesFromList_b CaptureValuesFromList_i CaptureValuesFromList_j;
%let CaptureValuesFromList_L=%sysfunc(length(%quote(&ListInColons.))) ;
%let CaptureValuesFromList_a=1;
%let CaptureValuesFromList_j=1;
%do CaptureValuesFromList_i=1 %to &CaptureValuesFromList_L.;
	%let C=%sysfunc(substrn(%quote(&ListInColons.),&CaptureValuesFromList_i.,1));
		%if "%quote(&C.)" eq ":" %then %do;
/*		%if rank("&C.)") eq  58 %then %do;*/
			%global &CaptureName._&CaptureValuesFromList_j.;
			%let CaptureValuesFromList_b=%eval(&CaptureValuesFromList_i.-&CaptureValuesFromList_a.);
			%let &CaptureName._&CaptureValuesFromList_j.=%sysfunc(substrn(%quote(&ListInColons.),&CaptureValuesFromList_a.,&CaptureValuesFromList_b.));
			%let &CaptureName._&CaptureValuesFromList_j.=%sysfunc(translate(&&&CaptureName._&CaptureValuesFromList_j..,"',","!^"));
			%let CaptureValuesFromList_a=%eval(&CaptureValuesFromList_i.+1);
			%let CaptureValuesFromList_j=%eval(&CaptureValuesFromList_j.+1);
		%end;
%end;
%let &CaptureName._combien=%eval(&CaptureValuesFromList_j.-1);
%mend CaptureValuesFromList02;
/*%CaptureValuesFromList02(*/
/*%quote(find(arprt_to_nm, 'toronto' ) :*/
/*find(arprt_to_nm, 'montreal' ) :*/
/*find(arprt_to_nm, 'vancouver' ) :*/
/*find(arprt_to_nm, 'calgary' ) :*/
/*find(arprt_to_nm, 'edmonton' ) :), TheCond);*/
/*parfait*/


%macro PearsonChiSquareTest(LBN,DSN,Cat1,FM1,LBL1,Cat2,FM2,LBL2);
%CaptureValueFromCatInclMissing(&LBN.,&DSN.,&Cat1.);
%CaptureValueFromCatInclMissing(&LBN.,&DSN.,&Cat2.);

%let title_part1=Chi-Square Tests for &&&Cat1._combien. x &&&Cat2._combien. Table of ;
%if ("&LBL1." ne "none") and ("&LBL2." ne "none") %then %do; 
	%let title_part2=&LBL1. and &LBL2.;
%end; %else %do; %let title_part2=&Cat1. and &Cat2.; %end;

proc freq data=&LBN..&DSN. order=freq;

%if ("&FM1." ne "none") or ("&FM2." ne "none") %then %do;
format 
%if "&FM1." ne "none" %then %do; &Cat1. &FM1..  %end;
%if "&FM2." ne "none" %then %do; &Cat2. &FM2..  %end;
;
%end;

%if ("&LBL1." ne "none") or ("&LBL2." ne "none") %then %do;
label 	
%if ("&LBL1." ne "none") %then %do; &Cat1. = "&LBL1." %end;
%if ("&LBL2." ne "none") %then %do; &Cat2. = "&LBL2." %end;
;
%end;

tables &CAT1.*&CAT2. / expected cellchi2 norow nocol chisq;
output out=&LBN..&DSN._ChiSqTest n nmiss pchi lrchi;
/*weight VarOfWeight;*/
title "&title_part1. &title_part2.";
run;
title;
proc print data=&LBN..&DSN._ChiSqTest noobs;
   title1 "Chi-Square Statistics for &title_part2.";
   title2 'Output Data Set from the FREQ Procedure';
run;
title1;
title2;
%mend PearsonChiSquareTest;



%macro ColorSpectrum();
/*proc registry list startat="COLORNAMES";RUN;*/
%impcsv(work,JAVI_ColorNameList,&whereNow.\Production\JAVI_ColorNameList.csv);

%get_n_of_obs1(work,JAVI_ColorNameList);
%do iColorSpectrum=1 %to &n_of_obs.;
%global LaCouleur&iColorSpectrum.;
%end;
%GenerateMacroVarSeriesfromDS2(work,JAVI_ColorNameList,ColorName,LaCouleur);
/*LaCouleur1 LaCouleur2 LaCouleur_combien*/
%mend ColorSpectrum;
%ColorSpectrum();

%macro RandomColorPicker(OutputColorMVar);
data ARandomNbr; ARandomNbr=floor(1+150*rand('uniform'));run;
%global LeRandomNbr &OutputColorMVar.;
%dt(work,ARandomNbr); call symputx('LeRandomNbr',ARandomNbr);run;
%let &OutputColorMVar.=&&LaCouleur&LeRandomNbr..;
%mend RandomColorPicker;


%macro RandomNumberPicker(OutputRandomMVar,UPEnd);
data ARandomNbr; ARandomNbr=floor(1+&UPEnd.*rand('uniform'));run;
%global &OutputRandomMVar.;
%dt(work,ARandomNbr); call symputx("&OutputRandomMVar.",ARandomNbr);run;
%mend RandomNumberPicker;




%macro CondenseLongName(ALongName,ShorterName);
%let ALongName=%sysfunc(translate(&ALongName., "_______" , ":,/\'()" ));
%global &ShorterName.AfterCondense;
%let LeLongeur = %sysfunc(length(&ALongName.));
%if &LeLongeur. gt 32 %then %let &ShorterName.AfterCondense = %sysfunc(substr(&ALongName.,1,32));
						  %else %let &ShorterName.AfterCondense =&ALongName.;
%mend CondenseLongName;

/*%CondenseLongName(%quote(:Very1234LongVeryLong::VeryL ongVeryLongVeryLongVeryLongVeryLongVeryLong),MyShorterName);*/
/*Parfait!*/

%macro CondenseLongName02(ALongName,ShorterName,CombienDigits);
%let ALongName=%sysfunc(translate(&ALongName., "_______" , ":,/\'()" ));
%global &ShorterName.AfterCondense;
%let LeLongeur = %sysfunc(length(&ALongName.));
%if &LeLongeur. gt &CombienDigits. %then %let &ShorterName.AfterCondense = %sysfunc(substr(&ALongName.,1,&CombienDigits.));
						  %else %let &ShorterName.AfterCondense = &ALongName.;
%mend CondenseLongName02;
/*%CondenseLongName02(%quote(:Very1234LongVeryLong::VeryL ongVeryLongVeryLongVeryLongVeryLongVeryLong),MyShorterName,15);*/


%macro CondenseLongName03(ALongName,MyOutput,CombienDigits);
%global &MyOutput.;
%let ALongName=%sysfunc(translate(&ALongName., "_______" , ":,/\'()" ));
%let LeLongeur = %sysfunc(length(&ALongName.));
%if &LeLongeur. gt &CombienDigits. %then %let &MyOutput.= %sysfunc(substr(&ALongName.,1,&CombienDigits.));
						  %else %let &MyOutput. = &ALongName.;
%mend CondenseLongName03;
/*%CondenseLongName03(%quote(:Very1234LongVeryLong::VeryL ongVeryLongVeryLongVeryLongVeryLongVeryLong),MyShorterName,10);*/

%macro CondenseLongName04(ALongName,MyOutput,CombienDigits);
%global &MyOutput.;
%let ALongName=%sysfunc(translate(&ALongName., "_______" , ":,/\'()" ));
%let LeLongeur = %sysfunc(length(&ALongName.));

%if "&LeLongeur." ne "" %then %do;
%if &LeLongeur. gt &CombienDigits. %then %do; 
	%let &MyOutput.=%sysfunc(substr(&ALongName.,1,&CombienDigits.));
%end; %else %do; 
	%let &MyOutput. =&ALongName.;
%end;
%end;
%mend CondenseLongName04;



%macro CondenseLongName05(ALongName,MyOutput,CombienDigits);
%supprimerbdd(work,LeNull);
%global &MyOutput.;
data LeNull;
X="&ALongName.";
L=length(x);
if L gt &CombienDigits. then do;
short=substr(x,1,&CombienDigits.);
end; else do;
short=x;
end;
call symputx("&MyOutput.",short);
run;
%mend CondenseLongName05;
/*%CondenseLongName05(barbarlalalalallalaXXXXXXXXXXXXXXXXXXXXXXXXXXXXXbarbarlalalalallalaXXXXXXXXXXXXXXXXXXXXXXXXXXXXX,ValueOnRighHandSide,55);*/




%macro EnleverNonAlphanum(Input,Output);
%let TheOutPutLen=%sysfunc(length(&Input.));
%global &Output.;
data work.EnleverNonAlphanum; format TheOutput $&TheOutPutLen..; Input="&Input." ; TheOutput=''; run;
%RemoveNPCs(work,EnleverNonAlphanum);
%TameAllChars2(work,EnleverNonAlphanum);
%dt(work,EnleverNonAlphanum);
do i=1 to &TheOutPutLen.;
TheChar=substr(input,i,1);
if TheChar in ( 'a' 	'b' 	'c' 	'd' 	'e' 	'f' 	'g' 	'h' 	'i' 	'j' 	'k' 	'l' 	'm' 	'n' 	'o' 	'p' 	'q' 	'r' 	's' 	't' 	'u' 	'v' 	'w' 	'x' 	'y' 	'z' 	'1' 	'2' 	'3' 	'4' 	'5' 	'6' 	'7' 	'8' 	'9' 	'0' 	'_'   )
then do; TheOutput=compress(cat(compress(TheOutput),TheChar)); end;
end;
call symputx("&Output.",TheOutput);
run;
%mend EnleverNonAlphanum;
/*parfait*/


%macro EnleverVoyelle(Input,Output);
%let TheOutPutLen=%sysfunc(length(&Input.));
%global &Output.;
data work.EnleverVoyelle; format TheOutput $&TheOutPutLen..; Input="&Input." ; TheOutput=substr(input,1,1); run;
%RemoveNPCs(work,EnleverVoyelle);
%TameAllChars2(work,EnleverVoyelle);
%dt(work,EnleverVoyelle);
do i=2 to &TheOutPutLen.;
TheChar=substr(input,i,1);
if TheChar not in ( 'a' 'e' 'i' 'o' 'u' 'y' ) then do; 
/*	if i=1 then TheOutput=TheChar; else */
	TheOutput=compress(cat(compress(TheOutput),TheChar)); 
	end;
end;
call symputx("&Output.",TheOutput);
run;
%mend EnleverVoyelle;
/*%EnleverNonAlphanum(Ah-Here_Is_my_school_address,OnlyAlphanum);*/
/*%EnleverVoyelle(&OnlyAlphanum.,OnlyConsonne);*/
/*parfait*/

%macro EnleverVoyelleEtCondense(Input,Output,CombienDigits);
%EnleverVoyelle(&Input.,EnleverVoyelleRslt);
%CondenseLongName03(&EnleverVoyelleRslt.,&Output.,&CombienDigits.);
%mend EnleverVoyelleEtCondense;
/*%EnleverVoyelleEtCondense(%quote(:Very1234LongVeryLong::VeryL ongVeryLongVeryLongVeryLongVeryLongVeryLong),*/
/*AResult,15);*/
/*parfait*/




%macro RankingByFreqOf1CAT(lbn,dsn,TargetFreqDSNStem,CATName);
%CondenseLongName03(&TargetFreqDSNStem._&catname.,TheOutDS,30);
proc sql;
create table &lbn..&TheOutDS. as select
&catname.,
sum(1) as freq
from 
&lbn..&dsn.
group by &catname.
;run; quit;
%faireordre(&lbn.,&TheOutDS.,descending freq);
%mend RankingByFreqOf1CAT;

%macro RankingByFreqOf1CAT02(lbn,dsn,TargetFreqDSNStem,CATName,output_fldr);
%global TheFreqOutDS;
%CondenseLongName03(&TargetFreqDSNStem._&catname.,TheFreqOutDS,30);
proc sql;
create table work.&TheFreqOutDS. as select
&catname.,
sum(1) as freq
from 
&lbn..&dsn.
group by &catname.
;run; quit;
%faireordre(work,&TheFreqOutDS.,descending freq);
%expcsv(work,&TheFreqOutDS.,&output_fldr.);
%mend RankingByFreqOf1CAT02;

%macro RankingByFreqOf1CAT03(lbn,dsn,TargetFreqDSNStem,CATName);
%global TheFreqOutDS;
%CondenseLongName03(&TargetFreqDSNStem._&catname.,TheFreqOutDS,30);
proc sql;
create table work.&TheFreqOutDS. as select
&catname.,
sum(1) as freq
from 
&lbn..&dsn.
group by &catname.
;run; quit;
%faireordre(work,&TheFreqOutDS.,descending freq);
/*%expcsv(work,&TheFreqOutDS.,&output_fldr.);*/
%mend RankingByFreqOf1CAT03;

/*wrapper example*/
/*%macro RankingCADORSby1CAT(CatName);*/
/*%RankingByFreqOf1CAT02(jcc,&DS_CADORS_ccarcs_nacis.,CDRS_Frq_by,&CatName.,&JCO_CADORS.);*/
/*%mend RangkingCADORSby1CAT(CatName);*/
/*%RankingCADORSby1CAT(occrr_cat)*/

/*/*Key cat for SSRA ranking*/*/
/*%Run1Macro4ObjectList(RankingCADORSby1CAT,*/
/*occ_typ_e:*/
/*occrr_clss_e:*/
/*evntnm_e:*/
/*acrftcat_cdr_ccrcs:*/
/*op_sctr_cdr_nacis:*/
/*/*acrftcat_e:*/*/
/*/*op_sctr_e:*/*/
/*occrr_cat:*/
/*flghtphs_e:*/
/*dmg_e:*/
/*fatalities:*/
/*injuries:)*/
;

%macro RankingByFreqOfCATList(lbn,dsn,ObsScope,RankOutputDSNStem,output_fldr,CATList);
%EnleverVoyelleEtCondense(&CATList.,CATListCondensed,20);
%EnleverVoyelleEtCondense(&RankOutputDSNStem._&CATListCondensed._etc,TheOutDS,31);
%CaptureValuesFromList02(&CATList.,LaCAT);
/*Output is global macro vars - LaCAT_1  LaCAT_2 ... and LaCAT_combien for the CATList.*/
proc sql;
create table &lbn..&TheOutDS. as select
%do i = 1 %to &LaCAT_combien.;
&&LaCAT_&i..,
%end;
sum(1) as freq
from 
&lbn..&dsn.
%if "&ObsScope." ne "none" %then %do; (where=(&ObsScope.)) %end;
group by 
&LaCAT_1.
%do i = 2 %to &LaCAT_combien.;
, &&LaCAT_&i..
%end;
;run; quit;
%faireordre(&lbn.,&TheOutDS.,descending freq);
%expcsv(&lbn.,&TheOutDS.,&output_fldr.);
%mend RankingByFreqOfCATList;

/*%RankingByFreqOfCATList(jcc,&DS_CADORS_ccarcs_nacis.,*/
/*/*not missing(acrftcat_e) and */*/
/*/*not missing(op_sctr_e) and */*/
/*not missing(acrftcat_cdr_ccrcs) and */
/*not missing(op_sctr_cdr_nacis) and */
/*not missing(occrr_cat) and */
/*not missing(flghtphs_e)  */
/*,CDRS_4cats,&jco_cadors.,*/
/*acrftcat_cdr_ccrcs:*/
/*op_sctr_cdr_nacis:*/
/*/*acrftcat_e:*/*/
/*/*op_sctr_e:*/*/
/*occrr_cat:*/
/*flghtphs_e:*/
/*);*/
;


%macro RankingByFreqOfCATList_AddPct(lbn,dsn,ObsScope,RankOutputDSNStem,output_fldr,CATList);
%RankingByFreqOfCATList(&lbn.,&dsn.,&ObsScope.,&RankOutputDSNStem.,&output_fldr.,&CATList.);
%dd2(&lbn.,&dsn.,work,&dsn.); where &ObsScope.; run;
%get_n_of_obs1(work,&dsn.);
%dt(&lbn.,&TheOutDS.); freq_relative=freq/&n_of_obs.; drop freq; run;
%expcsv(&lbn.,&TheOutDS.,&output_fldr.);
%mend RankingByFreqOfCATList_AddPct;


%macro RankingByFreqOfCATList_AddPct02(lbn,dsn,ObsScope,RankOutputDSNStem,output_fldr,CATList);
%RankingByFreqOfCATList(&lbn.,&dsn.,&ObsScope.,&RankOutputDSNStem.,&output_fldr.,&CATList.);
%dd2(&lbn.,&dsn.,work,&dsn.); where &ObsScope.; run;
%get_n_of_obs1(work,&dsn.);
%dt(&lbn.,&TheOutDS.); freq_relative=freq/&n_of_obs.; 
/*drop freq; */
run;
%expcsv(&lbn.,&TheOutDS.,&output_fldr.);
%mend RankingByFreqOfCATList_AddPct02;



%macro MaterializeFormatToShadowVar(LBN,DSN,TheVAR,TheFormat);
%dd2(&LBN.,&DSN.,work,&DSN._wrk);format &TheVAR. &TheFormat.. ;Seq=_n_; run;
%dd(work,&DSN._wrk,&DSN._var);keep seq &TheVAR.;run;
%expcsv(work,&DSN._var,&JCT_Fldr.);
%impcsv(work,&DSN._var,&JCT_Fldr.\&DSN._var.csv);
%RenommerUneVar(work,&DSN._var,&TheVAR.,&TheVAR._shdw);
%lierwithoutsort(work,&DSN._wrk,&DSN._wrk,1,&DSN._var,1,seq);
%mend MaterializeFormatToShadowVar;

%macro MaterializeFormatToShadowVar2(LBN,DSN,TheVAR,TheFormat);
%dd2(&LBN.,&DSN.,work,&DSN._wrk);format &TheVAR. &TheFormat.. ;Seq=_n_; run;
%dd(work,&DSN._wrk,&DSN._var);keep seq &TheVAR.;run;
%expcsv(work,&DSN._var,&JCT_Fldr.);
%impcsv(work,&DSN._var,&JCT_Fldr.\&DSN._var.csv);
%RenommerUneVar(work,&DSN._var,&TheVAR.,&TheVAR._shdw);
%lierwithoutsort(work,&DSN._wrk,&DSN._wrk,1,&DSN._var,1,seq);
%dt(work,&DSN._wrk); drop &TheVAR.;  rename &TheVAR._shdw=&TheVAR.; run;
%dd2(work,&DSN._wrk,&LBN.,&DSN.);run;
%mend MaterializeFormatToShadowVar2;

%macro MaterializeFormatToShadowVar3(LBN,DSN,TheVAR,TheFormat);
%dd2(&LBN.,&DSN.,work,&DSN._wrk);format &TheVAR. &TheFormat.. ;Seq=_n_; run;
%dd(work,&DSN._wrk,&DSN._var);keep seq &TheVAR.;run;
%expcsv(work,&DSN._var,&JCT_Fldr.);
%impcsv(work,&DSN._var,&JCT_Fldr.\&DSN._var.csv);
%RenommerUneVar(work,&DSN._var,&TheVAR.,&TheVAR._shdw);
%lierwithoutsort(work,&DSN._wrk,&DSN._wrk,1,&DSN._var,1,seq);
/*%dt(work,&DSN._wrk); drop &TheVAR.;  rename &TheVAR._shdw=&TheVAR.; run;*/
%dd2(work,&DSN._wrk,&LBN.,&DSN.);run;
%mend MaterializeFormatToShadowVar3;


%Macro RenameAllVarsWithPrefix01(LBN,DSN,PrefixAvecSouslignage,OutputFeu,OutputFldrOfOldNewNames);
%ov0_temp01(&LBN.,&DSN.,Prfx);
%dt(work,&DSN._Prfx);
OldName=Name;
OldName_Length=length(Name);
format PrfxName $42.;
PrfxName=cat("&PrefixAvecSouslignage.",OldName);
If length(PrfxName) ge 32 then do;
PrfxName=substr(PrfxName,1,32);
end;
NewName_Length=length(PrfxName);
run;
%if "&OutputFeu." eq "1" %then %do;
%expcsv(work,&DSN._Prfx,&OutputFldrOfOldNewNames.);
%end;
%GenerateMacroVarSeriesfromDS1(work,&DSN._Prfx,Name,OldName);
%GenerateMacroVarSeriesfromDS1(work,&DSN._Prfx,PrfxName,NewName);
%dt(&LBN.,&DSN.);
%do RenameAllVarsWithPrefix_i=1 %to &n_of_NewName.;
 rename &&OldName&RenameAllVarsWithPrefix_i.. = &&NewName&RenameAllVarsWithPrefix_i.. ;
%end;
run;
%mend RenameAllVarsWithPrefix01;
/*%FairelEssai2(jcc,ASIS_OVERVIEW190107,1000,ASIS_OVERVIEW190107_TSTT);*/
/*%RenameAllVarsWithPrefix01(work,ASIS_OVERVIEW190107_TSTT,tsb_,1,&jcc_fldr.);*/



%Macro RenameAllVarsByDeVowels01(LBN,DSN,
CombienPremiersDePasChange,CombienDerniersDePasChange,LengthThresholdToRename,
OutputFeu,OutputFldrOfOldNewNames);
%ov0_temp01(&LBN.,&DSN.,Dvwl);
%dt(work,&DSN._Dvwl);
OldName=Name;
OldName_Length=length(Name);
NameDevowelled=Name;

if OldName_Length ge &LengthThresholdToRename. then do;
	NameDevowelled=substr(Name,1,&CombienPremiersDePasChange.);
	LeCommenceDeChange=&CombienPremiersDePasChange.+1;
	LaFinDeChange=OldName_Length-&CombienDerniersDePasChange. ;
	DerniersDePasChange=substr(Name,LaFinDeChange+1,&CombienDerniersDePasChange.);
	do i=LeCommenceDeChange to LaFinDeChange;
		PriorChar=substr(OldName,i-1,1);
		TheChar=substr(OldName,i,1);
		if (TheChar not in ( 'a' 'e' 'i' 'o' 'u' 'y' )) or 
		( (TheChar in ( 'a' 'e' 'i' 'o' 'u' 'y' )) and PriorChar = '_') 
		then do; 
			NameDevowelled=compress(cat(compress(NameDevowelled),TheChar)); 
		end;
	end;
	NameDevowelled=compress(cat(compress(NameDevowelled),compress(DerniersDePasChange)));
	drop LeCommenceDeChange LaFinDeChange DerniersDePasChange i PriorChar TheChar ;
end; 
NameDevowelled_Length=length(NameDevowelled);
run;
%if "&OutputFeu." eq "1" %then %do;
%expcsv(work,&DSN._Dvwl,&OutputFldrOfOldNewNames.);
%end;
%GenerateMacroVarSeriesfromDS1(work,&DSN._Dvwl,Name,OldName);
%GenerateMacroVarSeriesfromDS1(work,&DSN._Dvwl,NameDevowelled,NewName);
%dt(&LBN.,&DSN.);
%do RenameAllVarsByDeVowels_i=1 %to &n_of_NewName.;
 rename &&OldName&RenameAllVarsByDeVowels_i.. = &&NewName&RenameAllVarsByDeVowels_i.. ;
%end;
run;
%mend RenameAllVarsByDeVowels01;
/*%FairelEssai2(jcc,ASIS_OVERVIEW190107,1000,ASIS_OVERVIEW190107_TSTT);*/
/*%RenameAllVarsByDeVowels01(work,ASIS_OVERVIEW190107_TSTT,3,3,10,1,&jcc_fldr.);*/
/*parfait !!!*/

%Macro RenameAllVarsDevowelPrefix01(LBN,DSN,CombienPremiersDePasChange,CombienDerniersDePasChange,LengthThresholdToRename,PrefixAvecSouslignage,OutputFldrOfOldNewNames);
%RenameAllVarsByDeVowels01(&LBN.,&DSN.,&CombienPremiersDePasChange.,&CombienDerniersDePasChange.,&LengthThresholdToRename.,0,&OutputFldrOfOldNewNames.)
%RenameAllVarsWithPrefix01(&LBN.,&DSN.,&PrefixAvecSouslignage.,0,&OutputFldrOfOldNewNames.);
%dd(work,&DSN._Dvwl,&DSN._DP);
format NewName $42.;
NewName=cat("&PrefixAvecSouslignage.",NameDevowelled);
If length(NewName) gt 32 then do;
	NewName=substr(NewName,1,32);
end;
NewName_Length=length(NewName);
run;
%expcsv(work,&DSN._DP,&OutputFldrOfOldNewNames.);
%mend RenameAllVarsDevowelPrefix01;
/*%FairelEssai2(jcc,ASIS_OVERVIEW190107,1000,ASIS_OVERVIEW190107_tst);*/
/*%RenameAllVarsDevowelPrefix01(work,ASIS_OVERVIEW190107_tst,3,3,10,tsb_,&jcc_fldr.);*/
/*up to production!*/
/*2019-04-02*/



%macro get_n_of_obs1(lb,ds);
proc sql; create table n_of_obs as select sum(1) as n_of_obs from &lb..&ds.; quit;
data _null_; set n_of_obs; %global n_of_obs; call symputx ("n_of_obs",n_of_obs); run;
/*%put "n_of_obs is " &n_of_obs.;*/
%mend get_n_of_obs1;

/*Get the Type of a Variable*/
/*%let lbn=jcc;*/
/*%let dsn=ABGR12N_09_CA;*/
/*%let varname=air_weight_kilos;*/

%macro Get_VarType(lbn,dsn,varname);
%ov0_temp(&lbn.,&dsn.);
%dd(work,&dsn._OV,&dsn._OV);
where name eq "&varname."; 
%global &varname.tp; call symputx ("&varname.tp",Type);
run;
%mend Get_VarType;

%macro Get_VarLen(lbn,dsn,varname);
%ov0_temp(&lbn.,&dsn.);
%dd(work,&dsn._OV,&dsn._OV);
where name eq "&varname."; 
%global &varname._len; call symputx ("&varname._len",Length);
run;
%mend Get_VarLen;

%macro Get_VarFMT(lbn,dsn,varname);
%ov0_temp(&lbn.,&dsn.);
%dd(work,&dsn._OV,&dsn._OV);
where name eq "&varname."; 
%global &varname._FMT; call symputx ("&varname._FMT",Format);
run;
%mend Get_VarFMT;

%macro Get_VarLabel(lbn,dsn,varname);
%ov0_temp(&lbn.,&dsn.);
%dd(work,&dsn._OV,&dsn._OV);
where name eq "&varname."; 
%global &varname._lbl; call symputx ("&varname._lbl",Label);
run;
%mend Get_VarLabel;

%macro Get_DSProtect(lbn,dsn,possiblePW);
%global &dsn._prtct; 
proc contents data=&lbn..&dsn.(read=&possiblePW.) out=&dsn._ov; run;
%dd(work,&dsn._OV,&dsn._OV);
if _n_=1; 
call symputx ("TheProtectStatus",Protect);
call symputx ("TheEncryptStatus",Encrypt);
run;
%if "&TheProtectStatus." eq "RWA" and "&TheEncryptStatus." eq "YES" %then %do; %let &dsn._prtct=1; %end; 
%else %do; %let &dsn._prtct=0; %end;
%mend Get_DSProtect;


%macro Get_FmtExist(fmt,type);
   proc sql noprint;
   create table test
   as select libname, fmtname, source, fmttype
   from dictionary.formats
   where fmtname="%upcase(&fmt)" and
         fmttype="%upcase(&type)";
   quit;

   %get_n_of_obs1(work,test);
   %global TheFmtExist;
   %let TheFmtExist=&n_of_obs.;
/*   %let dsid=%sysfunc(open(work.test));*/
/*   %let n=%sysfunc(attrn(&dsid,nobs));*/
/*   %let rc=%sysfunc(close(&dsid));*/

   %if %upcase(&type)=I %then %let msg_type=Informat;
   %if %upcase(&type)=F %then %let msg_type=Format;

   %if &TheFmtExist.=0 %then
     %put &msg_type %upcase(&fmt) does not exist;

   %if &TheFmtExist. gt 0 %then %do;
     data _null_;
       set test;
       if source="C" then
         put "&msg_type" +1 fmtname +1
             'is user-defined and exists in the'
              +1 libname +1 'library';
       if source="B" then
         put "&msg_type" +1 fmtname
       'is a SAS-supplied' +1 "&msg_type";
     run;
   %end;
%mend Get_FmtExist;
/*%Get_FmtExist($B737M800FMT,f)*/

%macro CreerNouveauDossier(NewFolderName,ThePathString);
data _null_; 
newdirname=dcreate("&NewFolderName.", "&ThePathString.");
/*put newdirname=;*/ 
run;
%mend CreerNouveauDossier;

%macro CreerNouveauDossier01(TheNewFolderName);
%CreerNouveauDossier(&TheNewFolderName.,\\Ncras73\sasuser\CONGC\SSRA_DataCentre\Output\JaviGraphs);
%mend CreerNouveauDossier01;



%macro PermuDeuxCats(LBN,DSN);
%ov0_temp(&LBN.,&DSN.);
%dd(work,&dsn._ov,&dsn._ovchar); if type=2; run;
%GenerateMacroVarSeriesfromDS2(work,&dsn._ovchar,Name,MaChatte);
/*MaChatte1, MaChatte2, MaChatte_Combien*/
%GenerateMacroVarSeriesfromDS2(work,&dsn._ovchar,label,MonEtiquette);
/*MonEtiquette1, MonEtiquette2, MonEtiquette_Combien*/
%do i=1 %to &MaChatte_Combien.;
%do j=1 %to &MaChatte_Combien.;
%global GrphHrzntlVar&i._&j.	GrphHrzntlLbl&i._&j.
		GrphVrtclVar&i._&j. 	GrphVrtclLbl&i._&j.  ;
%let GrphHrzntlVar&i._&j.=&&MaChatte&i..;
%let GrphHrzntlLbl&i._&j.=&&MonEtiquette&i..;
%let GrphVrtclVar&i._&j.=&&MaChatte&j..;
%let GrphVrtclLbl&i._&j.=&&MonEtiquette&j..;
%end;%end;
%mend PermuDeuxCats;
/*%PermuDeuxCats(jcc,ABGR12N);*/
/*Output is global macros as */
/*MaChatte_Combien*/
/*GrphHrzntlVar&i._&j.	GrphHrzntlLbl&i._&j.*/
/*GrphVrtclVar&i._&j. 	GrphVrtclLbl&i._&j.  */

%macro PermuDeuxCats2(LBN,DSN,ScopeForFreqStat);
%ov0_temp(&LBN.,&DSN.);
%dd(work,&dsn._ov,&dsn._ovchar); if type=2; run;
%faireordre(work,&dsn._ovchar,VARNUM);
%GenerateMacroVarSeriesfromDS2(work,&dsn._ovchar,Name,Var2Study);
%do i=1 %to &Var2Study_Combien.;
%dd2(jcc,&DSN.,work,&&Var2Study&i..); keep &&Var2Study&i.. ; if &ScopeForFreqStat.; run;
%faireordre(work,&&Var2Study&i.. nodupkey,&&Var2Study&i..);
%get_n_of_obs1(work,&&Var2Study&i..);
%global &&Var2Study&i.._LvlNbr;
%let &&Var2Study&i.._LvlNbr=&n_of_obs.;
%end;
%GenerateMacroVarSeriesfromDS2(work,&dsn._ovchar,Name,MaChatte);
/*MaChatte1, MaChatte2, MaChatte_Combien*/
%GenerateMacroVarSeriesfromDS2(work,&dsn._ovchar,label,MonEtiquette);
/*MonEtiquette1, MonEtiquette2, MonEtiquette_Combien*/
%do i=1 %to &MaChatte_Combien.;
%do j=1 %to &MaChatte_Combien.;
%global GrphHrzntlVar&i._&j.	GrphHrzntlLbl&i._&j.
		GrphVrtclVar&i._&j. 	GrphVrtclLbl&i._&j.  ;
%let GrphHrzntlVar&i._&j.=&&MaChatte&i..;
%let GrphHrzntlLbl&i._&j.=&&MonEtiquette&i..;
%let GrphVrtclVar&i._&j.=&&MaChatte&j..;
%let GrphVrtclLbl&i._&j.=&&MonEtiquette&j..;
%end;%end;
%mend PermuDeuxCats2;

/*parfait!*/

/*parfait!*/



%macro BatchLabelling(LBN,InDSN,OutDSN,VarColInLabelTab,LabelColInLabelTab,FolderAndLabelTable);
/*%impcsv(work,VarsNLabels,&FolderAndLabelTable.);*/
%impcsv_fr_wlatin1_to_utf8(work,VarsNLabels,&FolderAndLabelTable.);
%get_n_of_obs1(work,VarsNLabels);
%do Moi=1 %to &n_of_obs.;
%global BLVar&Moi. BLLabel&Moi.;
%end;
%global Labels_tot;
%dt(work,VarsNLabels);
call symputx('BLVar'||left(_n_),strip(&VarColInLabelTab.));
call symputx('BLLabel'||left(_n_),strip(&LabelColInLabelTab.));
call symputx('Labels_tot',_n_);
run;
%dd(&LBN.,&InDSN.,&OutDSN.);
%do BL_j=1 %to &Labels_tot.; label &&BLVar&BL_j.. ="&&BLLabel&BL_j.." ; %end;
run;
%mend BatchLabelling;

/*%ovc(&DS_CADORS.)*/
/*%FairelEssai(jcc,&DS_CADORS.,1000)*/
/*%BatchLabelling(work,test,testOut,LaVarr,LEquitette,&whereNow.\Output\CADORS Ranking\CADORS_Labels.csv);*/




%macro AirplaneOwner(PersonName);
%dd2(jcc,&DS_CCARCS.,work,Airplane_&PersonName.); if find(Full_Name, "&PersonName."); run;
%mend AirplaneOwner;

%macro AirplaneOwners(targetLBN,targetDSN,NameListNoColons);
%dd2(jcc,&DS_CCARCS.,&targetLBN.,&targetDSN.); if Full_Name in (
&NameListNoColons.
); run;
%mend AirplaneOwners;




%macro ArnfManufacture(ManufactureName);
%dd2(jcc,AERONEF_DESIGNATOR190310,work,&ManufactureName.); if find(typmnfctr, "&ManufactureName."); run;
%faireordre(work,&ManufactureName. nodupkey,descending typmaxseat descending TypMtow)
%mend ArnfManufacture;



%macro ArnfMaxSeat(MaxSeat);
%dd2(jcc,AERONEF_DESIGNATOR190310,work,SeatsMoreThan_&MaxSeat.); if typmaxseat >= "&MaxSeat."; run;
%faireordre(work,SeatsMoreThan_&MaxSeat. nodupkey,descending typmaxseat descending TypMtow);
%mend ArnfMaxSeat;


%macro ArnfType(TheType);
%EnleverNonAlphanum(&TheType.,TheTypeTreated);
%dd2(jcc,AERONEF_DESIGNATOR190310,work,ArnfType_&TheTypeTreated.); if find(typtrdnm, "&TheType."); run;
%faireordre(work,ArnfType_&TheTypeTreated. nodupkey,typtrdnm descending typmaxseat descending TypMtow);
%mend ArnfType;


%macro ArnfTypeCode(TheTypeCode);
%EnleverNonAlphanum(&TheTypeCode.,TheTypeTreated);
%dd2(jcc,AERONEF_DESIGNATOR190310,work,ArnfType_&TheTypeTreated.); if find(typdsgntr, "&TheTypeCode."); run;
%faireordre(work,ArnfType_&TheTypeTreated. nodupkey,typdsgntr descending typmaxseat descending TypMtow);
%mend ArnfTypeCode;



%macro TenirPremiersDeuxMot(lbn,dsn,CharVar,NewCharVar);
%dt(&lbn.,&dsn.);
format &NewCharVar. $130.;
/*This is to copy the format and length simply from old carvar*/
if not missing(&CharVar.) then do;
if anyspace(&CharVar.)>0 then do;
	first_mot=substr(&CharVar.,1,anyspace(&CharVar.));
end; else do;
	first_mot=&CharVar.;
end;

if anyspace(&CharVar.)>0 and length(&CharVar.)>1 and anyspace(&CharVar.) < length(&CharVar.) then do; 
	Excld_1stmot=substr(&CharVar.,1+anyspace(&CharVar.),length(&CharVar.)-anyspace(&CharVar.));
	if anyspace(Excld_1stmot)>0 then do;
		second_mot=substr(Excld_1stmot,1,anyspace(Excld_1stmot));
	end; else do;
		second_mot=Excld_1stmot;
	end;
end; else do;
	second_mot='';
end;
&NewCharVar.=compbl(first_mot||' '||second_mot);
end; else if missing(&CharVar.) then do;
&NewCharVar.='unknown';
end;
drop first_mot Excld_1stmot second_mot ;
run;
%mend TenirPremiersDeuxMot;







%macro CurrentValueOfMVAR(MVAR);
data _null_;
%put "&&&MVAR..";
run;
%mend CurrentValueOfMVAR;



%macro RemplacerUnCaracterePartout(lib,ds,BonChar,MauvaisChar);
%td(&lib,&ds);
array vars{*} _char_;
	do i=1 to dim(vars);
		if not missing(vars{i}) then do; 
		vars{i}=translate(vars{i},"&BonChar.","&MauvaisChar.");
		end;	
	end;
	drop i;
run;
%mend RemplacerUnCaracterePartout;



%macro add_c_for_mark(LeLBN,LeDSN,mark_var,mark_var_new);
%dt(&LeLBN.,&LeDSN.);
format &mark_var_new. $5.;
if length(&mark_var.) eq 4 then &mark_var_new.=cat('c',&mark_var.); 
drop &mark_var.; 
/*rename mark_cmplt=&mark_var.;*/
run;
%mend add_c_for_mark;




%macro Append2DS_smart(lb,ds1,ds2,ds_target,Var_for_LengthControl);
%dd2(&lb.,&ds1.,work,ds1); if _n_=1; rename &var_for_LengthControl.=var1; run;
%Get_VarLen(work,ds1,var1);
/*-->&var1_len.*/
%dd2(&lb.,&ds2.,work,ds2); if _n_=1; rename &var_for_LengthControl.=var2; run;
%Get_VarLen(work,ds2,var2);
/*-->&var2_len.*/
%if &var1_len. ge &var2_len. %then %do;
%Append2DS(&lb.,&ds1.,&ds2.,&ds_target.);
%end; %else %do;
%Append2DS(&lb.,&ds2.,&ds1.,&ds_target.);
%end;
%mend Append2DS_smart;




%macro LierParNimporteQuelle2cles(lib,dbs_target,
dbs1,dbs1_domfeu,key1,key1_domfeu,cle1,cle1_domfeu,
dbs2,dbs2_domfeu,key2,key2_domfeu,cle2,cle2_domfeu);
%faireordre(&lib.,&dbs1.,&key1. &cle1.);
%faireordre(&lib.,&dbs2.,&key2. &cle2.);
%if &key1_domfeu.=1 and &key2_domfeu.=0 
and &cle1_domfeu.=1 and &cle2_domfeu.=0 
%then %do; 
	%RenommerUneVarDehors(&lib.,&dbs2.,work,dbs2_temp,&key2.,&key1.);
	%RenommerUneVar(work,dbs2_temp,&cle2.,&cle1.);

	data &lib..&dbs_target.;
	merge 
	&lib..&dbs1. (in=xz)
	dbs2_temp (in=yz);
	by &key1. &cle1.;
	%if &dbs1_domfeu.=1 and &dbs2_domfeu.=0 %then %do; if xz; %end;
	%if &dbs1_domfeu.=0 and &dbs2_domfeu.=1 %then %do; if yz; %end;
	%if &dbs1_domfeu.=1 and &dbs2_domfeu.=1 %then %do; if xz and yz; %end; 
	%if &dbs1_domfeu.=0 and &dbs2_domfeu.=0 %then %do; if xz or yz; %end; 
	;
	run;
%end;

%if &key1_domfeu.=1 and &key2_domfeu.=0 
and &cle1_domfeu.=0 and &cle2_domfeu.=1 
%then %do; 
	%RenommerUneVarDehors(&lib.,&dbs1.,work,dbs1_temp,&cle1.,&cle2.);
	%RenommerUneVarDehors(&lib.,&dbs2.,work,dbs2_temp,&key2.,&key1.);
	data &lib..&dbs_target.;
	merge 
	dbs1_temp (in=xz)
	dbs2_temp (in=yz);
	by &key1. &cle2.;
	%if &dbs1_domfeu.=1 and &dbs2_domfeu.=0 %then %do; if xz; %end;
	%if &dbs1_domfeu.=0 and &dbs2_domfeu.=1 %then %do; if yz; %end;
	%if &dbs1_domfeu.=1 and &dbs2_domfeu.=1 %then %do; if xz and yz; %end; 
	%if &dbs1_domfeu.=0 and &dbs2_domfeu.=0 %then %do; if xz or yz; %end; 
	;
	run;
%end;

%if &key1_domfeu.=0 and &key2_domfeu.=1 
and &cle1_domfeu.=1 and &cle2_domfeu.=0 
%then %do; 
	%RenommerUneVarDehors(&lib.,&dbs1.,work,dbs1_temp,&key1.,&key2.);
	%RenommerUneVarDehors(&lib.,&dbs2.,work,dbs2_temp,&cle2.,&cle1.);
	data &lib..&dbs_target.;
	merge 
	dbs1_temp (in=xz)
	dbs2_temp (in=yz);
	by &key2. &cle1.;
	%if &dbs1_domfeu.=1 and &dbs2_domfeu.=0 %then %do; if xz; %end;
	%if &dbs1_domfeu.=0 and &dbs2_domfeu.=1 %then %do; if yz; %end;
	%if &dbs1_domfeu.=1 and &dbs2_domfeu.=1 %then %do; if xz and yz; %end; 
	%if &dbs1_domfeu.=0 and &dbs2_domfeu.=0 %then %do; if xz or yz; %end; 
	;
	run;
%end;


%if &key1_domfeu.=0 and &key2_domfeu.=1 
and &cle1_domfeu.=0 and &cle2_domfeu.=1 
%then %do;
	%RenommerUneVarDehors(&lib.,&dbs1.,work,dbs1_temp,&key1.,&key2.);
	%RenommerUneVar(work,dbs1_temp,&cle1.,&cle2.);
	data &lib..&dbs_target.;
	merge 
	dbs1_temp (in=xz)
	&lib..&dbs2.(in=yz);
	by &key2. &cle2.;
	%if &dbs1_domfeu.=1 and &dbs2_domfeu.=0 %then %do; if xz; %end;
	%if &dbs1_domfeu.=0 and &dbs2_domfeu.=1 %then %do; if yz; %end;
	%if &dbs1_domfeu.=1 and &dbs2_domfeu.=1 %then %do; if xz and yz; %end; 
	%if &dbs1_domfeu.=0 and &dbs2_domfeu.=0 %then %do; if xz or yz; %end; 
	;
	run;
%end;
%mend LierParNimporteQuelle2cles;


%macro check_a_file_and_delete(folder_and_filename);
%if %sysfunc(fileexist(&folder_and_filename.)) ge 1 %then %do;
   %let rc=%sysfunc(filename(temp,&folder_and_filename.));
   %let rc=%sysfunc(fdelete(&temp.));
	%put The HTML File Existence is %sysfunc(fileexist(&folder_and_filename.)). The file &folder_and_filename. existed and has since been deleted;
%end; 
%else %put The file &folder_and_filename. does not exist;
%mend check_a_file_and_delete; 

/*%check_a_file_and_delete(C:\Users\CONGC\Jdata\SSRA_DataCentre\Output\TUCONGProducts\1999 - 2019 705 Sector- Year Series\1999 Events in 1999 - 2019 by TC Subdivision.html);*/
/*parfait!*/



%macro synthesize_date(LBN,DSN,YrNum,MtNum,DyNum,DateVarTarget);
%td(&LBN.,&DSN.);
format 
tmpdate 8.
tmpdate1 $8.
&DateVarTarget. YYMMDD10.;
tmpdate=&DyNum.+100*&MtNum.+10000*&YrNum;
tmpdate1=put(tmpdate,Z8.);
&DateVarTarget.=input(tmpdate1,YYMMDD8.);
drop tmpdate tmpdate1 &YrNum. &MtNum. &DyNum.;
run;
%mend synthesize_date;


%macro NewDataset_DescRow(LBN,RegisterDSN,RegisterBizName,ItsRowNature,
RegisterCutOffYear,RegisterCutOffMonth,RegisterCutOffDay);
%GenerateMVarSeriesFrTable1(DataBizName,CurrentDataSetName,&WhereNow.\Production\JAVI_ProdDataSetList.csv);
%dd2(&LBN.,Macrovarssource,work,Macrovarssource);run;
%dd(work,Macrovarssource,NewFinishedDSNDescRow); if _n_ eq 1; drop No; run;
%dt(work,NewFinishedDSNDescRow); 
/*format cutoffyear 8. cutoffmonth 8. cutoffday 8.;*/
currentdatasetname	="&RegisterDSN.";
databizname			="&RegisterBizName.";
recordlevel			="&ItsRowNature.";
cutoffyear			=&RegisterCutOffYear.;
cutoffmonth			=&RegisterCutOffMonth.;
cutoffday			=&RegisterCutOffDay.;
run;
%synthesize_date(work,NewFinishedDSNDescRow,cutoffyear,cutoffmonth,cutoffday,cutoff_date);
%append2ds(work,Macrovarssource,NewFinishedDSNDescRow,Macrovarssource);
%dt(work,Macrovarssource); if missing(No) then No=_n_; run;
%faireordre(jcc,Macrovarssource,no);
%lowcaseall(work,Macrovarssource);
%dd2(work,Macrovarssource,jcc,Macrovarssource);run;
%dd2(work,Macrovarssource,jcp,Macrovarssource);run;
%expcsv2(work,Macrovarssource,&whereNow.\Production,JAVI_ProdDataSetList);
%expcsv2(work,Macrovarssource,&whereNow.\Production,JAVI_ProdDataSetList&sysdate.);
%GenerateMVarSeriesFrTable1(DataBizName,CurrentDataSetName,&whereNow.\Production\JAVI_ProdDataSetList&sysdate..csv);
%faireordre(jcc,Macrovarssource,descending no);
%mend NewDataset_DescRow;


%macro NewDataset_DescRow2(LBN,RegisterDSN,RegisterBizName,ItsRowNature,
RegisterCutOffDate);
%GenerateMVarSeriesFrTable1(DataBizName,CurrentDataSetName,&WhereNow.\Production\JAVI_ProdDataSetList.csv);
%dd2(&LBN.,Macrovarssource,work,Macrovarssource);run;
%dd(work,Macrovarssource,NewFinishedDSNDescRow); if _n_ eq 1; drop No; run;
%dt(work,NewFinishedDSNDescRow); 
/*format cutoffyear 8. cutoffmonth 8. cutoffday 8.;*/
currentdatasetname	="&RegisterDSN.";
databizname			="&RegisterBizName.";
recordlevel			="&ItsRowNature.";
/*cutoff_date			="&RegisterCutOffDate.";*/
cutoff_date			=input("&RegisterCutOffDate.",YYMMDD8.);
run;
%append2ds(work,Macrovarssource,NewFinishedDSNDescRow,Macrovarssource);
%dt(work,Macrovarssource); if missing(No) then No=_n_; run;
%faireordre(jcc,Macrovarssource,no);
%lowcaseall(work,Macrovarssource);
%dd2(work,Macrovarssource,jcc,Macrovarssource);run;
%dd2(work,Macrovarssource,jcp,Macrovarssource);run;
%expcsv2(work,Macrovarssource,&whereNow.\Production,JAVI_ProdDataSetList);
%expcsv2(work,Macrovarssource,&whereNow.\Production,JAVI_ProdDataSetList&sysdate.);
%GenerateMVarSeriesFrTable1(DataBizName,CurrentDataSetName,&whereNow.\Production\JAVI_ProdDataSetList&sysdate..csv);
%faireordre(jcc,Macrovarssource,descending no);
%mend NewDataset_DescRow2;


%macro UPLOAD2PROD(TheNewDSN);
%dd2(JCC,&TheNewDSN.,jcp,&TheNewDSN.);  run;
%mend UPLOAD2PROD;


%Macro GenererTousNiveauxDuneVar(DSLBN,DSTheRaw,TheRawScope,LeNomDeVar);
/*%global LeNomDeVar;*/
/*%let LeNomDeVar=&LeNomDeVar.;*/
data work.&LeNomDeVar.; set &DSLBN..&DSTheRaw.; keep &LeNomDeVar.;
%if "&TheRawScope." ne "none" %then %do; if &TheRawScope.; %end; run;
%RankingByFreqOf1CAT03(work,&LeNomDeVar.,frq,&LeNomDeVar.);
%dt(work,&TheFreqOutDS.); if not missing(&LeNomDeVar.); run;

%get_n_of_obs1(work,&TheFreqOutDS.);
/*%if &n_of_obs. le &NombreDesNiveauxMax. and &n_of_obs. ge 1 %then %do;*/
%if &n_of_obs. ge 1 %then %do;
%dt(work,&TheFreqOutDS.); ApostropheFeu=find(&LeNomDeVar.,"'");run;
%dd(work,&TheFreqOutDS.,&TheFreqOutDS._1); 
if ApostropheFeu=0; 
/*and freq>=&FreqSeuil.; */
run;
%dd(work,&TheFreqOutDS.,&TheFreqOutDS._2); 
if ApostropheFeu>0;
/*or freq<&FreqSeuil.; */
run;
/*%GenerateMacroVarSeriesfromDS2(work,&TheFreqOutDS._1,&LeNomDeVar.,TheLevel);*/
/*/*TheLevel, TheLevel2, TheLevel_Combien*/*/
/*%do GTNDV_i=1 %to &TheLevel_Combien.;*/
/*	%global &LeNomDeVar._LVL&GTNDV_i. ; */
/*	%let &LeNomDeVar._LVL&GTNDV_i.=&&TheLevel&GTNDV_i..;*/
/*%end;*/
/*%global &LeNomDeVar._LVL_N ; */
/*%let &LeNomDeVar._LVL_N=&TheLevel_Combien.;*/
/*/*Now we get the series of mvars for niveau of &NomDeVar.:*/*/
/*/*&&&NomDeVar._LVL&i.., &NomDeVar._LVL_N*/*/
;
%GenerateMacroVarSeriesfromDS3(work,&TheFreqOutDS._1,&LeNomDeVar.,&LeNomDeVar._LVL);
/*Now we get the series of mvars for niveau of &NomDeVar.:*/
/*&&&NomDeVar._LVL&i.., &NomDeVar._LVL_N*/

%end;
%mend GenererTousNiveauxDuneVar;
/*%GenererTousNiveauxDuneVar(work,&popu_DSN.,&popu_exp.,&TimeOrSpaceVar.);*/
/*%GenererTousNiveauxDuneVar(work,&popu_DSN.,&popu_exp.,geo);*/


/*2019-12-8 successful!*/
/*Output is &NomDeVar._LVL_N and*/
/*&NomDeVar._LVL1 &NomDeVar._LVL2 ... &NomDeVar._LVL&&&NomDeVar._LVL_N.*/
;
%Macro GenererTousNiveauxPourVarList(DS_LBN,DS_TheRaw,TheRawScope,VarListWithColons,VarListNature);
%if "&VarListWithColons." ne "none" %then %do;
/*%CaptureValuesFromList(&NameListWithColons.,WantedVarNm);*/
/*Output is global macro vars - WantedVarNm_1  WantedVarNm_2 ... and WantedVarNm_combien*/
%CaptureValuesFromList(&VarListWithColons.,&VarListNature.);
/*Output is global macro vars - &VarListNature._1  &VarListNature._2 ... and &VarListNature._combien*/
  %do GTNPVL_i=1 %to &&&VarListNature._combien.;
     %let GTNPVL_i_var=&VarListNature._&GTNPVL_i.;
/*     %GenererTousNiveauxDuneVar(&DS_LBN,&DS_TheRaw,&TheRawScope,&GTNPVL_i_var.);*/
     %GenererTousNiveauxDuneVar(&DS_LBN,&DS_TheRaw,&TheRawScope,&&&VarListNature._&GTNPVL_i..);
	 
  %end;
%end; %else %do;
  %put "&VarListWithColons. is not valid VarListWithColons input for Macro GenererTousNiveauxPourVarList"; 
%end;
%mend GenererTousNiveauxPourVarList;
;
/*GenererTousNiveauxPourVarList - Guide on how to invoke the j-th level of i-th var in the var list*/
/*%let FeautureVarListwithColon=geo:ref_date:offences:;*/
/*%GenererTousNiveauxPourVarList(jcc,Crime197701a199712,1 eq 1,&FeautureVarListWithColon.,Feature);*/
/*great!*/
/*2019-12-9 successful!*/
/*In order to get the j-th level of i-th var in the var list, you introduce a transit macro var as follow:*/
/*	%let transit_var=&&Feature_&i.._LVL&j.;*/
/*thereafter "&&&transit_var.." should be exactly the value of the j-th level of i-th var.*/

/*%let FeautureVarListwithColon=geo:ref_date:offences:;*/
/*%GenererTousNiveauxPourVarList(jcc,Crime197701a199712,1 eq 1,&FeautureVarListWithColon.,Feature);*/
/*%CurrentValueOfMVAR(wherenow);*/
/*%CurrentValueOfMVAR(Feature_1);*/
/*%CurrentValueOfMVAR(Feature_2);*/
/*%CurrentValueOfMVAR(Feature_3);*/
/*%CurrentValueOfMVAR(Feature_combien);*/
/**/
/*%CurrentValueOfMVAR(&Feature_1._LVL_N);*/
/*%CurrentValueOfMVAR(&Feature_1._LVL1);*/
/*%CurrentValueOfMVAR(&Feature_1._LVL40);*/
/*%CurrentValueOfMVAR(&Feature_1._LVL&&&Feature_1._LVL_N.);*/
/**/
/*%CurrentValueOfMVAR(&&Feature_&Feature_combien.._LVL1);   --> %CurrentValueOfMVAR(offences_LVL1)*/
/**/
/*%let i=1; %let j=4;*/
/*%CurrentValueOfMVAR(&&Feature_&i.._LVL&j.);  */
/*/*"manitoba"*/*/
/*	%CurrentValueOfMVAR(geo_LVL4)*/
/*	/*"manitoba"*/*/
/*	%let transit_var=&&Feature_&i.._LVL&j.;*/
/*	%CurrentValueOfMVAR(transit_var)*/
/*	/*"geo_LVL4"*/*/
/*	%CurrentValueOfMVAR(&transit_var.)*/
/*	/*"manitoba"*/*/
/*	%let result1=&&&transit_var..;*/
/*/*Conclusion: once set up the transit macro var, you have to have three ampersand to decode because the first order to translate*/*/
/*/*transit var back to its pointer, the second && is to decode that real pointer!*/*/
/*	%CurrentValueOfMVAR(result1)*/
/*	/*"manitoba"*/*/
/*	%let result2=&&&Feature_&i.._LVL&j..;*/
/*	%CurrentValueOfMVAR(result2)*/
/*/*    no correct result2*/*/
/*/*conclusion: we have to use transit macrovar to facilitate the processing of multi-order macro var decoding*/*/
/**/



;
%macro CartesianProduct(TargetLBN,TargetDSN,DSN01,DSN02);
proc sql;
create table &TargetLBN..arcrft_age_date_master as
select &DSN01..*, &DSN02..*
from &DSN01., &DSN02.;
quit;
%mend CartesianProduct;















