%%Load into excel
clear
close all

FrameRate = 1000;

%% Load data from Excel Spreadsheet
% load in the spreadsheet
[filename, path] = uigetfile('*.xlsx');
data = xlsread([path filename]);

num_trial = 74;
%%
All_Data_Points = nan(num_trial, 76);
for i = 1:num_trial
    
    %subtract first lo
if data(num_trial,6) > data(num_trial,8)
    data = data - data(num_trial,8);
elseif data(num_trial,8) >= data(num_trial,6)
    data = data - data(num_trial,6);
end

%divide data by last td
if data(num_trial,14) > data(num_trial,12) || isnan(data(num_trial,12))
    data = data./data(num_trial,14);
elseif data(num_trial,12) >= data(num_trial,14) || isnan(data(num_trial,14))
    data = data./data(num_trial,12);
end
    
    
    All_Data_Points(i,:) = data;
end