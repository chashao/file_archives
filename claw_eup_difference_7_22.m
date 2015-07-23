clear
close all

FrameRate = 1000;

%% Load data from Excel Spreadsheet
% load in the spreadsheet
[filename, path] = uigetfile('*.xlsx');
data = xlsread([path filename]);

%%Assign Variables

rownum = 3;

eup_ml_td = data(rownum,4);
eup_ml_lo = data(rownum,6);
eup_ml_td2 = data(rownum,8);

cl_ml_td = data(rownum,5);
cl_ml_lo = data(rownum,7);
cl_ml_td2 = data(rownum,9);


eup_mr_lo1 = data (rownum,10);
eup_mr_td = data (rownum,12);
eup_mr_lo2 = data (rownum,14);
eup_mr_td2 = data (rownum,16);

cl_mr_lo1 = data (rownum,11);
cl_mr_td = data(rownum,13);
cl_mr_lo2 = data(rownum,15);
cl_mr_td2 = data(rownum,17);

eup_fl_lo1 = data(rownum,18);
eup_fl_td = data(rownum,20);
eup_fl_lo2 = data(rownum,22);
eup_fl_td2 = data(rownum,24);

cl_fl_lo1 = data(rownum,19);
cl_fl_td = data(rownum,21);
cl_fl_lo2 = data(rownum,23);
cl_fl_td2 = data(rownum,25);

eup_fr_lo1 = data(rownum,26);
eup_fr_td = data(rownum,28);
eup_fr_lo2 = data(rownum,30);
eup_fr_td2 = data(rownum,32);

cl_fr_lo1 = data(rownum,27); 
cl_fr_td = data(rownum,29);
cl_fr_lo2 = data(rownum,31);
cl_fr_td2 = data(rownum,33);

eup_bl_lo1 = data(rownum,34);
eup_bl_td = data(rownum,36);
eup_bl_lo2 = data(rownum,38);
eup_bl_td2 = data(rownum,40);

cl_bl_lo1 = data(rownum,35);
cl_bl_td = data(rownum,37);
cl_bl_lo2 = data(rownum,39);
cl_bl_td2 = data(rownum,41);

eup_br_lo1 = data(rownum,42);
eup_br_td = data(rownum,44);
eup_br_lo2 = data(rownum,46);
eup_br_td2 = data(rownum,48);

cl_br_lo1 = data(rownum,43);
cl_br_td = data(rownum,45);
cl_br_lo2 = data(rownum,47);
cl_br_td2 = data(rownum,49);

%%middle left leg
if cl_ml_td >=0
ml_stance1_diff = eup_ml_td - cl_ml_td;
elseif cl_ml_td < 0
    ml_stance1_diff = 9999;
end    

if cl_ml_lo >=0
ml_stance2_diff = eup_ml_lo - cl_ml_lo;
else
    ml_stance2_diff = 9999;
end
    
%ratio
if eup_ml_lo >=0 && eup_ml_td >=0
ml_eup_stance = eup_ml_lo - eup_ml_td;
else
    ml_eup_stance = 0;
end

if cl_ml_lo >=0 && cl_ml_td >=0
ml_cl_stance = cl_ml_lo - cl_ml_td;
else
    ml_cl_stance = 0;
    
end
ml_stance_ratio = ml_cl_stance/ml_eup_stance;

%%middle right 
if eup_mr_lo1 >= 0 && cl_mr_lo1 >= 0
mr_stance1_diff = (eup_mr_lo1- cl_mr_lo1);
else 
    mr_stance1_diff = 9999;
end

if eup_mr_td >= 0 && cl_mr_td >=0 && eup_mr_td <=1 && cl_mr_td <=1
mr_stance2_diff = (eup_mr_td - cl_mr_td);
elseif eup_mr_td >= 0 && cl_mr_td >=0 && eup_mr_td <=1 && cl_mr_td >1
    mr_stance2_diff = 1 - eup_mr_td;
elseif eup_mr_td >= 0 && cl_mr_td >=0 && eup_mr_td >1 && cl_mr_td <=1
    mr_stance2_diff = cl_mr_td - 1;
