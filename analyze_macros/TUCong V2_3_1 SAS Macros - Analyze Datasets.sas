%macro voila(lb,ds,oudecsv,cat1,fm1,ana1,stat1);
ods csvall file="&oudecsv..csv";
proc tabulate data=&lb..&ds.;
class &cat1.;
var &ana1.;
table (&cat1. all),&stat1.*&ana1.;
format &cat1. &fm1..;
run;
ods csvall close;
%mend voila;

%macro voila111(lb,ds,oudecsv,cat1,fm1,ana1,stat1);
ods csvall file="&oudecsv..csv";
proc tabulate data=&lb..&ds.;
class &cat1.;
var &ana1.;
table (&cat1. all),&stat1.*&ana1.;
format &cat1. &fm1..;
run;
ods csvall close;
%mend voila111;

%macro voila112(lb,ds,oudecsv,cat1,fm1,ana1,stat1,stat2);
ods csvall file="&oudecsv..csv";
proc tabulate data=&lb..&ds.;
class &cat1.;
var &ana1.;
table (&cat1. all),(&stat1. &stat2.)*&ana1.;
format &cat1. &fm1..;
run;
ods csvall close;
%mend voila112;

%macro voila121(lb,ds,oudecsv,cat1,fm1,ana1,ana2,stat1);
ods csvall file="&oudecsv..csv";
proc tabulate data=&lb..&ds.;
class &cat1.;
var &ana1. &ana2.;
table (&cat1. all),&stat1.*(&ana1. &ana2.);
format &cat1. &fm1..;
run;
ods csvall close;
%mend voila121;

%macro voila122(lb,ds,oudecsv,cat1,fm1,ana1,ana2,stat1,stat2);
ods csvall file="&oudecsv..csv";
proc tabulate data=&lb..&ds.;
class &cat1.;
var &ana1. &ana2.;
table (&cat1. all),(&stat1. &stat2.)*(&ana1. &ana2.);
format &cat1. &fm1..;
run;
ods csvall close;
%mend voila122;

%macro voila1n1(lb,ds,oudecsv,cat1,fm1,ana_list,stat1);
ods csvall file="&oudecsv..csv";
proc tabulate data=&lb..&ds.;
class &cat1. ;
var &ana_list.;
table &cat1.,&stat1.*(&ana_list.);
format &cat1. &fm1..;
run;
ods csvall close;
%mend voila1n1;

%macro voila1n1_2ds(lb,ds,tabu_ds,cat1,fm1,ana_list,stat1);
/*shut down the listing output first please*/
proc tabulate data=&lb..&ds. out=&r..&tabu_ds.;
class &cat1. ;
var &ana_list.;
table &cat1.,&stat1.*(&ana_list.);
format &cat1. &fm1..;
run;
%DropVars(&r.,&tabu_ds.,_type_ _page_ _table_);
%mend voila1n1_2ds;

%macro voila2n1_2ds(lb,ds,tabu_ds,cat1,fm1,cat2,fm2,ana_list,stat1);
/*shut down the listing output first please*/
proc tabulate data=&lb..&ds. out=&r..&tabu_ds.;
class &cat1. &cat2. ;
var &ana_list.;
table &cat1.*&cat2.,&stat1.*(&ana_list.);
format &cat1. &fm1.. &cat2. &fm2..;
run;
%DropVars(&r.,&tabu_ds.,_type_ _page_ _table_);
%mend voila2n1_2ds;


%macro voila11n(lb,ds,oudecsv,cat1,fm1,ana1,stat_list);
ods csvall file="&oudecsv..csv";
proc tabulate data=&lb..&ds.;
class &cat1. ;
var &ana1.;
table &cat1.,(&stat_list.)*&ana1;
format &cat1. &fm1..;
run;
ods csvall close;
%mend voila11n;

%macro voila11n_2ds(lb,ds,tabu_ds,cat1,fm1,ana1,stat_list);
/*shut down the listing output first please*/
proc tabulate data=&lb..&ds. out=&r..&tabu_ds.;
class &cat1. ;
var &ana1.;
table &cat1.,(&stat_list.)*&ana1;
format &cat1. &fm1..;
run;
%DropVars(&r.,&tabu_ds.,_type_ _page_ _table_);
%mend voila11n_2ds;


%macro voila1nn(lb,ds,oudecsv,cat1,fm1,ana_list,stat_list);
ods csvall file="&oudecsv..csv";
proc tabulate data=&lb..&ds.;
class &cat1. ;
var &ana_list.;
table &cat1.,(&stat_list.)*(&ana_list.);
format &cat1. &fm1..;
run;
ods csvall close;
%mend voila1nn;

%macro voila1nn_2ds(lb,ds,tabu_ds,cat1,fm1,ana_list,stat_list);
/*shut down the listing output first please*/
proc tabulate data=&lb..&ds. out=&r..&tabu_ds.;
class &cat1. ;
var &ana_list.;
table &cat1.,(&stat_list.)*(&ana_list.);
format &cat1. &fm1..;
run;
%DropVars(&r.,&tabu_ds.,_type_ _page_ _table_);
%mend voila1nn_2ds;

%macro voila211(lb,ds,oudecsv,cat1,fm1,cat2,fm2,ana1,stat1);
ods csvall file="&oudecsv..csv";
proc tabulate data=&lb..&ds.;
class &cat1. &cat2.;
var &ana1.;
table (&cat1. all),(&cat2. all)*&stat1.*&ana1.;
format &cat1. &fm1.. &cat2. &fm2..;;
run;
ods csvall close;
%mend voila211;

%macro voila211_missing(lb,ds,oudecsv,cat1,fm1,cat2,fm2,ana1,stat1);
ods csvall file="&oudecsv..csv";
proc tabulate data=&lb..&ds. missing;
class &cat1. &cat2.;
var &ana1.;
table (&cat1. all),(&cat2. all)*&stat1.*&ana1.;
format &cat1. &fm1.. &cat2. &fm2..;;
run;
ods csvall close;
%mend voila211_missing;

%macro voila213(lb,ds,oudecsv,cat1,fm1,cat2,fm2,ana1,stat1,stat2,stat3);
ods csvall file="&oudecsv..csv";
proc tabulate data=&lb..&ds.;
class &cat1. &cat2.;
var &ana1.;
table (&cat1. all),(&cat2. all)*(&stat1. &stat2. &stat3.)*&ana1.;
format &cat1. &fm1.. &cat2. &fm2..;
run;
ods csvall close;
%mend voila213;

%macro voila214(lb,ds,oudecsv,cat1,fm1,cat2,fm2,ana1,stat1,stat2,stat3,stat4);
ods csvall file="&oudecsv..csv";
proc tabulate data=&lb..&ds.;
class &cat1. &cat2.;
var &ana1.;
table (&cat1. all),(&cat2. all)*(&stat1. &stat2. &stat3. &stat4.)*&ana1.;
format &cat1. &fm1.. &cat2. &fm2..;
run;
ods csvall close;
%mend voila214;

%macro voila212(lb,ds,oudecsv,cat1,fm1,cat2,fm2,ana1,stat1,stat2);
ods csvall file="&oudecsv..csv";
proc tabulate data=&lb..&ds.;
class &cat1. &cat2.;
var &ana1.;
table (&cat1. all),(&cat2. all)*(&stat1. &stat2.)*&ana1.;
format &cat1. &fm1.. &cat2. &fm2..;
run;
ods csvall close;
%mend voila212;



%macro voila221(lb,ds,oudecsv,cat1,fm1,cat2,fm2,ana1,ana2,stat1);
ods csvall file="&oudecsv..csv";
proc tabulate data=&lb..&ds.;
class &cat1. &cat2.;
var &ana1. &ana2.;
table (&cat1. all),(&cat2. all)*&stat1.*(&ana1. &ana2.);
format &cat1. &fm1.. &cat2. &fm2..;
run;
ods csvall close;
%mend voila221;

%macro voila231(lb,ds,oudecsv,cat1,fm1,cat2,fm2,ana1,ana2,ana3,stat1);
ods csvall file="&oudecsv..csv";
proc tabulate data=&lb..&ds.;
class &cat1. &cat2.;
var &ana1. &ana2. &ana3.;
table (&cat1. all),(&cat2. all)*&stat1.*(&ana1. &ana2. &ana3.);
format &cat1. &fm1.. &cat2. &fm2..;
run;
ods csvall close;
%mend voila231;


%macro voila241(lb,ds,oudecsv,cat1,fm1,cat2,fm2,ana1,ana2,ana3,ana4,stat1);
ods csvall file="&oudecsv..csv";
proc tabulate data=&lb..&ds.;
class &cat1. &cat2.;
var &ana1. &ana2. &ana3. &ana4.;
table (&cat1. all),(&cat2. all)*&stat1.*(&ana1. &ana2. &ana3. &ana4.);
format &cat1. &fm1.. &cat2. &fm2..;
run;
ods csvall close;
%mend voila241;

%macro voila251(lb,ds,oudecsv,cat1,fm1,cat2,fm2,ana1,ana2,ana3,ana4,ana5,stat1);
ods csvall file="&oudecsv..csv";
proc tabulate data=&lb..&ds.;
class &cat1. &cat2.;
var &ana1. &ana2. &ana3. &ana4. &ana5.;
table (&cat1. all),(&cat2. all)*&stat1.*(&ana1. &ana2. &ana3. &ana4. &ana5.);
format &cat1. &fm1.. &cat2. &fm2..;
run;
ods csvall close;
%mend voila251;

%macro voila222(lb,ds,oudecsv,cat1,fm1,cat2,fm2,ana1,ana2,stat1,stat2);
ods csvall file="&oudecsv..csv";
proc tabulate data=&lb..&ds.;
class &cat1. &cat2.;
var &ana1. &ana2.;
table (&cat1. all),(&cat2. all)*(&stat1. &stat2.)*(&ana1. &ana2.);
format &cat1. &fm1.. &cat2. &fm2..;
run;
ods csvall close;
%mend voila222;


%macro voila311(lb,ds,oudecsv,cat1,fm1,cat2,fm2,cat3,fm3,ana1,stat1);
ods csvall file="&oudecsv..csv";
proc tabulate data=&lb..&ds.;
class &cat1. &cat2. &cat3.;
var &ana1.;
table (&cat1. all)*(&cat2. all),(&cat3. all)*&stat1.*&ana1.;
format &cat1. &fm1.. &cat2. &fm2.. &cat3. &fm3..;
run;
ods csvall close;
%mend voila311;

