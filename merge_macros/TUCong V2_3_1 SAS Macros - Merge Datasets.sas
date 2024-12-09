
%macro link(lib,dbs_target,dbs1,dbs1_domfeu,dbs2,dbs2_domfeu,key);
%faireordre(&lib.,&dbs1.,&key);
%faireordre(&lib.,&dbs2.,&key);
data &lib..&dbs_target.;
merge 
&lib..&dbs1. (in=linkx)
&lib..&dbs2. (in=linky);
by &key.;
%if &dbs1_domfeu.=1 and &dbs2_domfeu.=0 %then %do; if linkx; %end;
%if &dbs1_domfeu.=0 and &dbs2_domfeu.=1 %then %do; if linky; %end;
%if &dbs1_domfeu.=1 and &dbs2_domfeu.=1 %then %do; if linkx and linky; %end; 
%if &dbs1_domfeu.=0 and &dbs2_domfeu.=0 %then %do; if linkx or linky; %end; 

run;
%mend link;

%macro lier(lib,dbs_target,dbs1,dbs1_domfeu,dbs2,dbs2_domfeu,key);
%faireordre(&lib.,&dbs1.,&key. );
%faireordre(&lib.,&dbs2.,&key. );
data &lib..&dbs_target.;
merge 
&lib..&dbs1. (in=lierj)
&lib..&dbs2. (in=lierk);
by &key. ;
%if &dbs1_domfeu.=1 and &dbs2_domfeu.=0 %then %do; if lierj; %end;
%if &dbs1_domfeu.=0 and &dbs2_domfeu.=1 %then %do; if lierk; %end;
%if &dbs1_domfeu.=1 and &dbs2_domfeu.=1 %then %do; if lierj and lierk; %end; 
%if &dbs1_domfeu.=0 and &dbs2_domfeu.=0 %then %do; if lierj or lierk; %end; 
run;
%mend lier;

%macro lierwithoutsort(lib,dbs_target,dbs1,dbs1_domfeu,dbs2,dbs2_domfeu,key);
data &lib..&dbs_target.;
merge 
&lib..&dbs1. (in=xlierwithoutsort)
&lib..&dbs2. (in=ylierwithoutsort);
by &key.;
%if &dbs1_domfeu.=1 and &dbs2_domfeu.=0 %then %do; if xlierwithoutsort; %end;
%if &dbs1_domfeu.=0 and &dbs2_domfeu.=1 %then %do; if ylierwithoutsort; %end;
%if &dbs1_domfeu.=1 and &dbs2_domfeu.=1 %then %do; if xlierwithoutsort and ylierwithoutsort; %end; 
%if &dbs1_domfeu.=0 and &dbs2_domfeu.=0 %then %do; if xlierwithoutsort or ylierwithoutsort; %end; 

run;
%mend lierwithoutsort;

%macro LinkByAnyKey(lib,dbs_target,dbs1,dbs1_domfeu,key1,key1_domfeu,dbs2,dbs2_domfeu,key2,key2_domfeu);
%faireordre(&lib.,&dbs1.,&key1.);
%faireordre(&lib.,&dbs2.,&key2.);
%if &key1_domfeu.=1 and &key2_domfeu.=0 %then %do; 
	%RenommerUneVarDehors(&lib.,&dbs2.,work,dbs2_temp,&key2.,&key1.);
	data &lib..&dbs_target.;
	merge 
	&lib..&dbs1. (in=x)
	dbs2_temp (in=y);
	by &key1.;
	%if &dbs1_domfeu.=1 and &dbs2_domfeu.=0 %then %do; if x; %end;
	%if &dbs1_domfeu.=0 and &dbs2_domfeu.=1 %then %do; if y; %end;
	%if &dbs1_domfeu.=1 and &dbs2_domfeu.=1 %then %do; if x and y; %end; 
	%if &dbs1_domfeu.=0 and &dbs2_domfeu.=0 %then %do; if x or y; %end; 
	run;