else 
    mr_stance2_diff = 9999;
end
    
if eup_mr_lo2 <= 1 && cl_mr_lo2 <= 1 &&eup_mr_lo2 >=0 && cl_mr_lo2 >=0
    mr_stance3_diff = eup_mr_lo2 - cl_mr_lo2;
elseif eup_mr_lo2 >= 0 && cl_mr_lo2 >=0 && eup_mr_lo2 <=1 && cl_mr_lo2 >1
    mr_stance3_diff = 1 - eup_mr_lo2;
elseif eup_mr_lo2 >= 0 && cl_mr_lo2 >=0 && eup_mr_lo2 >1 && cl_mr_lo2 <=1
    mr_stance3_diff = cl_mr_lo2 - 1;
else 
    mr_stance3_diff = 9999;
end

if eup_mr_td2 <= 1 && cl_mr_td2 <= 1 &&eup_mr_td2 >=0 && cl_mr_td2 >=0
    mr_stance4_diff = eup_mr_td2 - cl_mr_td2;
elseif eup_mr_td2 >= 0 && cl_mr_td2 >=0 && eup_mr_td2 <=1 && cl_mr_td2 >1
    mr_stance4_diff = 1 - eup_mr_td2;
elseif eup_mr_td2 >= 0 && cl_mr_td2 >=0 && eup_mr_td2 >1 && cl_mr_td2 <=1
    mr_stance4_diff = cl_mr_td2 - 1;
else 
    mr_stance4_diff = 9999;
end

%ratio

if eup_mr_td2 > 1 && eup_mr_lo2 > 1 && eup_mr_td > 1 && eup_mr_lo1 >=0
    mr_eup_stance = eup_mr_lo1;
elseif eup_mr_td2 < 0 && eup_mr_lo2 > 1 && eup_mr_td > 1 && eup_mr_lo1 >=0
    mr_eup_stance = eup_mr_lo1;
elseif eup_mr_td2 < 0 && eup_mr_lo2 > 1 && eup_mr_td <= 1
    mr_eup_stance = eup_mr_lo1 + (1 - eup_mr_td);
elseif eup_mr_td2 > 1 && eup_mr_lo2 > 1 && eup_mr_td <= 1
    mr_eup_stance = eup_mr_lo1 + (1 - eup_mr_td);    
    
elseif eup_mr_td2 <= 0 && eup_mr_lo2 <= 1 && eup_mr_td <= 1 && eup_mr_lo1 >=0
    mr_eup_stance = eup_mr_lo1 + (eup_mr_lo2 - eup_mr_td);
elseif eup_mr_td2 <= 1 && eup_mr_lo2 <= 1 && eup_mr_td <= 1 && eup_mr_lo1 >=0
    mr_eup_stance = eup_mr_lo1 + (eup_mr_lo2 - eup_mr_td) + (1 - eup_mr_td2);
elseif eup_mr_td2 > 1 && eup_mr_lo2 <= 1 && eup_mr_td <= 1 && eup_mr_lo1 >=0
    mr_eup_stance = eup_mr_lo1 + (eup_mr_lo2 - eup_mr_td);
else
    mr_eup_stance = 9999;

end
 
 

if cl_mr_td2 > 1 && cl_mr_lo2 > 1 && cl_mr_td > 1 && cl_mr_lo1 >=0
    mr_cl_stance = cl_mr_lo1;
elseif cl_mr_td2 < 0 && cl_mr_lo2 > 1 && cl_mr_td > 1 && cl_mr_lo1 >=0
    mr_cl_stance = cl_mr_lo1;
elseif cl_mr_td2 < 0 && cl_mr_lo2 > 1 && cl_mr_td <= 1
    mr_cl_stance = cl_mr_lo1 + (1 - cl_mr_td);
elseif cl_mr_td2 > 1 && cl_mr_lo2 > 1 && cl_mr_td <= 1
    mr_cl_stance = cl_mr_lo1 + (1 - cl_mr_td);    
    
elseif cl_mr_td2 <= 0 && cl_mr_lo2 <= 1 && cl_mr_td <= 1 && cl_mr_lo1 >=0
    mr_cl_stance = cl_mr_lo1 + (cl_mr_lo2 - cl_mr_td);
