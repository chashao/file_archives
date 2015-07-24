%function test_difference_generator()

clear
close all

FrameRate = 1000;

%% Load data from Excel Spreadsheet
% load in the spreadsheet
[filename, path] = uigetfile('*.xlsx');
data = xlsread([path filename]);

%%
%Assign Variables

rownum = 13;

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

%%
%Stance Differnces

%Diff btwn lo1
if eup_fl_lo1 >= 0 && cl_fl_lo1 >= 0
fl_stance1_diff = (eup_fl_lo1 - cl_fl_lo1);
else 
    fl_stance1_diff = 9999;
end

%diff btwn td
if eup_fl_td >= 0 && eup_fl_td <= 1 %td between 0 and 1
    if cl_fl_td >=0 && cl_fl_td <=1 %between 0 and 1
        fl_stance2_diff = (eup_fl_td - cl_fl_td);
    elseif cl_fl_td >1 %cl greater than 1
        fl_stance2_diff = 1 - eup_fl_td;
    else
        fl_stance2_diff = 9999;
    end
    
elseif eup_fl_td > 1
    if cl_fl_td >=0 && cl_fl_td <=1 %cl between 0 and 1
        fl_stance2_diff = cl_fl_td - 1;
    else
        fl_stance2_diff = 9999;
    end
else
    fl_stance2_diff = 9999;
end
    
 %Diff between lo2   
if eup_fl_lo2 >= 0 && eup_fl_lo2 <= 1 %lo2 between 0 and 1
    if cl_fl_lo2 >=0 && cl_fl_lo2 <=1 %between 0 and 1
        fl_stance3_diff = (eup_fl_lo2 - cl_fl_lo2);
    elseif cl_fl_lo2 >1 %cl greater than 1
        fl_stance3_diff = 1 - eup_fl_lo2;
    else
        fl_stance3_diff = 9999;
    end
    
elseif eup_fl_lo2 > 1
    if cl_fl_lo2 >=0 && cl_fl_lo2 <=1 %cl between 0 and 1
        fl_stance3_diff = cl_fl_lo2 - 1;
    else
        fl_stance3_diff = 9999;
    end
else
    fl_stance3_diff = 9999;
end

%Difference between td2
if eup_fl_td2 >= 0 && eup_fl_td2 <= 1 %td2 between 0 and 1
    if cl_fl_td2 >=0 && cl_fl_td2 <=1 %between 0 and 1
        fl_stance4_diff = (eup_fl_td2 - cl_fl_td2);
    elseif cl_fl_td2 >1 %cl greater than 1
        fl_stance4_diff = 1 - eup_fl_td2;
    else
        fl_stance4_diff = 9999;
    end
    
elseif eup_fl_td2 > 1
    if cl_fl_td2 >=0 && cl_fl_td2 <=1 %cl between 0 and 1
        fl_stance4_diff = cl_fl_td2 - 1;
    else
        fl_stance4_diff = 9999;
    end
else
    fl_stance4_diff = 9999;
end

%Stance Part 


if eup_fl_td2 > 1 %if td2 > 1
    if eup_fl_lo2 > 1 %lo2 happens after the gait event
        if eup_fl_lo1 < 0 %lo1 does not exist
            if eup_fl_td <0 %td does not exist
                fl_eup_stance = 0;
            else %td does exist
                fl_eup_stance = 1 - eup_fl_td;
            end
        else %lo1 does exist
            if eup_fl_td <0 %td1 DNE
                fl_eup_stance = eup_fl_lo1;
            else  %td1 exists
                fl_eup_stance = eup_fl_lo1 + (1 - eup_fl_td);
            end
        end
        
    elseif eup_fl_lo2 <0 %lo2 DNE
        if eup_fl_lo1 < 0 %lo1 does not exist
            if eup_fl_td <0 %td does not exist
                fl_eup_stance = 0;
            else %td does exist
                fl_eup_stance = 1 - eup_fl_td;
            end
        else %lo1 does exist
            if eup_fl_td <0 %td1 DNE
                fl_eup_stance = eup_fl_lo1;
            else  %td1 exists
                fl_eup_stance = eup_fl_lo1 + (1 - eup_fl_td);
            end
        end
    else %lo2 between 0 and 1, td2 > 1
        if eup_fl_lo1 < 0 %lo1 does not exist
            if eup_fl_td <0 %td does not exist
                fl_eup_stance = 0;
            else %td does exist
                fl_eup_stance = eup_fl_lo2 - eup_fl_td;
            end
        else %lo1 does exist
            if eup_fl_td <0 %td1 DNE
                fl_eup_stance = eup_fl_lo1;
            else  %td1 exists
                fl_eup_stance = eup_fl_lo1 + (eup_fl_lo2 - eup_fl_td);
            end
        end
    end
    %if td2 does not exist
