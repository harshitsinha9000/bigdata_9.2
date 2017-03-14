Student = LOAD 'StudentDs.txt' using PigStorage(',') as (Name:chararray,Col_Undertaken:chararray,Dob:chararray,Stream:chararray,Grade:float,State:chararray,City:chararray);


--Task1(Find the number of students who scored less than 5(50%).

sc_lt_5 = FILTER Student BY Grade < 5.0
sc_lt_51 = group sc_lt_5  ALL;
sc_lt_52 = FOREACH sc_lt_51 GENERATE COUNT_STAR(sc_lt_5.Name);


--Task2

sc_st_alaska = FOREACH(Filter Student BY State =='alaska')GENERATE Name;

--Task3

sc_st_gov_alabama = Filter Student BY State matches '.*alabama*' AND Col_Undertaken matches'.*goverenment*';
sc_st_gov_alabama1 = FOREACH(GROUP sc_st_gov_alabama ALL)GENERATE COUNT(sc_st_gov_alabama);

--Task4
sc_st_BE_oregon = FOREACH(Filter Student BY State matches '.*oregon*' AND Stream matches '.*BE*') GENERATE Name;