elseif cl_mr_td2 <= 1 && cl_mr_lo2 <= 1 && cl_mr_td <= 1 && cl_mr_lo1 >=0
    mr_cl_stance = cl_mr_lo1 + (cl_mr_lo2 - cl_mr_td) + (1 - cl_mr_td2);
elseif cl_mr_td2 > 1 && cl_mr_lo2 <= 1 && cl_mr_td <= 1 && cl_mr_lo1 >=0
    mr_cl_stance = cl_mr_lo1 + (cl_mr_lo2 - cl_mr_td);
else
    mr_cl_stance = 9999;
 
end


mr_stance_ratio = mr_cl_stance/mr_eup_stance;

%%Front left
 
if eup_fl_lo1 >= 0 && cl_fl_lo1 >= 0
fl_stance1_diff = (eup_fl_lo1- cl_fl_lo1);
else 
    fl_stance1_diff = 9999;
end
 
if eup_fl_td >= 0 && cl_fl_td >=0 && eup_fl_td <=1 && cl_fl_td <=1
fl_stance2_diff = (eup_fl_td - cl_fl_td);
elseif eup_fl_td >= 0 && cl_fl_td >=0 && eup_fl_td <=1 && cl_fl_td >1
    fl_stance2_diff = 1 - eup_fl_td;
elseif eup_fl_td >= 0 && cl_fl_td >=0 && eup_fl_td >1 && cl_fl_td <=1
    fl_stance2_diff = cl_fl_td - 1;
else 
    fl_stance2_diff = 9999;
end
    
if eup_fl_lo2 <= 1 && cl_fl_lo2 <= 1 &&eup_fl_lo2 >=0 && cl_fl_lo2 >=0
    fl_stance3_diff = eup_fl_lo2 - cl_fl_lo2;
elseif eup_fl_lo2 >= 0 && cl_fl_lo2 >=0 && eup_fl_lo2 <=1 && cl_fl_lo2 >1
    fl_stance3_diff = 1 - eup_fl_lo2;
elseif eup_fl_lo2 >= 0 && cl_fl_lo2 >=0 && eup_fl_lo2 >1 && cl_fl_lo2 <=1
    fl_stance3_diff = cl_fl_lo2 - 1;
else 
    fl_stance3_diff = 9999;
end
 
if eup_fl_td2 <= 1 && cl_fl_td2 <= 1 &&eup_fl_td2 >=0 && cl_fl_td2 >=0
    fl_stance4_diff = eup_fl_td2 - cl_fl_td2;
elseif eup_fl_td2 >= 0 && cl_fl_td2 >=0 && eup_fl_td2 <=1 && cl_fl_td2 >1
    fl_stance4_diff = 1 - eup_fl_td2;
elseif eup_fl_td2 >= 0 && cl_fl_td2 >=0 && eup_fl_td2 >1 && cl_fl_td2 <=1
    fl_stance4_diff = cl_fl_td2 - 1;
else 
    fl_stance4_diff = 9999;
end
 
%ratio
 %%%working on this part... must take into account when there is no lo1, in
 %%%spreadsheet, it is a negative number. Then set claw and eup to
 %%%different NaN's. Figure out to run the whole spreadsheet in one go
if eup_fl_td2 > 1 && eup_fl_lo2 > 1 && eup_fl_td > 1 && eup_fl_lo1 >=0
    fl_eup_stance = eup_fl_lo1;
elseif eup_fl_td2 < 0 && eup_fl_lo2 > 1 && eup_fl_td > 1 && eup_fl_lo1 >=0
    fl_eup_stance = eup_fl_lo1;
elseif eup_fl_td2 < 0 && eup_fl_lo2 > 1 && eup_fl_td <= 1
    fl_eup_stance = eup_fl_lo1 + (1 - eup_fl_td);
elseif eup_fl_td2 > 1 && eup_fl_lo2 > 1 && eup_fl_td <= 1
    fl_eup_stance = eup_fl_lo1 + (1 - eup_fl_td);    
    