%macro voila311_missing(lb,ds,oudecsv,cat1,fm1,cat2,fm2,cat3,fm3,ana1,stat1);
ods csvall file="&oudecsv..csv";
proc tabulate data=&lb..&ds. missing;
class &cat1. &cat2. &cat3.;
var &ana1.;
table (&cat1. all)*(&cat2. all),(&cat3. all)*&stat1.*&ana1.;
format &cat1. &fm1.. &cat2. &fm2.. &cat3. &fm3..;
run;
ods csvall close;
%mend voila311_missing;

%macro voila311_02(lb,ds,oudecsv,cat1,fm1,cat2,fm2,cat3,fm3,ana1,stat1);
ods csvall file="&oudecsv..csv";
proc tabulate data=&lb..&ds.;
class &cat1. &cat2. &cat3.;
var &ana1.;
table (&cat1. all),(&cat2. all)*(&cat3. all)*&stat1.*&ana1.;
format &cat1. &fm1.. &cat2. &fm2.. &cat3. &fm3..;
run;
ods csvall close;
%mend voila311_02;

%macro voila311_02_missing(lb,ds,oudecsv,cat1,fm1,cat2,fm2,cat3,fm3,ana1,stat1);
ods csvall file="&oudecsv..csv";
proc tabulate data=&lb..&ds. missing;
class &cat1. &cat2. &cat3.;
var &ana1.;
table (&cat1. all),(&cat2. all)*(&cat3. all)*&stat1.*&ana1.;
format &cat1. &fm1.. &cat2. &fm2.. &cat3. &fm3..;
run;
ods csvall close;
%mend voila311_02_missing;


%macro voila311_countout(lb,ds,outdsnm,cat1,fm1,cat2,fm2,cat3,fm3);
proc tabulate data=&lb..&ds. out=&lb..&outdsnm.;
class &cat1. &cat2. &cat3.;
/*var &ana1.;*/
table (&cat1. all)*(&cat2. all)*(&cat3. all),n;
format &cat1. &fm1.. &cat2. &fm2.. &cat3. &fm3..;
run;
%mend voila311_countout;;

/*proc tabulate data=&r..t1135_f out=&r..CNTRYFreq_by_yr_astyp;*/
/*class calyear FGN_ASET_DTL_TCD FGN_ASET_RSD_CNTRY_CD;*/
/*/*table (calyear all)*(FGN_ASET_DTL_TCD all)*(FGN_ASET_RSD_CNTRY_CD all), n;*/*/
/*table calyear*FGN_ASET_DTL_TCD*FGN_ASET_RSD_CNTRY_CD, n;*/
/*run;*/
;

%macro voila411(lb,ds,oudecsv1,cat1,fm1,cat2,fm2,cat3,fm3,cat4,fm4,ana1,stat1);
ods csvall file = "&oudecsv1..csv" ;
proc tabulate data=&lb..&ds. ;
class &cat1. &cat2. &cat3. &cat4. ;
var &ana1.;
table (&cat1. all)*(&cat2. all),(&cat3. all)*(&cat4. all)*&stat1.*&ana1. ;
format &cat1. &fm1.. &cat2. &fm2.. &cat3. &fm3.. &cat4. &fm4.. ;
run;
ods csvall close ;
%mend voila411;


%macro voila411_01(lb,ds,oudecsv1,cat1,fm1,cat2,fm2,cat3,fm3,cat4,fm4,ana1,stat1);
ods csvall file = "&oudecsv1..csv" ;
proc tabulate data=&lb..&ds. ;
class &cat1. &cat2. &cat3. &cat4. ;
var &ana1.;
table (&cat1. all)*(&cat2. all)*(&cat3. all),(&cat4. all)*&stat1.*&ana1. ;
format &cat1. &fm1.. &cat2. &fm2.. &cat3. &fm3.. &cat4. &fm4.. ;
run;
ods csvall close ;
%mend voila411_01;


%macro voila411_02(lb,ds,oudecsv1,cat1,fm1,cat2,fm2,cat3,fm3,cat4,fm4,ana1,stat1);
ods csvall file = "&oudecsv1..csv" ;
proc tabulate data=&lb..&ds. ;
class &cat1. &cat2. &cat3. &cat4. ;
var &ana1.;
table (&cat1. all),(&cat2. all)*(&cat3. all)*(&cat4. all)*&stat1.*&ana1. ;
format &cat1. &fm1.. &cat2. &fm2.. &cat3. &fm3.. &cat4. &fm4.. ;
run;
ods csvall close ;
%mend voila411_02;


%macro voila511(lb,ds,oudecsv1,cat1,fm1,cat2,fm2,cat3,fm3,cat4,fm4,cat5,fm5,ana1,stat1);
ods csvall file = "&oudecsv1..csv" ;
proc tabulate data=&lb..&ds. ;
class &cat1. &cat2. &cat3. &cat4. &cat5.;
var &ana1.;
table (&cat1. all)*(&cat2. all)*(&cat3. all),(&cat4. all)*(&cat5. all)*&stat1.*&ana1. ;
format &cat1. &fm1.. &cat2. &fm2.. &cat3. &fm3.. &cat4. &fm4.. &cat5. &fm5..;
run;
ods csvall close ;
%mend voila511;

%macro voila611(lb,ds,oudecsv1,cat1,fm1,cat2,fm2,cat3,fm3,cat4,fm4,cat5,fm5,cat6,fm6,ana1,stat1);
ods csvall file = "&oudecsv1..csv" ;
proc tabulate data=&lb..&ds. ;
class &cat1. &cat2. &cat3. &cat4. &cat5. &cat6.;
var &ana1.;
table (&cat1. all)*(&cat2. all)*(&cat3. all)*(&cat4. all),(&cat5. all)*(&cat6. all)*&stat1.*&ana1. ;
format &cat1. &fm1.. &cat2. &fm2.. &cat3. &fm3.. &cat4. &fm4.. &cat5. &fm5.. &cat6. &fm6..;
run;
ods csvall close ;
%mend voila611;
/*ods excel  file="&oudexlsx..xlsx";*/

%macro voila312(lb,ds,oudecsv,cat1,fm1,cat2,fm2,cat3,fm3,ana1,stat1,stat2);
ods csvall file="&oudecsv..csv";
proc tabulate data=&lb..&ds.;
class &cat1. &cat2. &cat3.;
var &ana1.;
table (&cat1. all)*(&cat2. all),(&cat3. all)*(&stat1. &stat2.)*&ana1.;
format &cat1. &fm1.. &cat2. &fm2.. &cat3. &fm3..;
run;
ods csvall close;
%mend voila312;

%macro voila321(lb,ds,oudecsv,cat1,fm1,cat2,fm2,cat3,fm3,ana1,ana2,stat1);
ods csvall file="&oudecsv..csv";
proc tabulate data=&lb..&ds.;
class &cat1. &cat2. &cat3.;
var &ana1. &ana2.;
table (&cat1. all)*(&cat2. all),(&cat3. all)*&stat1.*(&ana1. &ana2.);
format &cat1. &fm1.. &cat2. &fm2.. &cat3. &fm3..;
run;
ods csvall close;
%mend voila321;

%macro voila322(lb,ds,oudecsv,cat1,fm1,cat2,fm2,cat3,fm3,ana1,ana2,stat1,stat2);
ods csvall file="&oudecsv..csv";
proc tabulate data=&lb..&ds.;
class &cat1. &cat2. &cat3.;
var &ana1. &ana2.;
table (&cat1. all)*(&cat2. all),(&cat3. all)*(&stat1. &stat2.)*(&ana1. &ana2.);
format &cat1. &fm1.. &cat2. &fm2.. &cat3. &fm3..;
run;
ods csvall close;
%mend voila322;


%macro voila2tabu(lb,ds,oudecsv,classlist,varlist,tab1_row,tab1_col,tab2_row,tab2_col,frmt_sttmt);
ods csvall file="&oudecsv..csv";
proc tabulate data=&lb..&ds.;
class &classlist.;
var &varlist.;
table &tab1_row., &tab1_col.;
table &tab2_row., &tab2_col.;
format &frmt_sttmt.;
run;
ods csvall close;
%mend voila2tabu;

%macro getit2dim(lb,ds,oudecsv,cat1,fm1,cat2,fm2,ana1,ana2,stat1,stat2);
ods csvall file="&oudecsv..csv";
proc tabulate data=&lb..&ds.;
class &cat1. &cat2.;
var &ana1. &ana2.;
table (&cat1. all),(&cat2. all)*(&stat1. &stat2.)*(&ana1. &ana2.);
format &cat1. &fm1.. &cat2. &fm2..;
run;
ods csvall close;
%mend getit2dim;

%macro voila2dim(lb,ds,oudecsv,cat1,fm1,cat2,fm2,ana1,ana2,stat1,stat2);
ods csvall file="&oudecsv..csv";
proc tabulate data=&lb..&ds.;
class &cat1. &cat2.;
var &ana1. &ana2.;
table (&cat1. all),(&cat2. all)*(&stat1. &stat2.)*(&ana1. &ana2.);
format &cat1. &fm1.. &cat2. &fm2..;
run;
ods csvall close;
%mend voila2dim;


%macro freq(lb,ds,varlist);
proc freq data=&lb..&ds.; table &varlist.; run;
%mend freq;


%macro freqout(lb,ds,varlist);
proc freq data=&lb..&ds. ; 
table &varlist. / out=&lb..&ds._&varlist._frq outexpect sparse;
run;
%mend freqout;


%macro ChrVarFrq(lib,dsn,charvar);
%faireordredehors(&lib.,&dsn. nodupkey,temp1,&charvar.);
%ov3(&lib.,temp1)
%td(&lib.,temp1_ov);if _n_=1 and nobs le 300 then do;
%freqout(&lib.,&dsn.,&charvar.);
end; run;
%mend ChrVarFrq;


%macro freq2csv(lb,ds,varlist,oudecsv);   
ods csvall file="&oudecsv..csv";
proc freq data=&lb..&ds.; table &varlist.; run;
ods csvall close;
%mend freq2csv;


