clear
close all

FrameRate = 1000;

%% Load data from Excel Spreadsheet
% load in the spreadsheet
[filename, path] = uigetfile('*.xlsx');
data = xlsread([path filename]);

%%
rownum = 17;


%subtract td frame from each value in data
if data(rownum,6) > data(rownum,8)
    data = data - data(rownum,8);
elseif data(rownum,8) >= data(rownum,6)
    data = data - data(rownum,6);
end
%%
%divide data by last td
if data(rownum,14) > data(rownum,12) || isnan(data(rownum,12))
    data = data./data(rownum,14);
elseif data(rownum,12) >= data(rownum,14) || isnan(data(rownum,14))
    data = data./data(rownum,12);
end
%%

data(isnan(data))= 0;
%assign events to different variables
eup_ml_td = data(rownum,6);
eup_ml_lo = data(rownum,10);
eup_ml_td2 = data(rownum,12);

cl_ml_td = data(rownum,8);
cl_ml_lo = data(rownum,11);
cl_ml_td2 = data(rownum,14);


eup_mr_lo1 = data (rownum,16);
eup_mr_td = data (rownum,18);
eup_mr_lo2 = data (rownum,22);
eup_mr_td2 = data (rownum,24);

cl_mr_lo1 = data (rownum,17);
cl_mr_td = data(rownum,20);
cl_mr_lo2 = data(rownum,23);
cl_mr_td2 = data(rownum,26);

eup_fl_lo1 = data(rownum,28);
eup_fl_td = data(rownum,30);
eup_fl_lo2 = data(rownum,34);
eup_fl_td2 = data(rownum,36);

cl_fl_lo1 = data(rownum,29);
cl_fl_td = data(rownum,32);
cl_fl_lo2 = data(rownum,35);
cl_fl_td2 = data(rownum,38);

eup_fr_lo1 = data(rownum,40);
eup_fr_td = data(rownum,42);
eup_fr_lo2 = data(rownum,46);
eup_fr_td2 = data(rownum,48);

cl_fr_lo1 = data(rownum,41); 
cl_fr_td = data(rownum,44);
cl_fr_lo2 = data(rownum,47);
cl_fr_td2 = data(rownum,50);

eup_bl_lo1 = data(rownum,52);
eup_bl_td = data(rownum,54);
eup_bl_lo2 = data(rownum,58);
eup_bl_td2 = data(rownum,60);

cl_bl_lo1 = data(rownum,53);
cl_bl_td = data(rownum,56);
cl_bl_lo2 = data(rownum,59);
cl_bl_td2 = data(rownum,62);

eup_br_lo1 = data(rownum,64);
eup_br_td = data(rownum,66);
eup_br_lo2 = data(rownum,70);
eup_br_td2 = data(rownum,72);

cl_br_lo1 = data(rownum,64);
cl_br_td = data(rownum,68);
cl_br_lo2 = data(rownum,71);
cl_br_td2 = data(rownum,74);

%Define Claw and Euplantuale stride differences
%%middle left leg
ml_stance1_diff = eup_ml_td - cl_ml_td;
ml_stance2_diff = eup_ml_lo - cl_ml_lo;

%ratio
ml_eup_stance = eup_ml_lo - eup_ml_td;
ml_cl_stance = cl_ml_lo - cl_ml_td;

ml_stance_ratio = ml_cl_stance/ml_eup_stance;

%%middle right 
mr_stance1_diff = (eup_mr_lo1- cl_mr_lo1);
mr_stance2_diff = (eup_mr_td - cl_mr_td);

if eup_mr_lo2 <= 1 && cl_mr_lo2 <= 1 
    mr_stance3_diff = eup_mr_lo2 - cl_mr_lo2;
elseif eup_mr_lo2 > 1 || cl_mr_lo2 > 1 
    mr_stance3_diff = 0;