elseif eup_fl_td2 < 0
    if eup_fl_lo2 > 1 %lo2 happens after the gait event
        if eup_fl_lo1 < 0 %lo1 does not exist
            if eup_fl_td <0 %td does not exist
                fl_eup_stance = 0;
            else %td does exist
                fl_eup_stance = 1 - eup_fl_td;
            end
        else %lo1 does exist
            if eup_fl_td <0 %td1 DNE
                fl_eup_stance = eup_fl_lo1;
            else  %td1 exists
                fl_eup_stance = eup_fl_lo1 + (1 - eup_fl_td);
            end
        end
        
    elseif eup_fl_lo2 <0 %lo2 DNE
        if eup_fl_lo1 < 0 %lo1 does not exist
            if eup_fl_td <0 %td does not exist
                fl_eup_stance = 0;
            else %td does exist
                fl_eup_stance = 1 - eup_fl_td;
            end
        else %lo1 does exist
            if eup_fl_td <0 %td1 DNE
                fl_eup_stance = eup_fl_lo1;
            else  %td1 exists
                fl_eup_stance = eup_fl_lo1 + (1 - eup_fl_td);
            end
        end
    else %lo2 between 0 and 1, td2 > 1
        if eup_fl_lo1 < 0 %lo1 does not exist
            if eup_fl_td <0 %td does not exist
                fl_eup_stance = 0;
            else %td does exist
                fl_eup_stance = eup_fl_lo2 - eup_fl_td;
            end
        else %lo1 does exist
            if eup_fl_td <0 %td1 DNE
                fl_eup_stance = eup_fl_lo1;
            else  %td1 exists
                fl_eup_stance = eup_fl_lo1 + (eup_fl_lo2 - eup_fl_td);
            end
        end
    end
    
    %if td 2 is between 0 and 1
else
    if eup_fl_lo2 > 1 %lo2 happens after the gait event, might not be necessary
        if eup_fl_lo1 < 0 %lo1 does not exist
            if eup_fl_td <0 %td does not exist
                fl_eup_stance = 0;
            else %td does exist
                fl_eup_stance = eup_fl_td2 - eup_fl_td;
            end
        else %lo1 does exist
            if eup_fl_td <0 %td1 DNE
                fl_eup_stance = eup_fl_lo1 + (1 - eup_fl_td2);
            else  %td1 exists
                fl_eup_stance = eup_fl_lo1 + (eup_fl_td2 - eup_fl_td);
            end
        end
        
    elseif eup_fl_lo2 <0 %lo2 DNE
        if eup_fl_lo1 < 0 %lo1 does not exist
            if eup_fl_td <0 %td does not exist
                fl_eup_stance = 0;
            else %td does exist
                fl_eup_stance = eup_fl_td2 - eup_fl_td;
            end
        else %lo1 does exist
            if eup_fl_td <0 %td1 DNE
                fl_eup_stance = eup_fl_lo1 + (1 - eup_fl_td2);
            else  %td1 exists
                fl_eup_stance = eup_fl_lo1 + (eup_fl_td2 - eup_fl_td);
            end
        end
    else %lo2 between 0 and 1, td2 between 0 and 1
        if eup_fl_lo1 < 0 %lo1 does not exist
            
            %td does exist
            fl_eup_stance = eup_fl_lo2 - eup_fl_td + (1 - eup_fl_td2);
            
        else %lo1 does exist
            
            %td1 exists
            fl_eup_stance = eup_fl_lo1 + (eup_fl_lo2 - eup_fl_td) + (1 - eup_fl_td2);
            
        end
    end
end

%%
%end