%macro freqcross(lb,ds,var1,var2);
proc freq data=&lb..&ds.; table &var1.*&var2. ; run;
%mend freqcross;

%macro means(lb,ds,statlist,varlist);
proc means data=&lb..&ds. &statlist.; var &varlist.; run;
%mend means;

%macro MeansOut(lb,ds,AnaVar,statlist,OutDS);
proc means data=&lb..&ds. &statlist. ; 
var &AnaVar.;  
output out=&lb..&OutDS.; run;
%mend MeansOut;

%macro MeansOut02(lb,ds,AnaVar,statlist,OutDS);
proc means data=&lb..&ds. &statlist. noprint; 
var &AnaVar.;  
output out=&lb..&OutDS.; run;
%mend MeansOut02;

%macro MeansOutByGroup(lb,ds,AnaVar,statlist, ClassVar,OutDS);
%faireordre(&lb.,&ds.,&ClassVar.);
proc means data=&lb..&ds. &statlist. ; 
var &AnaVar.; by &ClassVar.; 
output out=&lb..&OutDS.; run;
%mend MeansOutByGroup;

%macro means2csv(lb,ds,varlist);
proc means data=&lb..&ds. n nmiss min median mean max; 
var &varlist.; 
output out=&lb..means_&ds.;
run;
%expcsv(&lb.,means_&ds.,&f0.);
%mend means2csv;


%macro means2csv02(lb,ds,varlist);
proc means data=&lb..&ds. n nmiss min p1 median mean p99 max; 
var &varlist.; 
output out=&lb..means_&ds.;
run;
%expcsv(&lb.,means_&ds.,&f0.);
%mend means2csv02;


%macro means2csv02_ebci(lb,ds,varlist);
proc means data=&lb..&ds. n nmiss min p1 median mean p99 max QMETHOD=P2; 
var &varlist.; 
output out=&lb..means_&ds.;
run;
%expcsv2(&lb.,means_&ds.,&f0.);
%mend means2csv02_ebci;




%macro meanstous0(lb,ds);
proc means data=&lb..&ds. n nmiss min median mean max; var _numeric_; run;
%mend meanstous0;

%macro meanstous01(lb,ds,oudecsv);
ods csvall file="&oudecsv..csv";
proc means data=&lb..&ds. n nmiss min median mean max; 
var _numeric_; run;
ods csvall close;
%mend meanstous01;

%macro meanstous02(lb,ds);
proc means data=&lb..&ds. n nmiss min median mean max; 
var _numeric_; 
output out=tousmeans_&lb..&ds.;
run;
%mend meanstous02;

%macro meanstous2csv(lb,ds);
proc means data=&lb..&ds. n nmiss min median mean max; 
var _numeric_; 
output out=&lb..tousmeans_&ds.;
run;
%expcsv(&lb.,tousmeans_&ds.,&f0.);
%mend meanstous2csv;

%macro meanstous2csv_ebci(lb,ds);
proc means data=&lb..&ds. n nmiss min median mean max; 
var _numeric_; 
output out=&lb..tousmeans_&ds.;
run;
%expcsv2(&lb.,tousmeans_&ds.,&f0.);
%mend meanstous2csv_ebci;

%macro meanstous2csv_ebci2(lb,ds);
proc means data=&lb..&ds. n nmiss min p1 median mean p99 max QMETHOD=P2; 
var _numeric_; 
output out=&lb..tousmeans_&ds.;
run;
%expcsv2(&lb.,tousmeans_&ds.,&f0.);
%mend meanstous2csv_ebci2;

%macro meanstous2csv_ebci3(lb,ds);
proc means data=&lb..&ds. n nmiss min p1 median mean p95 p96 p97 p98 p99 max; 
var _numeric_; 
output out=&lb..tousmeans_&ds.;
run;
%expcsv2(&lb.,tousmeans_&ds.,&f0.);
%mend meanstous2csv_ebci3;



/*WARNING: Based on simulation studies, using the P2 technique to estimate quantiles smaller than */
/*the lower quartile or larger than the upper quartile will not always produce accurate results. */
/*Increasing the number of sample markers via the QMARKERS option  may increase accuracy but will*/
/*require more time and memory. Quantile estimation beyond the quartiles is not recommended for */
/*highly skewed and/or heavy-tailed distributions.*/


%macro meanstous(lb,ds,statlist);
proc means data=&lb..&ds. &statlist.; var _numeric_; run;
%mend meanstous;

%Macro means2pdf(lb,ds,statlist,varlist,OutFolder);
ODS pdf file="&OutFolder.\Key_statistics_of_&varlist._in_&DS..pdf" ;
Title "The Key Statistics of Variable(s)- &varlist. in &LB..&DS." ;
proc means data=&lb..&ds. &statlist.; var &varlist.; run;
Title;
ODS pdf close;
%Mend means2pdf;

%Macro means2pdf2(lb,ds,statlist,varlist,OutFolder);
ODS pdf file="&OutFolder.Key_statistics_of_Variables_in_&DS..pdf" ;
Title "The Key Statistics of Variable(s)in &LB..&DS." ;
proc means data=&lb..&ds. &statlist.; var &varlist.; run;
Title;
ODS pdf close;
%Mend means2pdf2;

%macro percentiles(lb,ds,varlist);
proc means data=&lb..&ds. n max median mean min range std p99 p95 p75 p50 p25 p5 p1; var &varlist.; run;
%mend percentiles;

%Macro percentiles2pdf(lb,ds,varlist,OutFolder);
ODS pdf file="&OutFolder.\Percentiles_of_&varlist._in_&DS..pdf" ;
Title "The Key Statistics and Percentiles of Variable &varlist. in &lb..&DS." ;
proc means data=&lb..&ds. n max median mean min range std p99 p95 p75 p50 p25 p5 p1;
	var &varlist.;
run;
Title;
ODS pdf close;
%Mend percentiles2pdf;

%macro percentilesout(lb,ds,varlist);
proc means data=&lb..&ds. n max median mean min range std p99 p95 p75 p50 p25 p5 p1; var &varlist.;  output out=&lb..&ds._means; run;
%mend percentilesout;

%Macro percentiles2pdf_ebci(lb,ds,varlist,OutFolder);
ODS pdf file="&OutFolder./Percentiles_of_&varlist._in_&DS..pdf" ;
Title "The Key Statistics and Percentiles of Variable &VAR. in &LIB..&DS." ;
proc means data=&lb..&ds. n max median mean min range std p99 p95 p75 p50 p25 p5 p1;
	var &varlist.;
run;
Title;
ODS pdf close;
%Mend percentiles2pdf_ebci;

%Macro univariate(lb,ds,var1);
Proc univariate Data=&lb..&ds.;
	 var &var1.;
Run;
%Mend univariate;


%Macro univariateOut(lb,ds,var1);
proc univariate data=&lb..&ds. noprint;
   var &var1.;
   output out=&lb..&var1._stats 
n=n nmiss=nmiss nobs=nobs max=max min=min range=range mean=mean std=std p1=p1 p5=p5 p10 p25=p25 p50=p50 p75=p75 p90=p90 p95=p95 p99=p99;
run;
%td(&lb.,&var1._stats);
DataSet="&ds.";
varname="&var1.";run;
%reordervars(&lb.,&var1._stats,DataSet varname	n	nmiss	nobs	mean	std	range	max	p99	p95	p90	p75	p50	p25	p5	p1	min);
%expxls(&lb.,&var1._stats,&f.);
%Mend univariateOut;

%Macro univariateOut01(lb,ds,var);
proc univariate data=&lb..&ds. noprint;
   var &var.;
   output out=univ_temp 
n=n nmiss=nmiss nobs=nobs max=max min=min range=range mean=mean std=std p1=p1 p5=p5 p10 p25=p25 p50=p50 p75=p75 p90=p90 p95=p95 p99=p99;
run;
%td(work,univ_temp);
DataSet="&ds.";
varname="&var.";run;
%reordervars(work,univ_temp,DataSet varname	n	nmiss	nobs	mean	std	range	max	p99	p95	p90	p75	p50	p25	p5	p1	min);
%Mend univariateOut01;

%macro voila1signaler(lb,ds,var);
%dd2(&lb.,&ds.,work,signaler_temp);
if not missing(&var.) then &var.1=&var.; else do;
&var.=0;
&var.1=.; 
/*assign 0 to missings so as to let count in proc tabulate to count the zeros */
/*of &var with effective value under the missing class of &var.1, in other words,*/
/*count wont count any missing values of var under any class. The missing option in */
/*proc tabulate only indicate to treat the missing of class var as a group of missings*/
end;
keep &var.1 &var.;format &var.1 SignFMT.;run;
proc tabulate data=signaler_temp out=voila1temp missing;
class &var.1;
var &var.;
table (&var.1 all),(n sum)*&var.;
format &var.1 SignFMT.; 
run;
%td(work,voila1temp); 
drop _type_ _page_ _table_; 
rename &var.1=sign
	   &var._N=count_of_&var.
	   &var._sum=sum_of_&var.;
run; 
%expcsv(work,voila1temp,C:\Users\cxc366\temporary\temporaries);
%impcsv(work,voila1temp,C:\Users\cxc366\temporary\temporaries\voila1temp.csv);
%td(work,voila1temp); 
if sign='Missing' and _n_ ne 1 then sign='total';run;
%mend voila1signaler;


%macro freqout(lb,ds,varlist);
proc freq data=&lb..&ds. ; 
table &varlist. / out=&lb..&ds._&varlist._frq 
/*outexpect */
sparse;
run;
%td(&lb.,&ds._&varlist._frq);
rename 
count=count_of_&varlist.
percent=prcnt_of_&varlist.;
run; 
%faireordre(&lb.,&ds._&varlist._frq, descending count_of_&varlist.);
%td(&lb.,&ds._&varlist._frq);
Nombre=_n_;run;
%reordervars(&lb.,&ds._&varlist._frq,Nombre &varlist. count_of_&varlist. prcnt_of_&varlist.);
%expxls(&lb.,&ds._&varlist._frq,&ds._&varlist._frq,&f.);
%mend freqout;