elseif eup_mr_lo2 == 0 && cl_mr_lo2 < 1 
    mr_stance3_diff = -cl_mr_lo2;
elseif eup_mr_lo2 < 1 && cl_mr_lo2 == 0
    mr_stance3_diff = eup_mr_lo2;
end

if eup_mr_td2 <= 1 && cl_mr_td2 <= 1 
    mr_stance4_diff = eup_mr_td2 - cl_mr_td2;
elseif eup_mr_td2 > 1 || cl_mr_td2 > 1 
    mr_stance4_diff = 0;
elseif eup_mr_td2 == 0 && cl_mr_td2 < 1 
    mr_stance4_diff = -cl_mr_td2;
elseif eup_mr_td2 < 1 && cl_mr_td2 == 0
    mr_stance4_diff = eup_mr_td2;
end

%ratio
if eup_mr_td2 == 0 && eup_mr_td == 0 && eup_mr_lo2 == 0 
    mr_eup_stance = 0;
    elseif eup_mr_td2 > 1 && eup_mr_lo2 > 1 && eup_mr_td > 1
    mr_eup_stance = eup_mr_lo1;
elseif eup_mr_td2 == 0 && eup_mr_lo2 > 1 && eup_mr_td <= 1
    mr_eup_stance = eup_mr_lo1 + (1 - eup_mr_td);
elseif eup_mr_td2 == 0 && eup_mr_lo2 > 1 && eup_mr_td > 1
    mr_eup_stance = eup_mr_lo1;
elseif eup_mr_td2 == 0 && eup_mr_lo2 <= 1 && eup_mr_td <= 1
    mr_eup_stance = eup_mr_lo1 + (eup_mr_lo2 - eup_mr_td);
elseif 0 < eup_mr_td2 <= 1 && 0 < eup_mr_lo2 <= 1 && 0 < eup_mr_td <= 1
    mr_eup_stance = eup_mr_lo1 + (eup_mr_lo2 - eup_mr_td) + (1 - eup_mr_td2);
elseif eup_mr_td2 > 1 || eup_mr_td2 == 0 && eup_mr_lo2 <= 1 && eup_mr_td <= 1
    mr_eup_stance = eup_mr_lo1 + (eup_mr_lo2 - eup_mr_td);

elseif eup_mr_td2 > 1 && eup_mr_lo2 > 1 && eup_mr_td <= 1
    mr_eup_stance = eup_mr_lo1 + (1 - eup_mr_td);
end
 
 
if cl_mr_td2 == 0 && cl_mr_td == 0 && cl_mr_lo2 == 0 
    mr_cl_stance = 0;
    elseif cl_mr_td2 > 1 && cl_mr_lo2 > 1 && cl_mr_td > 1
    mr_cl_stance = cl_mr_lo1;
elseif cl_mr_td2 == 0 && cl_mr_lo2 > 1 && cl_mr_td <= 1
    mr_cl_stance = cl_mr_lo1 + (1 - cl_mr_td);
elseif cl_mr_td2 == 0 && cl_mr_lo2 > 1 && cl_mr_td > 1
    mr_cl_stance = cl_mr_lo1;
elseif cl_mr_td2 == 0 && cl_mr_lo2 <= 1 && cl_mr_td <= 1
    mr_cl_stance = cl_mr_lo1 + (cl_mr_lo2 - cl_mr_td);
elseif 0 < cl_mr_td2 <= 1 && 0 < cl_mr_lo2 <= 1 && 0 < cl_mr_td <= 1
    mr_cl_stance = cl_mr_lo1 + (cl_mr_lo2 - cl_mr_td) + (1 - cl_mr_td2);
elseif cl_mr_td2 > 1 || cl_mr_td2 == 0 && cl_mr_lo2 <= 1 && cl_mr_td <= 1
    mr_cl_stance = cl_mr_lo1 + (cl_mr_lo2 - cl_mr_td);