elseif eup_fl_td2 <= 0 && eup_fl_lo2 <= 1 && eup_fl_td <= 1 && eup_fl_lo1 >=0
    fl_eup_stance = eup_fl_lo1 + (eup_fl_lo2 - eup_fl_td);
elseif eup_fl_td2 <= 1 && eup_fl_lo2 <= 1 && eup_fl_td <= 1 && eup_fl_lo1 >=0
    fl_eup_stance = eup_fl_lo1 + (eup_fl_lo2 - eup_fl_td) + (1 - eup_fl_td2);
elseif eup_fl_td2 > 1 && eup_fl_lo2 <= 1 && eup_fl_td <= 1 && eup_fl_lo1 >=0
    fl_eup_stance = eup_fl_lo1 + (eup_fl_lo2 - eup_fl_td);
else
    fl_eup_stance = 9999;
 
end
 
 
%%%
 
if cl_fl_td2 > 1 && cl_fl_lo2 > 1 && cl_fl_td > 1 && cl_fl_lo1 >=0
    fl_cl_stance = cl_fl_lo1;
elseif cl_fl_td2 < 0 && cl_fl_lo2 > 1 && cl_fl_td > 1 && cl_fl_lo1 >=0
    fl_cl_stance = cl_fl_lo1;
elseif cl_fl_td2 < 0 && cl_fl_lo2 > 1 && cl_fl_td <= 1
    fl_cl_stance = cl_fl_lo1 + (1 - cl_fl_td);
elseif cl_fl_td2 > 1 && cl_fl_lo2 > 1 && cl_fl_td <= 1
    fl_cl_stance = cl_fl_lo1 + (1 - cl_fl_td);    
    
elseif cl_fl_td2 <= 0 && cl_fl_lo2 <= 1 && cl_fl_td <= 1 && cl_fl_lo1 >=0
    fl_cl_stance = cl_fl_lo1 + (cl_fl_lo2 - cl_fl_td);
elseif cl_fl_td2 <= 1 && cl_fl_lo2 <= 1 && cl_fl_td <= 1 && cl_fl_lo1 >=0
    fl_cl_stance = cl_fl_lo1 + (cl_fl_lo2 - cl_fl_td) + (1 - cl_fl_td2);
elseif cl_fl_td2 > 1 && cl_fl_lo2 <= 1 && cl_fl_td <= 1 && cl_fl_lo1 >=0
    fl_cl_stance = cl_fl_lo1 + (cl_fl_lo2 - cl_fl_td);
else
    fl_cl_stance = 9999;
 
end
 
 
fl_stance_ratio = fl_cl_stance/fl_eup_stance;

%%front right

if eup_fr_lo1 >= 0 && cl_fr_lo1 >= 0
fr_stance1_diff = (eup_fr_lo1- cl_fr_lo1);
else 
    fr_stance1_diff = 9999;
end
 
if eup_fr_td >= 0 && cl_fr_td >=0 && eup_fr_td <=1 && cl_fr_td <=1
fr_stance2_diff = (eup_fr_td - cl_fr_td);
elseif eup_fr_td >= 0 && cl_fr_td >=0 && eup_fr_td <=1 && cl_fr_td >1
    fr_stance2_diff = 1 - eup_fr_td;
elseif eup_fr_td >= 0 && cl_fr_td >=0 && eup_fr_td >1 && cl_fr_td <=1
    fr_stance2_diff = cl_fr_td - 1;
else 
    fr_stance2_diff = 9999;
end
    
if eup_fr_lo2 <= 1 && cl_fr_lo2 <= 1 &&eup_fr_lo2 >=0 && cl_fr_lo2 >=0
    fr_stance3_diff = eup_fr_lo2 - cl_fr_lo2;
elseif eup_fr_lo2 >= 0 && cl_fr_lo2 >=0 && eup_fr_lo2 <=1 && cl_fr_lo2 >1
    fr_stance3_diff = 1 - eup_fr_lo2;
elseif eup_fr_lo2 >= 0 && cl_fr_lo2 >=0 && eup_fr_lo2 >1 && cl_fr_lo2 <=1
    fr_stance3_diff = cl_fr_lo2 - 1;