%end;
%if &key1_domfeu.=0 and &key2_domfeu.=1 %then %do;
	%RenommerUneVarDehors(&lib.,&dbs1.,work,dbs1_temp,&key1.,&key2.);
	data &lib..&dbs_target.;
	merge 
	dbs1_temp (in=x)
	&lib..&dbs2.(in=y);
	by &key2.;
	%if &dbs1_domfeu.=1 and &dbs2_domfeu.=0 %then %do; if x; %end;
	%if &dbs1_domfeu.=0 and &dbs2_domfeu.=1 %then %do; if y; %end;
	%if &dbs1_domfeu.=1 and &dbs2_domfeu.=1 %then %do; if x and y; %end; 
	%if &dbs1_domfeu.=0 and &dbs2_domfeu.=0 %then %do; if x or y; %end; 

	run;
%end;
%mend LinkByAnyKey;

%macro LinkByAnyKeywithoutsort(lib,dbs_target,dbs1,dbs1_domfeu,key1,key1_domfeu,dbs2,dbs2_domfeu,key2,key2_domfeu);
/*%faireordre(&lib.,&dbs1.,&key1.);*/
/*%faireordre(&lib.,&dbs2.,&key2.);*/
%if &key1_domfeu.=1 and &key2_domfeu.=0 %then %do; 
	%RenommerUneVarDehors(&lib.,&dbs2.,work,dbs2_temp,&key2.,&key1.);
	data &lib..&dbs_target.;
	merge 
	&lib..&dbs1. (in=x)
	dbs2_temp (in=y);
	by &key1.;
	%if &dbs1_domfeu.=1 and &dbs2_domfeu.=0 %then %do; if x; %end;
	%if &dbs1_domfeu.=0 and &dbs2_domfeu.=1 %then %do; if y; %end;
	%if &dbs1_domfeu.=1 and &dbs2_domfeu.=1 %then %do; if x and y; %end; 
	%if &dbs1_domfeu.=0 and &dbs2_domfeu.=0 %then %do; if x or y; %end; 
	run;
%end;
%if &key1_domfeu.=0 and &key2_domfeu.=1 %then %do;
	%RenommerUneVarDehors(&lib.,&dbs1.,work,dbs1_temp,&key1.,&key2.);
	data &lib..&dbs_target.;
	merge 
	dbs1_temp (in=x)
	&lib..&dbs2.(in=y);
	by &key2.;
	%if &dbs1_domfeu.=1 and &dbs2_domfeu.=0 %then %do; if x; %end;
	%if &dbs1_domfeu.=0 and &dbs2_domfeu.=1 %then %do; if y; %end;
	%if &dbs1_domfeu.=1 and &dbs2_domfeu.=1 %then %do; if x and y; %end; 
	%if &dbs1_domfeu.=0 and &dbs2_domfeu.=0 %then %do; if x or y; %end; 

	run;
%end;
%mend LinkByAnyKeywithoutsort;

%macro LierParNimporteQuellecles(lib,dbs_target,dbs1,dbs1_domfeu,key1,key1_domfeu,dbs2,dbs2_domfeu,key2,key2_domfeu);
%faireordre(&lib.,&dbs1.,&key1.);
%faireordre(&lib.,&dbs2.,&key2.);
%if &key1_domfeu.=1 and &key2_domfeu.=0 %then %do; 
	%RenommerUneVarDehors(&lib.,&dbs2.,work,dbs2_temp,&key2.,&key1.);
	data &lib..&dbs_target.;
	merge 
	&lib..&dbs1. (in=xz)
	dbs2_temp (in=yz);
	by &key1.;
	%if &dbs1_domfeu.=1 and &dbs2_domfeu.=0 %then %do; if xz; %end;
	%if &dbs1_domfeu.=0 and &dbs2_domfeu.=1 %then %do; if yz; %end;
	%if &dbs1_domfeu.=1 and &dbs2_domfeu.=1 %then %do; if xz and yz; %end; 
	%if &dbs1_domfeu.=0 and &dbs2_domfeu.=0 %then %do; if xz or yz; %end; 

	run;