elseif cl_mr_td2 > 1 && cl_mr_lo2 > 1 && cl_mr_td <= 1
    mr_cl_stance = cl_mr_lo1 + (1 - cl_mr_td);
end

mr_stance_ratio = mr_cl_stance/mr_eup_stance;

%%Front left
 
fl_stance1_diff = (eup_fl_lo1- cl_fl_lo1);
fl_stance2_diff = (eup_fl_td - cl_fl_td);

if eup_fl_lo2 <= 1 && cl_fl_lo2 <= 1 
    fl_stance3_diff = eup_fl_lo2 - cl_fl_lo2;
elseif eup_fl_lo2 > 1 || cl_fl_lo2 > 1 
    fl_stance3_diff = 0;
elseif eup_fl_lo2 == 0 && cl_fl_lo2 < 1 
    fl_stance3_diff = -cl_fl_lo2;
elseif eup_fl_lo2 < 1 && cl_fl_lo2 == 0
    fl_stance3_diff = eup_fl_lo2;
end

if eup_fl_td2 <= 1 && cl_fl_td2 <= 1 
    fl_stance4_diff = eup_fl_td2 - cl_fl_td2;
elseif eup_fl_td2 > 1 || cl_fl_td2 > 1 
    fl_stance4_diff = 0;
elseif eup_fl_td2 == 0 && cl_fl_td2 < 1 
    fl_stance4_diff = -cl_fl_td2;
elseif eup_fl_td2 < 1 && cl_fl_td2 == 0
    fl_stance4_diff = eup_fl_td2;
end

%Ratio
if eup_fl_td2 == 0 && eup_fl_td == 0 && eup_fl_lo2 == 0 
    fl_eup_stance = 0;
elseif eup_fl_td2 > 1 && eup_fl_lo2 > 1 && eup_fl_td > 1
    fl_eup_stance = eup_fl_lo1;
    elseif eup_fl_td2 > 1 && eup_fl_lo2 > 1 && eup_fl_td <= 1
    fl_eup_stance = eup_fl_lo1 + (1 - eup_fl_td);
elseif eup_fl_td2 == 0 && eup_fl_lo2 > 1 && eup_fl_td <= 1
    fl_eup_stance = eup_fl_lo1 + (1 - eup_fl_td);
elseif eup_fl_td2 == 0 && eup_fl_lo2 > 1 && eup_fl_td > 1
    fl_eup_stance = eup_fl_lo1;
elseif eup_fl_td2 == 0 && eup_fl_lo2 <= 1 && eup_fl_td <= 1
    fl_eup_stance = eup_fl_lo1 + (eup_fl_lo2 - eup_fl_td);
elseif 0 < eup_fl_td2 <= 1 && 0 < eup_fl_lo2 <= 1 && 0 < eup_fl_td <= 1
    fl_eup_stance = eup_fl_lo1 + (eup_fl_lo2 - eup_fl_td) + (1 - eup_fl_td2);
elseif eup_fl_td2 > 1 && eup_fl_lo2 <= 1 && eup_fl_td <= 1
    fl_eup_stance = eup_fl_lo1 + (eup_fl_lo2 - eup_fl_td);

end


if cl_fl_td2 == 0 && cl_fl_td == 0 && cl_fl_lo2 == 0 
    fl_cl_stance = 0;
    elseif cl_fl_td2 > 1 && cl_fl_lo2 > 1 && cl_fl_td > 1
    fl_cl_stance = cl_fl_lo1;
elseif cl_fl_td2 == 0 && cl_fl_lo2 > 1 && cl_fl_td <= 1
    fl_cl_stance = cl_fl_lo1 + (1 - cl_fl_td);
elseif cl_fl_td2 == 0 && cl_fl_lo2 > 1 && cl_fl_td > 1
    fl_cl_stance = cl_fl_lo1;