%macro freqout0(lb,ds,varlist);
proc freq data=&lb..&ds. ; 
table &varlist. / out=&lb..&ds._&varlist._frq 
/*outexpect */
sparse;
run;
%td(&lb.,&ds._&varlist._frq);
rename 
count=count_of_&varlist.
percent=prcnt_of_&varlist.;
run; 
%faireordre(&lb.,&ds._&varlist._frq, descending count_of_&varlist.);
%td(&lb.,&ds._&varlist._frq);
Nombre=_n_;run;
%reordervars(&lb.,&ds._&varlist._frq,Nombre &varlist. count_of_&varlist. prcnt_of_&varlist.);
%expcsv(&lb.,&ds._&varlist._frq,&f.);
%mend freqout0;


%macro freqout1(lb,ds,varlist);
proc freq data=&lb..&ds. ; 
table &varlist. / out=&lb..&ds._&varlist._frq 
/*outexpect */
sparse;
run;
%td(&lb.,&ds._&varlist._frq);
rename 
count=count_of_&varlist.
percent=prcnt_of_&varlist.;
run; 
%faireordre(&lb.,&ds._&varlist._frq, descending count_of_&varlist.);
%td(&lb.,&ds._&varlist._frq);
Nombre=_n_;run;
%reordervars(&lb.,&ds._&varlist._frq,Nombre &varlist. count_of_&varlist. prcnt_of_&varlist.);
%mend freqout1;

%macro freqout2(lb,ds,varlist);
proc freq data=&lb..&ds. ; 
table &varlist. / out=frq_temp  
/*outexpect */
sparse;
run;
%td(work,frq_temp);
rename 
count=count_of_&varlist.
percent=prcnt_of_&varlist.;
run; 
%faireordre(work,frq_temp, descending count_of_&varlist.);
%td(work,frq_temp);
Nombre=_n_;
run;
%reordervars(work,frq_temp,Nombre &varlist. count_of_&varlist. prcnt_of_&varlist.);

%ov3(work,frq_temp);
%td(work,frq_temp_ov);
if name="&varlist." then 
call symput('fmt_'||"&varlist.",format);run;

%mend freqout2;

/*%freqout(cs,Dolbeau,cmaca_cd)*/

%macro ChrVarFrq(lib,dsn,charvar);
%faireordredehors(&lib.,&dsn. nodupkey,temp1,&charvar.);
%ov3(&lib.,temp1);
%td(&lib.,temp1_ov);
if _n_=1 then do;
call symput('num_of_values',nobs);
end;run;
%If &num_of_values. le 300 %then %do;
%freqout(&lib.,&dsn.,&charvar.);
%end; 
%mend ChrVarFrq;

%macro ChrVarFrq1(lib,dsn,charvar);
%faireordredehors3(&lib.,&dsn. nodupkey,temp1,&charvar.);
%ov3(work,temp1);
%td(work,temp1_ov);
if _n_=1 then do;
call symput('num_of_values',nobs);
end;run;
%If &num_of_values. le 300 %then %do;
%freqout1(&lib.,&dsn.,&charvar.);
%end; 
%mend ChrVarFrq1;

%macro ChrVarFrq2(lib,dsn,charvar);
%faireordredehors3(&lib.,&dsn. nodupkey,temp1,&charvar.);
%ov3(work,temp1);
%td(work,temp1_ov);
if _n_=1 then do;
call symput('num_of_values',nobs);
end;run;
%If &num_of_values. le 300 %then %do;
%freqout2(&lib.,&dsn.,&charvar.);
%end; 
%mend ChrVarFrq2;


%macro ChrVarLngth(lib,dsn,var);
%dd2(&lib.,&dsn.,work,&dsn._temp);
length_of_&var. = length(&var.); 
keep length_of_&var.; run;
%freqout2(work,&dsn._temp,length_of_&var.);
%mend ChrVarLngth;

/*%ChrVarLngth(cs,dolbeau,MajorSource)*/


%macro CharVarsScan(lib,dsn);
%ov3(&lib.,&dsn.);

%td(work,&dsn._ov);
/*format count_of_charvar 8.;*/
If type=2 then do;
if count_of_charvar=. then count_of_charvar=0;
count_of_charvar=count_of_charvar+1;
retain count_of_charvar;
end;

run;

%td(work,&dsn._ov);
If type=2 then do;
call symput('varrr'||left(count_of_charvar),name);
call symput("num_of_charvar",count_of_charvar);
end;
run;

%do z=1 %to &num_of_charvar. ;
/*%put &&varrr&z..;*/
%ChrVarLngth(&lib.,&dsn.,&&varrr&z..);

%if "&z."="1" %then %do;
%MakeCopy02(work,frq_temp,work,&dsn._cscanl);
%end;
%if "&z." gt "1" %then %do;
%LinkByAnyKeyAcross(work,&dsn._cscanl,&dsn._cscanl,0,Nombre,0,work,frq_temp,0,Nombre,1);
%end;

%end;
/*%expxls(work,&dsn._cscanl,&f.);*/


%do z=1 %to &num_of_charvar. ;
/*%put &&varrr&z..;*/
%ChrVarFrq2(&lib.,&dsn.,&&varrr&z..);

%if "&z."="1" %then %do;
%MakeCopy02(work,frq_temp,work,&dsn._cscanf);
%end;
%if "&z." gt "1" %then %do;
%LinkByAnyKeyAcross(work,&dsn._cscanf,&dsn._cscanf,0,Nombre,0,work,frq_temp,0,Nombre,1);
%end;

%end;
%expcsv(work,&dsn._cscanf,&temp.);
%impcsv(work,&dsn._cscanf,&temp.\&dsn._cscanf.csv);

/*%expxls(work,&dsn._cscanf,&f.);*/


PROC EXPORT DATA=work.&dsn._cscanf outfile= "&f.\&dsn._cscn.xlsx " dbms=xlsx replace;
sheet="fscn"; run;
PROC EXPORT DATA=work.&dsn._cscanl outfile= "&f.\&dsn._cscn.xlsx " dbms=xlsx replace;
sheet="lscn"; run;

%mend CharVarsScan;



%macro ScanVars(lib,ds);
%NumVarsScan(&lib.,&ds.);
%CharVarsScan(&lib.,&ds.);
%mend ScanVars;


%Macro univariate2pdf(LIB,DS,VAR,OutFolder);
ODS pdf file="&OutFolder.\Univariate_Statistics_of_&VAR._in_&DS..pdf" ;
Title "The Univariate Statistics of Variable &VAR. in &LIB..&DS." ;
Proc Univariate Data=&LIB..&DS.;
	VAR &VAR. ;
Run;
Title;
ODS pdf close;
%Mend univariate2pdf;

%Macro univariate2pdf_ebci(LIB,DS,VAR,OutFolder);
ODS pdf file="&OutFolder./Univariate_Statistics_of_&VAR._in_&DS..pdf" ;
Title "The Univariate Statistics of Variable &VAR. in &LIB..&DS." ;
Proc Univariate Data=&LIB..&DS.;
	VAR &VAR. ;
Run;
Title;
ODS pdf close;
%Mend univariate2pdf_ebci;

%Macro ListOutliers(lb,ds,var1,id_var_list,num_of_extrobs);
Proc Univariate Data=&lb..&ds. NEXTROBS=&num_of_extrobs.;
	ID &id_var_list.;
	var &var1.;
Run;
%Mend ListOutliers;

%Macro Outliers(LIB,DS,Num,IDs,VAR,OutFolder);
ODS pdf file="&OutFolder.\Top_and_bottom_&Num._Obs_of_&VAR._in_&DS..pdf" ;
Title "The Extreme Observations of Variable &VAR. in &LIB..&DS." ;
ODS Select ExtremeObs;
Proc Univariate Data=&LIB..&DS. NEXTROBS=&Num.;
	ID &IDs. ;
	VAR &VAR. ;
Run;
Title;
ODS pdf close;
%Mend Outliers;


%Macro OutliersOut(LIB,DS,Num,IDs,VAR,DS_extrobs);
ODS Select ExtremeObs;
Proc Univariate Data=&LIB..&DS. NEXTROBS=&Num.;
	ID &IDs. ;
	VAR &VAR. ;
	output out=&LIB..&DS_extrobs.;
Run;
%Mend OutliersOut;


%macro rankavar(lib,ds,groups,var);
proc rank data=&lib..&ds. out=&lib..&ds._ranked groups=&groups.;
	var &var.;
	ranks &var._rnk;
run;
%mend rankavar;

%macro rav(lib,ds,groups,var);
proc rank data=&lib..&ds. out=&lib..&ds._ranked groups=&groups.;
	var &var.;
	ranks &var._rnk;
run;
%mend rav;

%macro rankavar01(lib,ds,order,groups,var);
proc rank data=&lib..&ds. &order. out=&lib..&ds._ranked groups=&groups.;
	var &var.;
	ranks &var._rank;
run;
%mend rankavar01;


%macro PercentileAVar(lib,ds,var);
proc rank data=&lib..&ds. out=&lib..&ds._prcntl groups=100;
	var &var.;
	ranks &var._prcntl;
run;
%mend PercentileAVar;

%macro PAV(lib,ds,var);
proc rank data=&lib..&ds. out=&lib..&ds._prcntl groups=100;
	var &var.;
	ranks &var._prcntl;
run;
%mend PAV;

%macro DecileAVar(lib,ds,var);
proc rank data=&lib..&ds. out=&lib..&ds._dcl groups=10;
	var &var.;
	ranks &var._dcl;
run;
%mend DecileAVar;

%macro RankWithinClass00(lib,ds,key1,key2,groups);
/*proc sort data=&lib..&ds.; by &key1. &key2.; run;*/
proc rank data=&lib..&ds. out=&lib..&ds._ranked groups=&groups.;
	by &key1.;
	var &key2.;
	ranks &key2._rank_under_&key1.;
	run;
%mend RankWithinClass00;


%macro TritileWithinClass00(lib,ds,key1,key2);
/*proc sort data=&lib..&ds.; by &key1. &key2.; run;*/
proc rank data=&lib..&ds. out=&lib..&ds._tritile groups=3;
	by &key1.;
	var &key2.;
	ranks &key2._rank_under_&key1.;
		run;
%mend TritileWithinClass00;