else 
    fr_stance3_diff = 9999;
end
 
if eup_fr_td2 <= 1 && cl_fr_td2 <= 1 &&eup_fr_td2 >=0 && cl_fr_td2 >=0
    fr_stance4_diff = eup_fr_td2 - cl_fr_td2;
elseif eup_fr_td2 >= 0 && cl_fr_td2 >=0 && eup_fr_td2 <=1 && cl_fr_td2 >1
    fr_stance4_diff = 1 - eup_fr_td2;
elseif eup_fr_td2 >= 0 && cl_fr_td2 >=0 && eup_fr_td2 >1 && cl_fr_td2 <=1
    fr_stance4_diff = cl_fr_td2 - 1;
else 
    fr_stance4_diff = 9999;
end
 
%ratio
 
if eup_fr_td2 > 1 && eup_fr_lo2 > 1 && eup_fr_td > 1 && eup_fr_lo1 >=0
    fr_eup_stance = eup_fr_lo1;
elseif eup_fr_td2 < 0 && eup_fr_lo2 > 1 && eup_fr_td > 1 && eup_fr_lo1 >=0
    fr_eup_stance = eup_fr_lo1;
elseif eup_fr_td2 < 0 && eup_fr_lo2 > 1 && eup_fr_td <= 1 && eup_fr_lo1 >=0
    fr_eup_stance = eup_fr_lo1 + (1 - eup_fr_td);
elseif eup_fr_td2 > 1 && eup_fr_lo2 > 1 && eup_fr_td <= 1 && eup_fr_lo1 >=0
    fr_eup_stance = eup_fr_lo1 + (1 - eup_fr_td);    
    
elseif eup_fr_td2 <= 0 && eup_fr_lo2 <= 1 && eup_fr_td <= 1 && eup_fr_lo1 >=0
    fr_eup_stance = eup_fr_lo1 + (eup_fr_lo2 - eup_fr_td);
elseif eup_fr_td2 <= 1 && eup_fr_lo2 <= 1 && eup_fr_td <= 1 && eup_fr_lo1 >=0
    fr_eup_stance = eup_fr_lo1 + (eup_fr_lo2 - eup_fr_td) + (1 - eup_fr_td2);
elseif eup_fr_td2 > 1 && eup_fr_lo2 <= 1 && eup_fr_td <= 1 && eup_fr_lo1 >=0
    fr_eup_stance = eup_fr_lo1 + (eup_fr_lo2 - eup_fr_td);
elseif eup_fr_lo1 < 0 && eup_fr_lo2 >=0 && eup_fr_lo2 <= 1 && eup_fr_td >=0 && eup_fr_td <= 1 
    fr_eup_stance = eup_fr_lo2 - eup_fr_td;
else
    fr_eup_stance = 9999;
 
end
 
 
 
if cl_fr_td2 > 1 && cl_fr_lo2 > 1 && cl_fr_td > 1 && cl_fr_lo1 >=0
    fr_cl_stance = cl_fr_lo1;
elseif cl_fr_td2 < 0 && cl_fr_lo2 > 1 && cl_fr_td > 1 && cl_fr_lo1 >=0
    fr_cl_stance = cl_fr_lo1;
elseif cl_fr_td2 < 0 && cl_fr_lo2 > 1 && cl_fr_td <= 1
    fr_cl_stance = cl_fr_lo1 + (1 - cl_fr_td);
elseif cl_fr_td2 > 1 && cl_fr_lo2 > 1 && cl_fr_td <= 1
    fr_cl_stance = cl_fr_lo1 + (1 - cl_fr_td);    
    
elseif cl_fr_td2 <= 0 && cl_fr_lo2 <= 1 && cl_fr_td <= 1 && cl_fr_lo1 >=0
    fr_cl_stance = cl_fr_lo1 + (cl_fr_lo2 - cl_fr_td);
elseif cl_fr_td2 <= 1 && cl_fr_lo2 <= 1 && cl_fr_td <= 1 && cl_fr_lo1 >=0
    fr_cl_stance = cl_fr_lo1 + (cl_fr_lo2 - cl_fr_td) + (1 - cl_fr_td2);
