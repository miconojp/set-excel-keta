%macro set_excel(inds,keta);

       %if &keta.=1 %then %do;
              %let keta1=0.01;
              %let keta2=8.2;
              %let keta3=8.1;
       %end;
       %if &keta.=2 %then %do;
              %let keta1=0.001;
              %let keta2=8.3;
              %let keta3=8.2;
       %end;
       %if &keta.=3 %then %do;
              %let keta1=0.001;
              %let keta2=8.3;
              %let keta3=8.3;
       %end;
       data &inds._&num. ;

              set &inds. ;

                     stddev2 = compress("("|| put(round(stddev,&keta1.),&keta2.) || ")");
                     mean2  = put(round(mean,&keta1.),&keta3.);
                     median2  = put(round(median,&keta1.),&keta3.);
                     max2 = put(max,&keta3.);
                     min2 = put(min,&keta3.);
                     Q1_2 = put(Q1,&keta3.);
                     Q3_3 = put(Q3,&keta3.);
              keep mean2 stddev2 num n max2 min2 median2 kusuri Q1_2 Q3_3 ;

       run;
%mend;