%end;
%if &key1_domfeu.=0 and &key2_domfeu.=1 %then %do;
	%RenommerUneVarDehors(&lib.,&dbs1.,work,dbs1_temp,&key1.,&key2.);
	data &lib..&dbs_target.;
	merge 
	dbs1_temp (in=xz)
	&lib..&dbs2.(in=yz);
	by &key2.;
	%if &dbs1_domfeu.=1 and &dbs2_domfeu.=0 %then %do; if xz; %end;
	%if &dbs1_domfeu.=0 and &dbs2_domfeu.=1 %then %do; if yz; %end;
	%if &dbs1_domfeu.=1 and &dbs2_domfeu.=1 %then %do; if xz and yz; %end; 
	%if &dbs1_domfeu.=0 and &dbs2_domfeu.=0 %then %do; if xz or yz; %end; 

	run;
%end;
%mend LierParNimporteQuellecles;

%macro LinkByAnyKeyAcross(lib,dbs_target,dbs1,dbs1_domfeu,key1,key1_domfeu,lib2,dbs2,dbs2_domfeu,key2,key2_domfeu);
%faireordre(&lib.,&dbs1. force,&key1.);
%faireordre(&lib2.,&dbs2.,&key2.);
%if &key1_domfeu.=1 and &key2_domfeu.=0 %then %do; 
	%RenommerUneVarDehors(&lib2.,&dbs2.,work,dbs2_temp,&key2.,&key1.);
	data &lib..&dbs_target.;
	merge 
	&lib..&dbs1. (in=x)
	dbs2_temp (in=y);
	by &key1.;
	%if &dbs1_domfeu.=1 and &dbs2_domfeu.=0 %then %do; if x; %end;
	%if &dbs1_domfeu.=0 and &dbs2_domfeu.=1 %then %do; if y; %end;
	%if &dbs1_domfeu.=1 and &dbs2_domfeu.=1 %then %do; if x and y; %end; 
	%if &dbs1_domfeu.=0 and &dbs2_domfeu.=0 %then %do; if x or y; %end; 
	run;
%end;
%if &key1_domfeu.=0 and &key2_domfeu.=1 %then %do;
	%RenommerUneVarDehors(&lib.,&dbs1.,work,dbs1_temp,&key1.,&key2.);
	data &lib..&dbs_target.;
	merge 
	dbs1_temp (in=LinkByAnyKeyAcrossx)
	&lib2..&dbs2.(in=LinkByAnyKeyAcrossy);
	by &key2.;
	%if &dbs1_domfeu.=1 and &dbs2_domfeu.=0 %then %do; if LinkByAnyKeyAcrossx; %end;
	%if &dbs1_domfeu.=0 and &dbs2_domfeu.=1 %then %do; if LinkByAnyKeyAcrossy; %end;
	%if &dbs1_domfeu.=1 and &dbs2_domfeu.=1 %then %do; if LinkByAnyKeyAcrossx and LinkByAnyKeyAcrossy; %end;
	%if &dbs1_domfeu.=0 and &dbs2_domfeu.=0 %then %do; if LinkByAnyKeyAcrossx or LinkByAnyKeyAcrossy; %end; 
 
	run;
%end;
%mend LinkByAnyKeyAcross;