elseif cl_fr_td2 > 1 && cl_fr_lo2 <= 1 && cl_fr_td <= 1 && cl_fr_lo1 >=0
    fr_cl_stance = cl_fr_lo1 + (cl_fr_lo2 - cl_fr_td);
else
    fr_cl_stance = 9999;
 
end
 
 
fr_stance_ratio = fr_cl_stance/fr_eup_stance;

%%back left

if eup_bl_lo1 >= 0 && cl_bl_lo1 >= 0
bl_stance1_diff = (eup_bl_lo1- cl_bl_lo1);
else 
    bl_stance1_diff = 9999;
end
 
if eup_bl_td >= 0 && cl_bl_td >=0 && eup_bl_td <=1 && cl_bl_td <=1
bl_stance2_diff = (eup_bl_td - cl_bl_td);
elseif eup_bl_td >= 0 && cl_bl_td >=0 && eup_bl_td <=1 && cl_bl_td >1
    bl_stance2_diff = 1 - eup_bl_td;
elseif eup_bl_td >= 0 && cl_bl_td >=0 && eup_bl_td >1 && cl_bl_td <=1
    bl_stance2_diff = cl_bl_td - 1;
else 
    bl_stance2_diff = 9999;
end
    
if eup_bl_lo2 <= 1 && cl_bl_lo2 <= 1 &&eup_bl_lo2 >=0 && cl_bl_lo2 >=0
    bl_stance3_diff = eup_bl_lo2 - cl_bl_lo2;
elseif eup_bl_lo2 >= 0 && cl_bl_lo2 >=0 && eup_bl_lo2 <=1 && cl_bl_lo2 >1
    bl_stance3_diff = 1 - eup_bl_lo2;
elseif eup_bl_lo2 >= 0 && cl_bl_lo2 >=0 && eup_bl_lo2 >1 && cl_bl_lo2 <=1
    bl_stance3_diff = cl_bl_lo2 - 1;
else 
    bl_stance3_diff = 9999;
end
 
if eup_bl_td2 <= 1 && cl_bl_td2 <= 1 &&eup_bl_td2 >=0 && cl_bl_td2 >=0
    bl_stance4_diff = eup_bl_td2 - cl_bl_td2;
elseif eup_bl_td2 >= 0 && cl_bl_td2 >=0 && eup_bl_td2 <=1 && cl_bl_td2 >1
    bl_stance4_diff = 1 - eup_bl_td2;
elseif eup_bl_td2 >= 0 && cl_bl_td2 >=0 && eup_bl_td2 >1 && cl_bl_td2 <=1
    bl_stance4_diff = cl_bl_td2 - 1;
else 
    bl_stance4_diff = 9999;
end
 
%ratio
 
if eup_bl_td2 > 1 && eup_bl_lo2 > 1 && eup_bl_td > 1 && eup_bl_lo1 >=0
    bl_eup_stance = eup_bl_lo1;
elseif eup_bl_td2 < 0 && eup_bl_lo2 > 1 && eup_bl_td > 1 && eup_bl_lo1 >=0
    bl_eup_stance = eup_bl_lo1;
elseif eup_bl_td2 < 0 && eup_bl_lo2 > 1 && eup_bl_td <= 1
    bl_eup_stance = eup_bl_lo1 + (1 - eup_bl_td);
elseif eup_bl_td2 > 1 && eup_bl_lo2 > 1 && eup_bl_td <= 1
    bl_eup_stance = eup_bl_lo1 + (1 - eup_bl_td);    
    
elseif eup_bl_td2 <= 0 && eup_bl_lo2 <= 1 && eup_bl_td <= 1 && eup_bl_lo1 >=0
    bl_eup_stance = eup_bl_lo1 + (eup_bl_lo2 - eup_bl_td);
elseif eup_bl_td2 <= 1 && eup_bl_lo2 <= 1 && eup_bl_td <= 1 && eup_bl_lo1 >=0
    bl_eup_stance = eup_bl_lo1 + (eup_bl_lo2 - eup_bl_td) + (1 - eup_bl_td2);