%macro QuartileWithinClass00(lib,ds,key1,key2);
/*proc sort data=&lib..&ds.; by &key1. &key2.; run;*/
proc rank data=&lib..&ds. out=&lib..&ds._Quartile groups=4;
	by &key1.;
	var &key2.;
	ranks &key2._rank_under_&key1.;
		run;
%mend QuartileWithinClass00;

%macro PercentileWithinClass00(lib,ds,key1,key2);
/*proc sort data=&lib..&ds.; by &key1. &key2.; run;*/
proc rank data=&lib..&ds. out=&lib..&ds._prcntl groups=100;
	by &key1.;
	var &key2.;
	ranks &key2._rank_under_&key1.;
		run;
%mend PercentileWithinClass00;

%macro DecileWithinClass00(lib,ds,key1,key2);
proc sort data=&lib..&ds.; by &key1. &key2.; run;
proc rank data=&lib..&ds. out=&lib..&ds._ranked groups=10;
	by &key1.;
	var &key2.;
	ranks &key2._rank_under_&key2.;
		run;
%mend DecileWithinClass00;

%macro RankWithinGroups01(lib,ds,order1,key1,order2,key2);
proc sort data=&lib..&ds.; by &order1. &key1. &order2. &key2.; run;
proc rank data=&lib..&ds. out=&lib..&ds._rnk descending; 
by &key1.; var &key2.; 
ranks &key2._rank_under_&key1.; run;
%mend RankWithinGroups01;

%macro RankWithinGroups(lib,ds,key1,key2);
proc sort data=&lib..&ds.; by &key1. &key2.; run;
proc rank data=&lib..&ds. out=&lib..&ds._rnk; by &key1.; var &key2.; ranks &key2._rank_under_&key1.; run;
%mend RankWithinGroups;





%macro PearsonCorr(lb,ds,varlist);
proc corr data = &lb..&ds.;
var &varlist.; run;
%mend PearsonCorr;



%macro PanelRegressing(lb,ds,cs,ts,dependent,explanatory_vars,row_scope);
proc sort data=&lb..&ds.; 
   by &cs. &ts.; 
run; 

%let LEN=%sysfunc(length(&explanatory_vars.));
%let LenTaken=%sysfunc(min(%eval(&LEN.),88));
%let regressors=%sysfunc(substrn(&explanatory_vars.,1,&LenTaken.));

%if "&row_scope."="null" %then %let row_scope_exp=&cs. ne ''; %else
%let row_scope_exp=&row_scope.;
footnote j=l " Data Source: StatCan etc." 
         j=r "&sysday. &sysdate. &systime.  "; 

title1 "1.1 Two Way Fixed Effect (PrintFixed) - Panel Regress &dependent. to &regressors. ...";
proc panel data=&lb..&ds.(where=(&row_scope_exp.)) printfixed;
id &cs. &ts.;
model &dependent.=&explanatory_vars. /fixtwo;
run;
title1;

title1 "1.2 Two Way Fixed Effect (Plots=all)- Panel Regress &dependent. to &regressors. ...";
proc panel data=&lb..&ds.(where=(&row_scope_exp.));
id &cs. &ts.;
model &dependent.=&explanatory_vars. /fixtwo plots = all;
run;
title1;


title1 "1.3 Two Way Fixed Effect (Plots=residsurface) - Panel Regress &dependent. to &regressors. ...";
proc panel data=&lb..&ds.(where=(&row_scope_exp.)) ;
id &cs. &ts.;
model &dependent.=&explanatory_vars. /fixtwo plots(unpack only) = residsurface;
run;
title1;

title1 "2.1 One Way Crosssection Fixed Effect (PrintFixed) - Panel Regress &dependent. to &regressors. ...";
proc panel data=&lb..&ds.(where=(&row_scope_exp.)) printfixed;
id &cs. &ts.;
model &dependent.=&explanatory_vars. /fixone;
run;
title1;

title1 "2.2 One Way Crosssection Fixed Effect (Plots=all)- Panel Regress &dependent. to &regressors. ...";
proc panel data=&lb..&ds.(where=(&row_scope_exp.));
id &cs. &ts.;
model &dependent.=&explanatory_vars. /fixone plots = all;
run;
title1;

title1 "2.3 One Way Crosssection Fixed Effect (Plots=residsurface) - Panel Regress &dependent. to &regressors. ...";
proc panel data=&lb..&ds.(where=(&row_scope_exp.)) ;
id &cs. &ts.;
model &dependent.=&explanatory_vars. /fixone plots(unpack only) = residsurface;
run;
title1;


title1 "3.1 One Way Time Fixed Effect (PrintFixed) - Panel Regress &dependent. to &regressors. ...";
proc panel data=&lb..&ds.(where=(&row_scope_exp.)) printfixed;
id &cs. &ts.;
model &dependent.=&explanatory_vars. /fixonetime;
run;
title1;

title1 "3.2 One Way Time Fixed Effect (Plots=all)- Panel Regress &dependent. to &regressors. ...";
proc panel data=&lb..&ds.(where=(&row_scope_exp.));
id &cs. &ts.;
model &dependent.=&explanatory_vars. /fixonetime plots = all;
run;
title1;

title1 "3.3 One Way Time Fixed Effect (Plots=residsurface) - Panel Regress &dependent. to &regressors. ...";
proc panel data=&lb..&ds.(where=(&row_scope_exp.)) ;
id &cs. &ts.;
model &dependent.=&explanatory_vars. /fixonetime plots(unpack only) = residsurface;
run;
title1;


title1 "4.1 Two Way Random Effect (Plots=all) - Panel Regress &dependent. to &regressors. ...";
proc panel data=&lb..&ds.(where=(&row_scope_exp.));
id &cs. &ts.;
model &dependent.=&explanatory_vars. /rantwo plots = all;
run;
title1;

title1 "4.2 One Way Random Effect (Plots=all) - Panel Regress &dependent. to &regressors. ...";
proc panel data=&lb..&ds.(where=(&row_scope_exp.));
id &cs. &ts.;
model &dependent.=&explanatory_vars. /ranone plots = all;
run;
title1;

title1 "5.1 Pooled Panel Regress &dependent. to &regressors. ...";
proc panel data=&lb..&ds.(where=(&row_scope_exp.));
id &cs. &ts.;
model &dependent.=&explanatory_vars. /pooled plots = all;
run;
title1;

footnote;
%mend PanelRegressing;



%macro PanelRegressing2WayFix(lb,ds,cs,ts,dependent,explanatory_vars,row_scope);
proc sort data=&lb..&ds.; 
   by &cs. &ts.; 
run; 

%let LEN=%sysfunc(length(&explanatory_vars.));
%let LenTaken=%sysfunc(min(%eval(&LEN.),88));
%let regressors=%sysfunc(substrn(&explanatory_vars.,1,&LenTaken.));

%if "&row_scope."="null" %then %let row_scope_exp=&cs. ne ''; %else
%let row_scope_exp=&row_scope.;
footnote j=l " Source:CANSIM" 
         j=r "by CC &sysday. &sysdate. &systime.  "; 

title1 "1.1 Two Way Fixed Effect (PrintFixed) - Panel Regress &dependent. to &regressors. ...";
proc panel data=&lb..&ds.(where=(&row_scope_exp.)) printfixed;
id &cs. &ts.;
model &dependent.=&explanatory_vars. /fixtwo;
run;
title1;

title1 "1.2 Two Way Fixed Effect (Plots=all)- Panel Regress &dependent. to &regressors. ...";
proc panel data=&lb..&ds.(where=(&row_scope_exp.));
id &cs. &ts.;
model &dependent.=&explanatory_vars. /fixtwo plots = all;
run;
title1;


title1 "1.3 Two Way Fixed Effect (Plots=residsurface) - Panel Regress &dependent. to &regressors. ...";
proc panel data=&lb..&ds.(where=(&row_scope_exp.)) ;
id &cs. &ts.;
model &dependent.=&explanatory_vars. /fixtwo plots(unpack only) = residsurface;
run;
title1;

footnote;
%mend PanelRegressing2WayFix;


%macro PanelReg_TwoFix_AllPlot(title1,model_label,lb,ds,cs,ts,dependent,explanatory_vars,row_scope);
proc sort data=&lb..&ds.; 
   by &cs. &ts.; 
run; 

%let LEN=%sysfunc(length(&explanatory_vars.));
%let LenTaken=%sysfunc(min(%eval(&LEN.),88));
%let regressors=%sysfunc(substrn(&explanatory_vars.,1,&LenTaken.));

%if "&row_scope."="null" %then %let row_scope_exp=&cs. ne ''; %else
%let row_scope_exp=&row_scope.;
options nodate;
data _null_;
call symput ('timenow',put (time(),time.));
call symput ('datenow',put (date(),date9.));
run;

footnote j=l " Data Source: StatCan etc." 
         j=r "&sysday. &datenow. &timenow.  "; 
/*         j=r "&sysday. &sysdate. &timetime.  "; */
/* Note: &sysdate. &systime. provide just the the date and time that the SAS session was started*/

title1 "&title1.";
title2 "Two Way Fixed Effect (Plots=all)- Panel Regress &dependent. to &regressors. ...";
proc panel data=&lb..&ds.(where=(&row_scope_exp.)) 
/*printfixed*/
OUTEST=&lb..&dependent._&model_label._EST;
id &cs. &ts.;
&model_label.: model &dependent.=&explanatory_vars. /fixtwo plots = all 
/*noint*/
/*P R CLI CLM*/
/* Note: /P R CLI CLM option is usually used in Model statement for other regression procedure*/
;
output out=&lb..&dependent._hat_&model_label. 
predicted=&dependent._hat_&model_label. residual=&dependent._rsd_&model_label.;
run;
title2;
title1;
footnote;

%dd(&lb.,&dependent._hat_&model_label.,&dependent._hat_&model_label.01);
keep &cs. &ts. &dependent._hat_&model_label.;run;
%lier(&lb.,&ds.,&dependent._hat_&model_label.01,0,&ds.,0,&cs. &ts.);
/*%supprimerbdd(&lb.,&dependent._hat_&model_label.01);*/
%mend PanelReg_TwoFix_AllPlot;