elseif cl_fl_td2 == 0 && cl_fl_lo2 <= 1 && cl_fl_td <= 1
    fl_cl_stance = cl_fl_lo1 + (cl_fl_lo2 - cl_fl_td);
elseif 0 < cl_fl_td2 <= 1 && 0 < cl_fl_lo2 <= 1 && 0 < cl_fl_td <= 1
    fl_cl_stance = cl_fl_lo1 + (cl_fl_lo2 - cl_fl_td) + (1 - cl_fl_td2);
elseif cl_fl_td2 > 1 || cl_fl_td2 == 0 && cl_fl_lo2 <= 1 && cl_fl_td <= 1
    fl_cl_stance = cl_fl_lo1 + (cl_fl_lo2 - cl_fl_td);

elseif cl_fl_td2 > 1 && cl_fl_lo2 > 1 && cl_fl_td <= 1
    fl_cl_stance = cl_fl_lo1 + (1 - cl_fl_td);
end

fl_stance_ratio = fl_cl_stance/fl_eup_stance;


%%front right

fr_stance1_diff = (eup_fr_lo1- cl_fr_lo1);
fr_stance2_diff = (eup_fr_td - cl_fr_td);

if eup_fr_lo2 <= 1 && cl_fr_lo2 <= 1 
    fr_stance3_diff = eup_fr_lo2 - cl_fr_lo2;
elseif eup_fr_lo2 > 1 || cl_fr_lo2 > 1 
    fr_stance3_diff = 0;
elseif eup_fr_lo2 == 0 && cl_fr_lo2 < 1 
    fr_stance3_diff = -cl_fr_lo2;
elseif eup_fr_lo2 < 1 && cl_fr_lo2 == 0
    fr_stance3_diff = eup_fr_lo2;
end

if eup_fr_td2 <= 1 && cl_fr_td2 <= 1 
    fr_stance4_diff = eup_fr_td2 - cl_fr_td2;
elseif eup_fr_td2 > 1 || cl_fr_td2 > 1 
    fr_stance4_diff = 0;
elseif eup_fr_td2 == 0 && cl_fr_td2 < 1 
    fr_stance4_diff = -cl_fr_td2;
elseif eup_fr_td2 < 1 && cl_fr_td2 == 0
    fr_stance4_diff = eup_fr_td2;
end

%Ratio
if eup_fr_td2 == 0 && eup_fr_td == 0 && eup_fr_lo2 == 0 
    fr_eup_stance = 0;
    elseif eup_fr_td2 > 1 && eup_fr_lo2 > 1 && eup_fr_td > 1
    fr_eup_stance = eup_fr_lo1;
elseif eup_fr_td2 == 0 && eup_fr_lo2 > 1 && eup_fr_td <= 1
    fr_eup_stance = eup_fr_lo1 + (1 - eup_fr_td);
elseif eup_fr_td2 == 0 && eup_fr_lo2 > 1 && eup_fr_td > 1
    fr_eup_stance = eup_fr_lo1;
elseif eup_fr_td2 == 0 && eup_fr_lo2 <= 1 && eup_fr_td <= 1
    fr_eup_stance = eup_fr_lo1 + (eup_fr_lo2 - eup_fr_td);
elseif 0 < eup_fr_td2 <= 1 && 0 < eup_fr_lo2 <= 1 && 0 < eup_fr_td <= 1
    fr_eup_stance = eup_fr_lo1 + (eup_fr_lo2 - eup_fr_td) + (1 - eup_fr_td2);
elseif eup_fr_td2 > 1 || eup_fr_td2 == 0 && eup_fr_lo2 <= 1 && eup_fr_td <= 1
    fr_eup_stance = eup_fr_lo1 + (eup_fr_lo2 - eup_fr_td);

elseif eup_fr_td2 > 1 && eup_fr_lo2 > 1 && eup_fr_td <= 1
    fr_eup_stance = eup_fr_lo1 + (1 - eup_fr_td);
