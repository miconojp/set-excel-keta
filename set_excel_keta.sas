%macro set_excel(inds,keta);


	%if &keta.=1 %then %do;
		%let keta1=0.001;/*標準偏差*/
		%let keta2=10.3;/*標準偏差*/
		%let keta3=0.001;/*平均値、四分位値、中央値*/
		%let keta4=10.2;/*平均値、四分位値、中央値*/
		%let keta5=10.1;/*最小値、最大値*/
	%end;
	%if &keta.=2 %then %do;
		%let keta1=0.01;/*標準偏差*/
		%let keta2=10.2;/*標準偏差*/
		%let keta3=0.01;/*平均値、四分位値、中央値*/
		%let keta4=10.1;/*平均値、四分位値、中央値*/
		%let keta5=10.;/*最小値、最大値*/
	%end;
	%if &keta.=3 %then %do;
		%let keta1=0.0001;/*標準偏差*/
		%let keta2=10.4;/*標準偏差*/
		%let keta3=0.0001;/*平均値、四分位値、中央値*/
		%let keta4=10.3;/*平均値、四分位値、中央値*/
		%let keta5=10.2;/*最小値、最大値*/
	%end;
		%if &keta.=4 %then %do;
		%let keta1=0.00001;/*標準偏差*/
		%let keta2=10.5;/*標準偏差*/
		%let keta3=0.00001;/*平均値、四分位値、中央値*/
		%let keta4=10.4;/*平均値、四分位値、中央値*/
		%let keta5=8.3;/**最小値、最大値*/
	%end;
       data &inds._&num. ;

              set &inds. ;

			/*標準偏差*/
			stddev2 = compress( put(round(stddev,&keta1.),&keta2.));
			/*平均値、四分位値、中央値*/
			mean2  = put(round(mean,&keta3.),&keta4.);
			Q1_2 = put(Q1,&keta4.);
			Q3_3 = put(Q3,&keta4.);
			median2  = put(round(median,&keta3.),&keta4.);
			/*最小値、最大値*/
			max2 = put(max,&keta5.);
			min2 = put(min,&keta5.);
			/*予備*/
			num = &num.;
			kusuri = &kusuri.;
                     
              keep mean2 stddev2 num n max2 min2 median2 kusuri Q1_2 Q3_3 ;

       run;
%mend;