%macro DynamicPanelReg_GMM1(title1,model_label,lb,ds,cs,ts,
predetermined_varlist,exog_varlist,correlated_varlist,
dependent,explanatory_vars,row_scope);
proc sort data=&lb..&ds.; 
   by &cs. &ts.; 
run; 

%let LEN=%sysfunc(length(&explanatory_vars.));
%let LenTaken=%sysfunc(min(%eval(&LEN.),88));
%let regressors=%sysfunc(substrn(&explanatory_vars.,1,&LenTaken.));

%if "&row_scope."="null" %then %let row_scope_exp=&cs. ne ''; %else
%let row_scope_exp=&row_scope.;
options nodate;
data _null_;
call symput ('timenow',put (time(),time.));
call symput ('datenow',put (date(),date9.));
run;

footnote j=l " Data Source: StatCan etc." 
         j=r "&sysday. &datenow. &timenow.  "; 
/*         j=r "&sysday. &sysdate. &timetime.  "; */
/* Note: &sysdate. &systime. provide just the the date and time that the SAS session was started*/

title1 "&title1.";
title2 "Dynamic Panel Estimation with GMM (TwoFix) - Regress &dependent. to &regressors. ...";
proc panel data=&lb..&ds.(where=(&row_scope_exp.)) 
OUTEST=&lb..&dependent._&model_label._EST;
id &cs. &ts.;
instrument 	
			CONSTANT 
			PREDETERMINED=(&predetermined_varlist.)
			EXOGENOUS=(&exog_varlist.) 
			CORRELATED=(&correlated_varlist.)
			DEPVAR
;
/*CONSTANT includes an intercept (column of ones) as an uncorrelated exogenous instrument. */
/**/
/*PREDETERMINED (????????????????????????????)specifies a */
/*list of variables whose future realizations can be correlated with the disturbances but*/
/*whose present and past realizations are not conditional on the individual effects. */
/**/
/*EXOGENOUS (?????????????????,???????????)specifies a list */
/*of variables that are not correlated with the disturbances given the */
/*unobserved individual effects. */
/**/
/*CORRELATED (????????????????CrossSection Effect???,????*/
/*???????Level Equation??????????,???????Difference Equation*/
/*???????????;????????????????????????????*/
/*?????????????)specifies a list of variables correlated with the unobserved */
/*individual effects. These variables are correlated with the error terms in the level */
/*equations so they are not used in forming moment conditions from those equations.*/
/**/
/*DEPVAR ???? specifies instruments related to the dependent variable. With LEVEL, */
/*the lagged dependent variables are included as instruments for differenced equations. */
/*With DIFFERENCE, the differenced dependent variable is included as instruments for */
/*equations. With BOTH or nothing specified, both level and differenced dependent */
/*variables are included in the instrument matrix. */

&model_label.: model &dependent.=&explanatory_vars. /gmm1 nolevels maxband=1 ginv=g4 ARTest=5; 
/*P R CLI CLM*/
/* Note: /P R CLI CLM option is usually used in Model statement for other regression procedure*/
;
output out=&lb..&dependent._hat_&model_label. 
predicted=&dependent._hat_&model_label. residual=&dependent._rsd_&model_label.;

run;
title2;
title1;
footnote;
quit;

%dd(&lb.,&dependent._hat_&model_label.,&dependent._hat_&model_label.01);
keep &cs. &ts. &dependent._hat_&model_label.;run;
%lier(&lb.,&ds.,&dependent._hat_&model_label.01,0,&ds.,1,&cs. &ts.);
%supprimerbdd(&lb.,&dependent._hat_&model_label.01);
%mend DynamicPanelReg_GMM1;


%macro PlotPanelSeries(lb,ds,vvar,vvarlabel,vunit,hvar,hvarlabel,hvarformat,groupvar,title1,source);
goptions reset=all border;

options nodate;
data _null_;
call symput ('timenow',put (time(),time.));
call symput ('datenow',put (date(),date9.));
run;

title1 "&title1."; 															   
/*footnote j=r "Source: &source." ; */
footnote j=l " Source: &source." 
         j=r "&sysday. &datenow. &timenow.  ";
 
   /* define symbol characteristics */ 
/*symbol1 interpol=join width=2 value=dot*/
/*symbol1 interpol=join width=2  value=dot*/
/*symbol1 interpol=join width=1.5  value=circle*/
symbol interpol=spline width=2 value=none

;

/*symbol1 interpol=spline width=2 value=triangle c=steelblue;*/
/*symbol2 interpol=spline width=2 value=circle c=indigo;*/
/*symbol3 interpol=spline width=2 value=square c=orchid;*/

/* define axis characteristics */ 
axis1 
order=(1989 to 2015 by 2) 

/*order=(1995 to 2016 by 3) */
/*order=(0 to 130 by 10) */

      label=(j=r "&hvarlabel.") 
/*      major=(height=2) */
/*      minor=(number=4 height=1) */
/*      offset=(2,2) */
/*      width=3*/
; 
axis2 																
/*order=(0 to 100 by 10) */
      label=(j=c "&vvarlabel." j=c "&vunit.")
/*      major=(height=1.5)  offset=(0,0) */
/*      minor=(number=1 height=1)*/
; 			 
proc gplot data=&lb..&ds. 
/*GOUT=carbon.*/
; 
   	 plot &vvar.*&hvar.=&groupvar. / 
						haxis=axis1 
                     	vaxis=axis2 
/*	                 	vref=(20 40 60 80 100)*/

/*                     	vref=(20 40 60 80 100 120 140 160 180 200)*/
/*                     	vref=(5000000 10000000 15000000 20000000 25000000)*/
/*						vref=(-200000 0 200000 400000 600000)*/
						vref=(0)
; 
format &hvar. &hvarformat..;
run; 
title1;
footnote;
quit; 
%mend PlotPanelSeries;





%macro voici(lb,ds,oudexml,cat1,fm1,ana1,stat1);
ODS tagsets.excelxp file="&oudexml..xml" options(doc="help" ) ;
proc tabulate data=&lb..&ds.;
class &cat1.;
var &ana1.;
table (&cat1. all),&stat1.*&ana1.;
format &cat1. &fm1..;
run;
ods tagsets.excelxp close;
%mend voici;

%macro voici111(lb,ds,oudexml,cat1,fm1,ana1,stat1);
ODS tagsets.excelxp file="&oudexml..xml" options(doc="help" ) ;
proc tabulate data=&lb..&ds.;
class &cat1.;
var &ana1.;
table (&cat1. all),&stat1.*&ana1.;
format &cat1. &fm1..;
run;
ods tagsets.excelxp close;
%mend voici111;

%macro voici112(lb,ds,oudexml,cat1,fm1,ana1,stat1,stat2);
ODS tagsets.excelxp file="&oudexml..xml" options(doc="help" ) ;
proc tabulate data=&lb..&ds.;
class &cat1.;
var &ana1.;
table (&cat1. all),(&stat1. &stat2.)*&ana1.;
format &cat1. &fm1..;
run;
ods tagsets.excelxp close;
%mend voici112;

%macro voici121(lb,ds,oudexml,cat1,fm1,ana1,ana2,stat1);
ODS tagsets.excelxp file="&oudexml..xml" options(doc="help" ) ;
proc tabulate data=&lb..&ds.;
class &cat1.;
var &ana1. &ana2.;
table (&cat1. all),&stat1.*(&ana1. &ana2.);
format &cat1. &fm1..;
run;
ods tagsets.excelxp close;
%mend voici121;

%macro voici122(lb,ds,oudexml,cat1,fm1,ana1,ana2,stat1,stat2);
ODS tagsets.excelxp file="&oudexml..xml" options(doc="help" ) ;
proc tabulate data=&lb..&ds.;
class &cat1.;
var &ana1. &ana2.;
table (&cat1. all),(&stat1. &stat2.)*(&ana1. &ana2.);
format &cat1. &fm1..;
run;
ods tagsets.excelxp close;
%mend voici122;

%macro voici1n1(lb,ds,oudexml,cat1,fm1,ana_list,stat1);
ODS tagsets.excelxp file="&oudexml..xml" options(doc="help" ) ;
proc tabulate data=&lb..&ds.;
class &cat1. ;
var &ana_list.;
table &cat1.,&stat1.*(&ana_list.);
format &cat1. &fm1..;
run;
ods tagsets.excelxp close;
%mend voici1n1;

%macro voici1n1_2ds(lb,ds,tabu_ds,cat1,fm1,ana_list,stat1);
/*shut down the listing output first please*/
proc tabulate data=&lb..&ds. out=&r..&tabu_ds.;
class &cat1. ;
var &ana_list.;
table &cat1.,&stat1.*(&ana_list.);
format &cat1. &fm1..;
run;
%DropVars(&r.,&tabu_ds.,_type_ _page_ _table_);
%mend voici1n1_2ds;

%macro voici2n1_2ds(lb,ds,tabu_ds,cat1,fm1,cat2,fm2,ana_list,stat1);
/*shut down the listing output first please*/
proc tabulate data=&lb..&ds. out=&r..&tabu_ds.;
class &cat1. &cat2. ;
var &ana_list.;
table &cat1.*&cat2.,&stat1.*(&ana_list.);
format &cat1. &fm1.. &cat2. &fm2..;
run;
%DropVars(&r.,&tabu_ds.,_type_ _page_ _table_);
%mend voici2n1_2ds;


%macro voici11n(lb,ds,oudexml,cat1,fm1,ana1,stat_list);
ODS tagsets.excelxp file="&oudexml..xml" options(doc="help" ) ;
proc tabulate data=&lb..&ds.;
class &cat1. ;
var &ana1.;
table &cat1.,(&stat_list.)*&ana1;
format &cat1. &fm1..;
run;
ods tagsets.excelxp close;
%mend voici11n;

%macro voici11n_2ds(lb,ds,tabu_ds,cat1,fm1,ana1,stat_list);
/*shut down the listing output first please*/
proc tabulate data=&lb..&ds. out=&r..&tabu_ds.;
class &cat1. ;
var &ana1.;
table &cat1.,(&stat_list.)*&ana1;
format &cat1. &fm1..;
run;
%DropVars(&r.,&tabu_ds.,_type_ _page_ _table_);
%mend voici11n_2ds;