elseif eup_bl_td2 > 1 && eup_bl_lo2 <= 1 && eup_bl_td <= 1 && eup_bl_lo1 >=0
    bl_eup_stance = eup_bl_lo1 + (eup_bl_lo2 - eup_bl_td);
else
    bl_eup_stance = 9999;
 
end
 
 
 
if cl_bl_td2 > 1 && cl_bl_lo2 > 1 && cl_bl_td > 1 && cl_bl_lo1 >=0
    bl_cl_stance = cl_bl_lo1;
elseif cl_bl_td2 < 0 && cl_bl_lo2 > 1 && cl_bl_td > 1 && cl_bl_lo1 >=0
    bl_cl_stance = cl_bl_lo1;
elseif cl_bl_td2 < 0 && cl_bl_lo2 > 1 && cl_bl_td <= 1
    bl_cl_stance = cl_bl_lo1 + (1 - cl_bl_td);
elseif cl_bl_td2 > 1 && cl_bl_lo2 > 1 && cl_bl_td <= 1
    bl_cl_stance = cl_bl_lo1 + (1 - cl_bl_td);    
    
elseif cl_bl_td2 <= 0 && cl_bl_lo2 <= 1 && cl_bl_td <= 1 && cl_bl_lo1 >=0
    bl_cl_stance = cl_bl_lo1 + (cl_bl_lo2 - cl_bl_td);
elseif cl_bl_td2 <= 1 && cl_bl_lo2 <= 1 && cl_bl_td <= 1 && cl_bl_lo1 >=0
    bl_cl_stance = cl_bl_lo1 + (cl_bl_lo2 - cl_bl_td) + (1 - cl_bl_td2);
elseif cl_bl_td2 > 1 && cl_bl_lo2 <= 1 && cl_bl_td <= 1 && cl_bl_lo1 >=0
    bl_cl_stance = cl_bl_lo1 + (cl_bl_lo2 - cl_bl_td);
else
    bl_cl_stance = 9999;
 
end
 
 
bl_stance_ratio = bl_cl_stance/bl_eup_stance;

%%back right

if eup_br_lo1 >= 0 && cl_br_lo1 >= 0
br_stance1_diff = (eup_br_lo1- cl_br_lo1);
else 
    br_stance1_diff = 9999;
end
 
if eup_br_td >= 0 && cl_br_td >=0 && eup_br_td <=1 && cl_br_td <=1
br_stance2_diff = (eup_br_td - cl_br_td);
elseif eup_br_td >= 0 && cl_br_td >=0 && eup_br_td <=1 && cl_br_td >1
    br_stance2_diff = 1 - eup_br_td;
elseif eup_br_td >= 0 && cl_br_td >=0 && eup_br_td >1 && cl_br_td <=1
    br_stance2_diff = cl_br_td - 1;
else 
    br_stance2_diff = 9999;
end
    
if eup_br_lo2 <= 1 && cl_br_lo2 <= 1 &&eup_br_lo2 >=0 && cl_br_lo2 >=0
    br_stance3_diff = eup_br_lo2 - cl_br_lo2;
elseif eup_br_lo2 >= 0 && cl_br_lo2 >=0 && eup_br_lo2 <=1 && cl_br_lo2 >1
    br_stance3_diff = 1 - eup_br_lo2;
elseif eup_br_lo2 >= 0 && cl_br_lo2 >=0 && eup_br_lo2 >1 && cl_br_lo2 <=1
    br_stance3_diff = cl_br_lo2 - 1;
else 
    br_stance3_diff = 9999;
end
 
if eup_br_td2 <= 1 && cl_br_td2 <= 1 &&eup_br_td2 >=0 && cl_br_td2 >=0
    br_stance4_diff = eup_br_td2 - cl_br_td2;
elseif eup_br_td2 >= 0 && cl_br_td2 >=0 && eup_br_td2 <=1 && cl_br_td2 >1
    br_stance4_diff = 1 - eup_br_td2;
elseif eup_br_td2 >= 0 && cl_br_td2 >=0 && eup_br_td2 >1 && cl_br_td2 <=1
    br_stance4_diff = cl_br_td2 - 1;