end
 
 
if cl_fr_td2 == 0 && cl_fr_td == 0 && cl_fr_lo2 == 0 
    fr_cl_stance = 0;
    elseif cl_fr_td2 > 1 && cl_fr_lo2 > 1 && cl_fr_td > 1
    fr_cl_stance = cl_fr_lo1;
elseif cl_fr_td2 == 0 && cl_fr_lo2 > 1 && cl_fr_td <= 1
    fr_cl_stance = cl_fr_lo1 + (1 - cl_fr_td);
elseif cl_fr_td2 == 0 && cl_fr_lo2 > 1 && cl_fr_td > 1
    fr_cl_stance = cl_fr_lo1;
elseif cl_fr_td2 == 0 && cl_fr_lo2 <= 1 && cl_fr_td <= 1
    fr_cl_stance = cl_fr_lo1 + (cl_fr_lo2 - cl_fr_td);
elseif 0 < cl_fr_td2 <= 1 && 0 < cl_fr_lo2 <= 1 && 0 < cl_fr_td <= 1
    fr_cl_stance = cl_fr_lo1 + (cl_fr_lo2 - cl_fr_td) + (1 - cl_fr_td2);
elseif cl_fr_td2 > 1 || cl_fr_td2 == 0 && cl_fr_lo2 <= 1 && cl_fr_td <= 1
    fr_cl_stance = cl_fr_lo1 + (cl_fr_lo2 - cl_fr_td);

elseif cl_fr_td2 > 1 && cl_fr_lo2 > 1 && cl_fr_td <= 1
    fr_cl_stance = cl_fr_lo1 + (1 - cl_fr_td);
end


fr_stance_ratio = fr_cl_stance/fr_eup_stance;

 

%%back left

bl_stance1_diff = (eup_bl_lo1- cl_bl_lo1);
bl_stance2_diff = (eup_bl_td - cl_bl_td);

if eup_bl_lo2 <= 1 && cl_bl_lo2 <= 1 
    bl_stance3_diff = eup_bl_lo2 - cl_bl_lo2;
elseif eup_bl_lo2 > 1 || cl_bl_lo2 > 1 
    bl_stance3_diff = 0;
elseif eup_bl_lo2 == 0 && cl_bl_lo2 < 1 
    br_stance3_diff = -cl_bl_td2;
elseif eup_bl_lo2 < 1 && cl_bl_lo2 == 0
    br_stance3_diff = eup_bl_lo2;
end

if eup_bl_td2 <= 1 && cl_bl_td2 <= 1 
    bl_stance4_diff = eup_bl_td2 - cl_bl_td2;
elseif eup_bl_td2 > 1 || cl_bl_td2 > 1 
    bl_stance4_diff = 0;
elseif eup_bl_td2 == 0 && cl_bl_td2 < 1 
    bl_stance4_diff = -cl_bl_td2;
elseif eup_bl_td2 < 1 && cl_bl_td2 == 0
    bl_stance4_diff = eup_bl_td2;
end

%Ratio

if eup_bl_td2 == 0 && eup_bl_td == 0 && eup_bl_lo2 == 0 
    bl_eup_stance = 0;
    elseif eup_bl_td2 > 1 && eup_bl_lo2 > 1 && eup_bl_td > 1
    bl_eup_stance = eup_bl_lo1;
elseif eup_bl_td2 == 0 && eup_bl_lo2 > 1 && eup_bl_td <= 1
    bl_eup_stance = eup_bl_lo1 + (1 - eup_bl_td);
elseif eup_bl_td2 == 0 && eup_bl_lo2 > 1 && eup_bl_td > 1
    bl_eup_stance = eup_bl_lo1;
elseif eup_bl_td2 == 0 && eup_bl_lo2 <= 1 && eup_bl_td <= 1
    bl_eup_stance = eup_bl_lo1 + (eup_bl_lo2 - eup_bl_td);
