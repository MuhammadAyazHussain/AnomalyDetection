clear 
clc

% analyzing data bar plots and other
a=xlsread('tengle_man_single_store_aug.csv');
data_x=a(:,2)
data_aug= a(:,1);
% data_collected= data_aug(1:7)
% jj=20;
% for i=1:1:29
%     data_collected=[data_collected;data_aug(jj:(jj+11))];
%     jj=jj+24;
% end

%% this part of code will isolate the data of working days and off days
data_off_days=[];
hrs_off_days=[];


data_working_days=[];
hrs_working_days=[];

data_tag=a(:,3);
for jj=1:744;
    if data_tag(jj)==0;
        data_off_days=[data_off_days,data_aug(jj)];
        hrs_off_days=[hrs_off_days,data_x(jj)];
        
    else
        data_working_days=[data_working_days,data_aug(jj)];
        hrs_working_days=[hrs_working_days,data_x(jj)];
    end
end

        
        
        
        


    
    
     
        
    







