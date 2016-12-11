clear
clc
%% anomaly detection per month(Tengleman)
%First reading the file or month
% As an examle i am reading the file for the month of august
data_of_month=xlsread('C:\Users\KlaesLab03\Desktop\OneDrive for Business\matlab_script\tengle_man\tengle_man_per_month\tengle_man_single_store_aug.csv');
% first column contains the value of energy consumption
% 2nd column represent the corresponding hours of the day
% 3rd column is a tag representing weather the coreesponding values hour is of
% woking day or off day
% sunday: is off day and refered as 0
% remaining six days are considerd as working days and refered as 1


%%Algorithm(Training)
% calculate the indexes of each hour of working day
%

working_days_per_hrs_indexes=[];
energy_consumption_working_days_per_hrs=[]
for ii=0:1:23
    indexes_hour_ii=find(data_of_month(:,2)==ii & data_of_month(:,3)==1);
    working_days_per_hrs_indexes=[working_days_per_hrs_indexes,indexes_hour_ii];
    energy_consumption_working_days_per_hrs=[energy_consumption_working_days_per_hrs,data_of_month(indexes_hour_ii,1)];
end


% Now calculate the indexes of each hour of off day

off_days_per_hrs_indexes=[];
energy_consumption_off_days_per_hrs=[];


for jj=0:1:23;
    indexes_hour_jj=find(data_of_month(:,2)==jj & data_of_month(:,3)==0);
    off_days_per_hrs_indexes=[off_days_per_hrs_indexes,indexes_hour_jj];
    energy_consumption_off_days_per_hrs=[energy_consumption_off_days_per_hrs,data_of_month(indexes_hour_jj,1)]; 
end


%% Now calculate the mean of energy consumption of each hour again first for working days
% and calculate the standard deviation
mean_energy_working_day_list = []
standard_deviation_energy_working_day_list = [];

for kk=1:1:24;
    energy_kk=energy_consumption_working_days_per_hrs(:,kk);
    mean_energy_kk=mean(energy_kk);
    standard_deviation_kk =std(energy_kk);
    mean_energy_working_day_list=[mean_energy_working_day_list,mean_energy_kk];
    standard_deviation_energy_working_day_list=[standard_deviation_energy_working_day_list,standard_deviation_kk];
end

% Now for the off day
mean_energy_off_day_list =[];
standard_deviation_energy_off_day_list=[];

for mm =1:1:24
    energy_mm = energy_consumption_off_days_per_hrs(:,kk);
    mean_energy_mm=mean(energy_mm);
    standard_deviation_mm =std(energy_mm);
    mean_energy_off_day_list=[mean_energy_off_day_list,mean_energy_mm];
    standard_deviation_energy_off_day_list=[standard_deviation_energy_off_day_list,standard_deviation_mm];     
end


%% test data required
test_input=input('Enter the test input any from the month of august[e_c,time,1 or 0 ]=')

if test_input(3)==1
    % Now extract the information of hour out given input
    corresponding_hour=test_input(2);
    mean_value = mean_energy_working_day_list(corresponding_hour);
    standard_deviation_value=standard_deviation_energy_working_day_list(corresponding_hour);
    if test_input(1)<=(mean_value+1*standard_deviation_value)
        disp('Not anamoly')
    else 
        disp('Anamoly')
    end
end