elseif 0 < eup_bl_td2 <= 1 && 0 < eup_bl_lo2 <= 1 && 0 < eup_bl_td <= 1
    bl_eup_stance = eup_bl_lo1 + (eup_bl_lo2 - eup_bl_td) + (1 - eup_bl_td2);
elseif eup_bl_td2 > 1 || eup_bl_td2 == 0 && eup_bl_lo2 <= 1 && eup_bl_td <= 1
    bl_eup_stance = eup_bl_lo1 + (eup_bl_lo2 - eup_bl_td);

elseif eup_bl_td2 > 1 && eup_bl_lo2 > 1 && eup_bl_td <= 1
    bl_eup_stance = eup_bl_lo1 + (1 - eup_bl_td);
end
 
 
if cl_bl_td2 == 0 && cl_bl_td == 0 && cl_bl_lo2 == 0 
    bl_cl_stance = 0;
    elseif cl_bl_td2 > 1 && cl_bl_lo2 > 1 && cl_bl_td > 1
    bl_cl_stance = cl_bl_lo1;
elseif cl_bl_td2 == 0 && cl_bl_lo2 > 1 && cl_bl_td <= 1
    bl_cl_stance = cl_bl_lo1 + (1 - cl_bl_td);
elseif cl_bl_td2 == 0 && cl_bl_lo2 > 1 && cl_bl_td > 1
    bl_cl_stance = cl_bl_lo1;
elseif cl_bl_td2 == 0 && cl_bl_lo2 <= 1 && cl_bl_td <= 1
    bl_cl_stance = cl_bl_lo1 + (cl_bl_lo2 - cl_bl_td);
elseif 0 < cl_bl_td2 <= 1 && 0 < cl_bl_lo2 <= 1 && 0 < cl_bl_td <= 1
    bl_cl_stance = cl_bl_lo1 + (cl_bl_lo2 - cl_bl_td) + (1 - cl_bl_td2);
elseif cl_bl_td2 > 1 || cl_bl_td2 == 0 && cl_bl_lo2 <= 1 && cl_bl_td <= 1
    bl_cl_stance = cl_bl_lo1 + (cl_bl_lo2 - cl_bl_td);

elseif cl_bl_td2 > 1 && cl_bl_lo2 > 1 && cl_bl_td <= 1
    bl_cl_stance = cl_bl_lo1 + (1 - cl_bl_td);
end
bl_stance_ratio = bl_cl_stance/bl_eup_stance;


%%back right

br_stance1_diff = (eup_br_lo1- cl_br_lo1);
br_stance2_diff = (eup_br_td - cl_br_td);

if eup_br_lo2 <= 1 && cl_br_lo2 <= 1 
    br_stance3_diff = eup_br_lo2 - cl_br_lo2;
elseif eup_br_lo2 > 1 || cl_br_lo2 > 1 
    br_stance3_diff = 0;
elseif eup_br_lo2 == 0 && cl_br_lo2 < 1 
    br_stance3_diff = -eup_br_lo2;
elseif eup_br_lo2 < 1 && cl_br_lo2 == 0
    br_stance3_diff = eup_br_lo2;
end

if eup_br_td2 <= 1 && cl_br_td2 <= 1 
    br_stance4_diff = eup_br_td2 - cl_br_td2;
elseif eup_br_td2 > 1 || cl_br_td2 > 1 
    br_stance4_diff = 0;
elseif eup_br_td2 == 0 && cl_br_td2 < 1 
    br_stance4_diff = -cl_br_td2;
elseif eup_br_td2 < 1 && cl_br_td2 == 0
    br_stance4_diff = eup_br_td2;
end

%Ratio
if eup_br_td2 == 0 && eup_br_td == 0 && eup_br_lo2 == 0 
    br_eup_stance = 0;
elseif eup_br_td2 > 1 && eup_br_lo2 > 1 && eup_br_td > 1
    br_eup_stance = eup_br_lo1;