%macro voici1nn(lb,ds,oudexml,cat1,fm1,ana_list,stat_list);
ODS tagsets.excelxp file="&oudexml..xml" options(doc="help" ) ;
proc tabulate data=&lb..&ds.;
class &cat1. ;
var &ana_list.;
table &cat1.,(&stat_list.)*(&ana_list.);
format &cat1. &fm1..;
run;
ods tagsets.excelxp close;
%mend voici1nn;

%macro voici1nn_2ds(lb,ds,tabu_ds,cat1,fm1,ana_list,stat_list);
/*shut down the listing output first please*/
proc tabulate data=&lb..&ds. out=&r..&tabu_ds.;
class &cat1. ;
var &ana_list.;
table &cat1.,(&stat_list.)*(&ana_list.);
format &cat1. &fm1..;
run;
%DropVars(&r.,&tabu_ds.,_type_ _page_ _table_);
%mend voici1nn_2ds;

%macro voici211(lb,ds,oudexml,cat1,fm1,cat2,fm2,ana1,stat1);
ODS tagsets.excelxp file="&oudexml..xml" options(doc="help" ) ;
proc tabulate data=&lb..&ds.;
class &cat1. &cat2.;
var &ana1.;
table (&cat1. all),(&cat2. all)*&stat1.*&ana1.;
format &cat1. &fm1.. &cat2. &fm2..;;
run;
ods tagsets.excelxp close;
%mend voici211;

%macro voici211_missing(lb,ds,oudexml,cat1,fm1,cat2,fm2,ana1,stat1);
ODS tagsets.excelxp file="&oudexml..xml" options(doc="help" ) ;
proc tabulate data=&lb..&ds. missing;
class &cat1. &cat2.;
var &ana1.;
table (&cat1. all),(&cat2. all)*&stat1.*&ana1.;
format &cat1. &fm1.. &cat2. &fm2..;;
run;
ods tagsets.excelxp close;
%mend voici211_missing;

%macro voici213(lb,ds,oudexml,cat1,fm1,cat2,fm2,ana1,stat1,stat2,stat3);
ODS tagsets.excelxp file="&oudexml..xml" options(doc="help" ) ;
proc tabulate data=&lb..&ds.;
class &cat1. &cat2.;
var &ana1.;
table (&cat1. all),(&cat2. all)*(&stat1. &stat2. &stat3.)*&ana1.;
format &cat1. &fm1.. &cat2. &fm2..;
run;
ods tagsets.excelxp close;
%mend voici213;

%macro voici214(lb,ds,oudexml,cat1,fm1,cat2,fm2,ana1,stat1,stat2,stat3,stat4);
ODS tagsets.excelxp file="&oudexml..xml" options(doc="help" ) ;
proc tabulate data=&lb..&ds.;
class &cat1. &cat2.;
var &ana1.;
table (&cat1. all),(&cat2. all)*(&stat1. &stat2. &stat3. &stat4.)*&ana1.;
format &cat1. &fm1.. &cat2. &fm2..;
run;
ods tagsets.excelxp close;
%mend voici214;

%macro voici212(lb,ds,oudexml,cat1,fm1,cat2,fm2,ana1,stat1,stat2);
ODS tagsets.excelxp file="&oudexml..xml" options(doc="help" ) ;
proc tabulate data=&lb..&ds.;
class &cat1. &cat2.;
var &ana1.;
table (&cat1. all),(&cat2. all)*(&stat1. &stat2.)*&ana1.;
format &cat1. &fm1.. &cat2. &fm2..;
run;
ods tagsets.excelxp close;
%mend voici212;



%macro voici221(lb,ds,oudexml,cat1,fm1,cat2,fm2,ana1,ana2,stat1);
ODS tagsets.excelxp file="&oudexml..xml" options(doc="help" ) ;
proc tabulate data=&lb..&ds.;
class &cat1. &cat2.;
var &ana1. &ana2.;
table (&cat1. all),(&cat2. all)*&stat1.*(&ana1. &ana2.);
format &cat1. &fm1.. &cat2. &fm2..;
run;
ods tagsets.excelxp close;
%mend voici221;

%macro voici231(lb,ds,oudexml,cat1,fm1,cat2,fm2,ana1,ana2,ana3,stat1);
ODS tagsets.excelxp file="&oudexml..xml" options(doc="help" ) ;
proc tabulate data=&lb..&ds.;
class &cat1. &cat2.;
var &ana1. &ana2. &ana3.;
table (&cat1. all),(&cat2. all)*&stat1.*(&ana1. &ana2. &ana3.);
format &cat1. &fm1.. &cat2. &fm2..;
run;
ods tagsets.excelxp close;
%mend voici231;


%macro voici241(lb,ds,oudexml,cat1,fm1,cat2,fm2,ana1,ana2,ana3,ana4,stat1);
ODS tagsets.excelxp file="&oudexml..xml" options(doc="help" ) ;
proc tabulate data=&lb..&ds.;
class &cat1. &cat2.;
var &ana1. &ana2. &ana3. &ana4.;
table (&cat1. all),(&cat2. all)*&stat1.*(&ana1. &ana2. &ana3. &ana4.);
format &cat1. &fm1.. &cat2. &fm2..;
run;
ods tagsets.excelxp close;
%mend voici241;

%macro voici251(lb,ds,oudexml,cat1,fm1,cat2,fm2,ana1,ana2,ana3,ana4,ana5,stat1);
ODS tagsets.excelxp file="&oudexml..xml" options(doc="help" ) ;
proc tabulate data=&lb..&ds.;
class &cat1. &cat2.;
var &ana1. &ana2. &ana3. &ana4. &ana5.;
table (&cat1. all),(&cat2. all)*&stat1.*(&ana1. &ana2. &ana3. &ana4. &ana5.);
format &cat1. &fm1.. &cat2. &fm2..;
run;
ods tagsets.excelxp close;
%mend voici251;

%macro voici222(lb,ds,oudexml,cat1,fm1,cat2,fm2,ana1,ana2,stat1,stat2);
ODS tagsets.excelxp file="&oudexml..xml" options(doc="help" ) ;
proc tabulate data=&lb..&ds.;
class &cat1. &cat2.;
var &ana1. &ana2.;
table (&cat1. all),(&cat2. all)*(&stat1. &stat2.)*(&ana1. &ana2.);
format &cat1. &fm1.. &cat2. &fm2..;
run;
ods tagsets.excelxp close;
%mend voici222;


%macro voici311(lb,ds,oudexml,cat1,fm1,cat2,fm2,cat3,fm3,ana1,stat1);
ODS tagsets.excelxp file="&oudexml..xml" options(doc="help" ) ;
proc tabulate data=&lb..&ds.;
class &cat1. &cat2. &cat3.;
var &ana1.;
table (&cat1. all)*(&cat2. all),(&cat3. all)*&stat1.*&ana1.;
format &cat1. &fm1.. &cat2. &fm2.. &cat3. &fm3..;
run;
ods tagsets.excelxp close;
%mend voici311;

%macro voici311_2x1(lb,ds,oudexml,cat1,fm1,cat2,fm2,cat3,fm3,ana1,stat1);
ODS tagsets.excelxp file="&oudexml..xml" options(doc="help" ) ;
proc tabulate data=&lb..&ds.;
class &cat1. &cat2. &cat3.;
var &ana1.;
table (&cat1. all)*(&cat2. all),(&cat3. all)*&stat1.*&ana1.;
format &cat1. &fm1.. &cat2. &fm2.. &cat3. &fm3..;
run;
ods tagsets.excelxp close;
%mend voici311_2x1;

%macro voici311_missing(lb,ds,oudexml,cat1,fm1,cat2,fm2,cat3,fm3,ana1,stat1);
ODS tagsets.excelxp file="&oudexml..xml" options(doc="help" ) ;
proc tabulate data=&lb..&ds. missing;
class &cat1. &cat2. &cat3.;
var &ana1.;
table (&cat1. all)*(&cat2. all),(&cat3. all)*&stat1.*&ana1.;
format &cat1. &fm1.. &cat2. &fm2.. &cat3. &fm3..;
run;
ods tagsets.excelxp close;
%mend voici311_missing;

%macro voici311_02(lb,ds,oudexml,cat1,fm1,cat2,fm2,cat3,fm3,ana1,stat1);
ODS tagsets.excelxp file="&oudexml..xml" options(doc="help" ) ;
proc tabulate data=&lb..&ds.;
class &cat1. &cat2. &cat3.;
var &ana1.;
table (&cat1. all),(&cat2. all)*(&cat3. all)*&stat1.*&ana1.;
format &cat1. &fm1.. &cat2. &fm2.. &cat3. &fm3..;
run;
ods tagsets.excelxp close;
%mend voici311_02;

%macro voici311_countout(lb,ds,outdsnm,cat1,fm1,cat2,fm2,cat3,fm3);
proc tabulate data=&lb..&ds. out=&lb..&outdsnm.;
class &cat1. &cat2. &cat3.;
/*var &ana1.;*/
table (&cat1. all)*(&cat2. all)*(&cat3. all),n;
format &cat1. &fm1.. &cat2. &fm2.. &cat3. &fm3..;
run;
%mend voici311_countout;;

/*proc tabulate data=&r..t1135_f out=&r..CNTRYFreq_by_yr_astyp;*/
/*class calyear FGN_ASET_DTL_TCD FGN_ASET_RSD_CNTRY_CD;*/
/*/*table (calyear all)*(FGN_ASET_DTL_TCD all)*(FGN_ASET_RSD_CNTRY_CD all), n;*/*/
/*table calyear*FGN_ASET_DTL_TCD*FGN_ASET_RSD_CNTRY_CD, n;*/
/*run;*/
;

%macro voici411(lb,ds,oudexml,cat1,fm1,cat2,fm2,cat3,fm3,cat4,fm4,ana1,stat1);
ODS tagsets.excelxp file="&oudexml..xml" options(doc="help" ) ;
proc tabulate data=&lb..&ds. ;
class &cat1. &cat2. &cat3. &cat4. ;
var &ana1.;
table (&cat1. all)*(&cat2. all),(&cat3. all)*(&cat4. all)*&stat1.*&ana1. ;
format &cat1. &fm1.. &cat2. &fm2.. &cat3. &fm3.. &cat4. &fm4.. ;
run;
ods tagsets.excelxp close ;
%mend voici411;