else 
    br_stance4_diff = 9999;
end
 
%ratio
 
if eup_br_td2 > 1 && eup_br_lo2 > 1 && eup_br_td > 1 && eup_br_lo1 >=0
    br_eup_stance = eup_br_lo1;
elseif eup_br_td2 < 0 && eup_br_lo2 > 1 && eup_br_td > 1 && eup_br_lo1 >=0
    br_eup_stance = eup_br_lo1;
elseif eup_br_td2 < 0 && eup_br_lo2 > 1 && eup_br_td <= 1
    br_eup_stance = eup_br_lo1 + (1 - eup_br_td);
elseif eup_br_td2 > 1 && eup_br_lo2 > 1 && eup_br_td <= 1
    br_eup_stance = eup_br_lo1 + (1 - eup_br_td);    
    
elseif eup_br_td2 <= 0 && eup_br_lo2 <= 1 && eup_br_td <= 1 && eup_br_lo1 >=0
    br_eup_stance = eup_br_lo1 + (eup_br_lo2 - eup_br_td);
elseif eup_br_td2 <= 1 && eup_br_lo2 <= 1 && eup_br_td <= 1 && eup_br_lo1 >=0
    br_eup_stance = eup_br_lo1 + (eup_br_lo2 - eup_br_td) + (1 - eup_br_td2);
elseif eup_br_td2 > 1 && eup_br_lo2 <= 1 && eup_br_td <= 1 && eup_br_lo1 >=0
    br_eup_stance = eup_br_lo1 + (eup_br_lo2 - eup_br_td);
else
    br_eup_stance = 9999;
 
end
 
 
 
if cl_br_td2 > 1 && cl_br_lo2 > 1 && cl_br_td > 1 && cl_br_lo1 >=0
    br_cl_stance = cl_br_lo1;
elseif cl_br_td2 < 0 && cl_br_lo2 > 1 && cl_br_td > 1 && cl_br_lo1 >=0
    br_cl_stance = cl_br_lo1;
elseif cl_br_td2 < 0 && cl_br_lo2 > 1 && cl_br_td <= 1
    br_cl_stance = cl_br_lo1 + (1 - cl_br_td);
elseif cl_br_td2 > 1 && cl_br_lo2 > 1 && cl_br_td <= 1
    br_cl_stance = cl_br_lo1 + (1 - cl_br_td);    
    
elseif cl_br_td2 <= 0 && cl_br_lo2 <= 1 && cl_br_td <= 1 && cl_br_lo1 >=0
    br_cl_stance = cl_br_lo1 + (cl_br_lo2 - cl_br_td);
elseif cl_br_td2 <= 1 && cl_br_lo2 <= 1 && cl_br_td <= 1 && cl_br_lo1 >=0
    br_cl_stance = cl_br_lo1 + (cl_br_lo2 - cl_br_td) + (1 - cl_br_td2);
elseif cl_br_td2 > 1 && cl_br_lo2 <= 1 && cl_br_td <= 1 && cl_br_lo1 >=0
    br_cl_stance = cl_br_lo1 + (cl_br_lo2 - cl_br_td);
else
    br_cl_stance = 9999;
 
end
 
 
br_stance_ratio = br_cl_stance/br_eup_stance;

%%
Data_Points = [ml_stance1_diff ml_stance2_diff ml_cl_stance ml_eup_stance  ml_stance_ratio mr_stance1_diff mr_stance2_diff mr_stance3_diff mr_stance4_diff mr_eup_stance mr_cl_stance mr_stance_ratio fl_stance1_diff fl_stance2_diff fl_stance3_diff fl_stance4_diff fl_eup_stance fl_cl_stance fl_stance_ratio fr_stance1_diff fr_stance2_diff fr_stance3_diff fr_stance4_diff fr_eup_stance fr_cl_stance fr_stance_ratio bl_stance1_diff bl_stance2_diff bl_stance3_diff bl_stance4_diff br_eup_stance br_cl_stance bl_stance_ratio br_stance1_diff br_stance2_diff br_stance3_diff br_stance4_diff br_eup_stance br_cl_stance br_stance_ratio];