elseif eup_br_td2 == 0 && eup_br_lo2 > 1 && eup_br_td <= 1
    br_eup_stance = eup_br_lo1 + (1 - eup_br_td);
elseif eup_br_td2 == 0 && eup_br_lo2 > 1 && eup_br_td > 1
    br_eup_stance = eup_br_lo1;
elseif eup_br_td2 == 0 && eup_br_lo2 <= 1 && eup_br_td <= 1
    br_eup_stance = eup_br_lo1 + (eup_br_lo2 - eup_br_td);
elseif 0 < eup_br_td2 <= 1 && 0 < eup_br_lo2 <= 1 && 0 < eup_br_td <= 1
    br_eup_stance = eup_br_lo1 + (eup_br_lo2 - eup_br_td) + (1 - eup_br_td2);
elseif eup_br_td2 > 1 && eup_br_lo2 <= 1 && eup_br_td <= 1
    br_eup_stance = eup_br_lo1 + (eup_br_lo2 - eup_br_td);
elseif eup_br_td2 > 1 && eup_br_lo2 > 1 && eup_br_td <= 1
    br_eup_stance = eup_br_lo1 + (1 - eup_br_td);
end
 
 
if cl_br_td2 == 0 && cl_br_td == 0 && cl_br_lo2 == 0 
    br_cl_stance = 0;
    elseif cl_br_td2 > 1 && cl_br_lo2 > 1 && cl_br_td > 1
    br_cl_stance = cl_br_lo1;
elseif cl_br_td2 == 0 && cl_br_lo2 > 1 && cl_br_td <= 1
    br_cl_stance = cl_br_lo1 + (1 - cl_br_td);
elseif cl_br_td2 == 0 && cl_br_lo2 > 1 && cl_br_td > 1
    br_cl_stance = cl_br_lo1;
elseif cl_br_td2 == 0 && cl_br_lo2 <= 1 && cl_br_td <= 1
    br_cl_stance = cl_br_lo1 + (cl_br_lo2 - cl_br_td);
elseif 0 < cl_br_td2 <= 1 && 0 < cl_br_lo2 <= 1 && 0 < cl_br_td <= 1
    br_cl_stance = cl_br_lo1 + (cl_br_lo2 - cl_br_td) + (1 - cl_br_td2);
elseif cl_br_td2 > 1 || cl_br_td2 == 0 && cl_br_lo2 <= 1 && cl_br_td <= 1
    br_cl_stance = cl_br_lo1 + (cl_br_lo2 - cl_br_td);

elseif cl_br_td2 > 1 && cl_br_lo2 > 1 && cl_br_td <= 1
    br_cl_stance = cl_br_lo1 + (1 - cl_br_td);
end

br_stance_ratio = br_cl_stance/br_eup_stance;
%%
%%Make a table with different values
Data_Points = [ml_stance1_diff ml_stance2_diff ml_cl_stance ml_eup_stance  ml_stance_ratio mr_stance1_diff mr_stance2_diff mr_stance3_diff mr_stance4_diff mr_eup_stance mr_cl_stance mr_stance_ratio fl_stance1_diff fl_stance2_diff fl_stance3_diff fl_stance4_diff fl_eup_stance fl_cl_stance fl_stance_ratio fr_stance1_diff fr_stance2_diff fr_stance3_diff fr_stance4_diff fr_eup_stance fr_cl_stance fr_stance_ratio bl_stance1_diff bl_stance2_diff bl_stance3_diff bl_stance4_diff br_eup_stance br_cl_stance bl_stance_ratio br_stance1_diff br_stance2_diff br_stance3_diff br_stance4_diff br_eup_stance br_cl_stance br_stance_ratio];



%xlswrite('Difference_Ratio_Eup_to_claw.xls', Data_Points, 'Sheet1', 'D2:D57');