%macro voici411_2x2(lb,ds,oudexml,cat1,fm1,cat2,fm2,cat3,fm3,cat4,fm4,ana1,stat1);
ODS tagsets.excelxp file="&oudexml..xml" options(doc="help" ) ;
proc tabulate data=&lb..&ds. ;
class &cat1. &cat2. &cat3. &cat4. ;
var &ana1.;
table (&cat1. all)*(&cat2. all),(&cat3. all)*(&cat4. all)*&stat1.*&ana1. ;
format &cat1. &fm1.. &cat2. &fm2.. &cat3. &fm3.. &cat4. &fm4.. ;
run;
ods tagsets.excelxp close ;
%mend voici411_2x2;

%macro voici411_3x1(lb,ds,oudexml,cat1,fm1,cat2,fm2,cat3,fm3,cat4,fm4,ana1,stat1);
ODS tagsets.excelxp file="&oudexml..xml" options(doc="help" ) ;
proc tabulate data=&lb..&ds. ;
class &cat1. &cat2. &cat3. &cat4. ;
var &ana1.;
table (&cat1. all)*(&cat2. all)*(&cat3. all),(&cat4. all)*&stat1.*&ana1. ;
format &cat1. &fm1.. &cat2. &fm2.. &cat3. &fm3.. &cat4. &fm4.. ;
run;
ods tagsets.excelxp close ;
%mend voici411_3x1;

%macro voici411_1x3(lb,ds,oudexml,cat1,fm1,cat2,fm2,cat3,fm3,cat4,fm4,ana1,stat1);
ODS tagsets.excelxp file="&oudexml..xml" options(doc="help" ) ;
proc tabulate data=&lb..&ds. ;
class &cat1. &cat2. &cat3. &cat4. ;
var &ana1.;
table (&cat1. all),(&cat2. all)*(&cat3. all)*(&cat4. all)*&stat1.*&ana1. ;
format &cat1. &fm1.. &cat2. &fm2.. &cat3. &fm3.. &cat4. &fm4.. ;
run;
ods tagsets.excelxp close ;
%mend voici411_1x3;

%macro voici511(lb,ds,oudexml,cat1,fm1,cat2,fm2,cat3,fm3,cat4,fm4,cat5,fm5,ana1,stat1);
ODS tagsets.excelxp file="&oudexml..xml" options(doc="help" ) ;
proc tabulate data=&lb..&ds. ;
class &cat1. &cat2. &cat3. &cat4. &cat5.;
var &ana1.;
table (&cat1. all)*(&cat2. all)*(&cat3. all)*(&cat4. all),(&cat5. all)*&stat1.*&ana1. ;
format &cat1. &fm1.. &cat2. &fm2.. &cat3. &fm3.. &cat4. &fm4.. &cat5. &fm5..;
run;
ods tagsets.excelxp close ;
%mend voici511;

%macro voici511_2x3(lb,ds,oudexml,cat1,fm1,cat2,fm2,cat3,fm3,cat4,fm4,cat5,fm5,ana1,stat1);
ODS tagsets.excelxp file="&oudexml..xml" options(doc="help" ) ;
proc tabulate data=&lb..&ds. ;
class &cat1. &cat2. &cat3. &cat4. &cat5.;
var &ana1.;
table (&cat1. all)*(&cat2. all),(&cat3. all)*(&cat4. all)*(&cat5. all)*&stat1.*&ana1. ;
format &cat1. &fm1.. &cat2. &fm2.. &cat3. &fm3.. &cat4. &fm4.. &cat5. &fm5..;
run;
ods tagsets.excelxp close ;
%mend voici511_2x3;

%macro voici511_3x2(lb,ds,oudexml,cat1,fm1,cat2,fm2,cat3,fm3,cat4,fm4,cat5,fm5,ana1,stat1);
ODS tagsets.excelxp file="&oudexml..xml" options(doc="help" ) ;
proc tabulate data=&lb..&ds. ;
class &cat1. &cat2. &cat3. &cat4. &cat5.;
var &ana1.;
table (&cat1. all)*(&cat2. all)*(&cat3. all),(&cat4. all)*(&cat5. all)*&stat1.*&ana1. ;
format &cat1. &fm1.. &cat2. &fm2.. &cat3. &fm3.. &cat4. &fm4.. &cat5. &fm5..;
run;
ods tagsets.excelxp close ;
%mend voici511_3x2;

%macro voici511_4x1(lb,ds,oudexml,cat1,fm1,cat2,fm2,cat3,fm3,cat4,fm4,cat5,fm5,ana1,stat1);
ODS tagsets.excelxp file="&oudexml..xml" options(doc="help" ) ;
proc tabulate data=&lb..&ds. ;
class &cat1. &cat2. &cat3. &cat4. &cat5.;
var &ana1.;
table (&cat1. all)*(&cat2. all)*(&cat3. all)*(&cat4. all),(&cat5. all)*&stat1.*&ana1. ;
format &cat1. &fm1.. &cat2. &fm2.. &cat3. &fm3.. &cat4. &fm4.. &cat5. &fm5..;
run;
ods tagsets.excelxp close ;
%mend voici511_4x1;

%macro voici611(lb,ds,oudexml,cat1,fm1,cat2,fm2,cat3,fm3,cat4,fm4,cat5,fm5,cat6,fm6,ana1,stat1);
ODS tagsets.excelxp file="&oudexml..xml" options(doc="help" ) ;
proc tabulate data=&lb..&ds. ;
class &cat1. &cat2. &cat3. &cat4. &cat5. &cat6.;
var &ana1.;
table (&cat1. all)*(&cat2. all)*(&cat3. all)*(&cat4. all),(&cat5. all)*(&cat6. all)*&stat1.*&ana1. ;
format &cat1. &fm1.. &cat2. &fm2.. &cat3. &fm3.. &cat4. &fm4.. &cat5. &fm5.. &cat6. &fm6..;
run;
ods tagsets.excelxp close ;
%mend voici611;

%macro voici611_1x5(lb,ds,oudexml,cat1,fm1,cat2,fm2,cat3,fm3,cat4,fm4,cat5,fm5,cat6,fm6,ana1,stat1);
ODS tagsets.excelxp file="&oudexml..xml" options(doc="help" ) ;
proc tabulate data=&lb..&ds. ;
class &cat1. &cat2. &cat3. &cat4. &cat5. &cat6.;
var &ana1.;
table (&cat1. all),(&cat2. all)*(&cat3. all)*(&cat4. all)*(&cat5. all)*(&cat6. all)*&stat1.*&ana1. ;
format &cat1. &fm1.. &cat2. &fm2.. &cat3. &fm3.. &cat4. &fm4.. &cat5. &fm5.. &cat6. &fm6..;
run;
ods tagsets.excelxp close ;
%mend voici611_1x5;


%macro voici611_2x4(lb,ds,oudexml,cat1,fm1,cat2,fm2,cat3,fm3,cat4,fm4,cat5,fm5,cat6,fm6,ana1,stat1);
ODS tagsets.excelxp file="&oudexml..xml" options(doc="help" ) ;
proc tabulate data=&lb..&ds. ;
class &cat1. &cat2. &cat3. &cat4. &cat5. &cat6.;
var &ana1.;
table (&cat1. all)*(&cat2. all),(&cat3. all)*(&cat4. all)*(&cat5. all)*(&cat6. all)*&stat1.*&ana1. ;
format &cat1. &fm1.. &cat2. &fm2.. &cat3. &fm3.. &cat4. &fm4.. &cat5. &fm5.. &cat6. &fm6..;
run;
ods tagsets.excelxp close ;
%mend voici611_2x4;

%macro voici611_3x3(lb,ds,oudexml,cat1,fm1,cat2,fm2,cat3,fm3,cat4,fm4,cat5,fm5,cat6,fm6,ana1,stat1);
ODS tagsets.excelxp file="&oudexml..xml" options(doc="help" ) ;
proc tabulate data=&lb..&ds. ;
class &cat1. &cat2. &cat3. &cat4. &cat5. &cat6.;
var &ana1.;
table (&cat1. all)*(&cat2. all)*(&cat3. all),(&cat4. all)*(&cat5. all)*(&cat6. all)*&stat1.*&ana1. ;
format &cat1. &fm1.. &cat2. &fm2.. &cat3. &fm3.. &cat4. &fm4.. &cat5. &fm5.. &cat6. &fm6..;
run;
ods tagsets.excelxp close ;
%mend voici611_3x3;

%macro voici611_4x2(lb,ds,oudexml,cat1,fm1,cat2,fm2,cat3,fm3,cat4,fm4,cat5,fm5,cat6,fm6,ana1,stat1);
ODS tagsets.excelxp file = "&oudexml..xml " options(doc = "help" suppress_bylines="on") ;
proc tabulate data=&lb..&ds. ;
class &cat1. &cat2. &cat3. &cat4. &cat5. &cat6.;
var &ana1.;
table (&cat1. all)*(&cat2. all)*(&cat3. all)*(&cat4. all),(&cat5. all)*(&cat6. all)*&stat1.*&ana1. ;
format &cat1. &fm1.. &cat2. &fm2.. &cat3. &fm3.. &cat4. &fm4.. &cat5. &fm5.. &cat6. &fm6..;
run;
ods tagsets.excelxp close ;
%mend voici611_4x2;

%macro voici611_5x1(lb,ds,oudexml,cat1,fm1,cat2,fm2,cat3,fm3,cat4,fm4,cat5,fm5,cat6,fm6,ana1,stat1);
ODS tagsets.excelxp file = "&oudexml..xml"  options( doc = "help" ) ;
proc tabulate data=&lb..&ds. ;
class &cat1. &cat2. &cat3. &cat4. &cat5. &cat6.;
var &ana1.;
table (&cat1. all)*(&cat2. all)*(&cat3. all)*(&cat4. all)*(&cat5. all),(&cat6. all)*&stat1.*&ana1. ;
format &cat1. &fm1.. &cat2. &fm2.. &cat3. &fm3.. &cat4. &fm4.. &cat5. &fm5.. &cat6. &fm6..;
run;
ods tagsets.excelxp close ;
%mend voici611_5x1;
/**/
/*Great */
/*2019-03-03*/
/**/
/*Go to Production*/