%macro LinkThree(lib,dbs_target,dbs1,dbs1_domfeu,dbs2,dbs2_domfeu,dbs3,dbs3_domfeu,key);
%faireordre(&lib.,&dbs1. nodupkey,&key.);
%faireordre(&lib.,&dbs2. nodupkey,&key.);
%faireordre(&lib.,&dbs3. nodupkey,&key.);
data &lib..&dbs_target.;
merge 
&lib..&dbs1. (in=x)
&lib..&dbs2. (in=y)
&lib..&dbs3. (in=z)
;
by &key.;
%if &dbs1_domfeu.=1 and &dbs2_domfeu.=0 and &dbs3_domfeu.=0 %then %do; if x; %end;
%if &dbs1_domfeu.=0 and &dbs2_domfeu.=1 and &dbs3_domfeu.=0 %then %do; if y; %end;
%if &dbs1_domfeu.=0 and &dbs2_domfeu.=0 and &dbs3_domfeu.=1 %then %do; if z; %end;
%if &dbs1_domfeu.=1 and &dbs2_domfeu.=1 and &dbs3_domfeu.=0 %then %do; if x and y; %end;
%if &dbs1_domfeu.=1 and &dbs2_domfeu.=0 and &dbs3_domfeu.=1 %then %do; if x and z; %end;
%if &dbs1_domfeu.=0 and &dbs2_domfeu.=1 and &dbs3_domfeu.=1 %then %do; if y and z; %end;
%if &dbs1_domfeu.=1 and &dbs2_domfeu.=1 and &dbs3_domfeu.=1 %then %do; if x and y and z; %end;
%if &dbs1_domfeu.=0 and &dbs2_domfeu.=0 and &dbs3_domfeu.=0 %then %do; if x or y or z; %end;

run;
%mend LinkThree;

%macro LierTrois(lib,dbs_target,dbs1,dbs1_domfeu,dbs2,dbs2_domfeu,dbs3,dbs3_domfeu,key);
%faireordre(&lib.,&dbs1.,&key.)
%faireordre(&lib.,&dbs2.,&key.)
%faireordre(&lib.,&dbs3.,&key.)
data &lib..&dbs_target.;
merge 
&lib..&dbs1. (in=x)
&lib..&dbs2. (in=y)
&lib..&dbs3. (in=z)
;
by &key.;
%if &dbs1_domfeu.=1 and &dbs2_domfeu.=0 and &dbs3_domfeu.=0 %then %do; if x; %end;
%if &dbs1_domfeu.=0 and &dbs2_domfeu.=1 and &dbs3_domfeu.=0 %then %do; if y; %end;
%if &dbs1_domfeu.=0 and &dbs2_domfeu.=0 and &dbs3_domfeu.=1 %then %do; if z; %end;
%if &dbs1_domfeu.=1 and &dbs2_domfeu.=1 and &dbs3_domfeu.=0 %then %do; if x and y; %end;
%if &dbs1_domfeu.=1 and &dbs2_domfeu.=0 and &dbs3_domfeu.=1 %then %do; if x and z; %end;
%if &dbs1_domfeu.=0 and &dbs2_domfeu.=1 and &dbs3_domfeu.=1 %then %do; if y and z; %end;
%if &dbs1_domfeu.=1 and &dbs2_domfeu.=1 and &dbs3_domfeu.=1 %then %do; if x and y and z; %end;
%if &dbs1_domfeu.=0 and &dbs2_domfeu.=0 and &dbs3_domfeu.=0 %then %do; if x or y or z; %end;
run;
%mend LierTrois;


%macro LierParEffectiveDT(lib_target,dbs_target,
lib_major, dbs_major, key_major,dbs_major_RecordDT,
lib_lookup,dbs_lookup,key_lookup,dbs_lookup_EffDT,dbs_lookup_ExpDT);
;
proc sql;
create table &lib_target..&TargetDS. as 
select 
A.*,
B.*
from 		&lib_major..&lib_major. A
				left join
			&lib_lookup..&lib_lookup. B 
on
				A.&key_major = B.&key_lookup
		and     A.&dbs_major_RecordDT ge B.&dbs_lookup_EffDT
		and 	A.&dbs_major_RecordDT le B.&dbs_lookup_ExpDT
		;
run; quit;
%mend LierParEffectiveDT;