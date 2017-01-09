function StoresModels=Anamoly_detect_norm_dist(data_stores)

stores_ids=unique(data_stores(:,3)); %Stores with ids
total_stores=length(stores_ids); %total number of Stores
months=unique(data_stores(:,5)); 
total_months=length(months);

for ii=1:total_months
    for jj=1:total_stores
        indices_month_jj=find(data_stores(:,5)==months(ii) & data_stores(:,3)==stores_ids(jj));
        selected_month=months(ii);
        selected_store=stores_ids(jj);
        data_month_jj = data_stores(indices_month_jj,:);
        
        working_days_month_jj=find(data_month_jj(:,6)==1);
        working_days_data_aug = data_month_jj(working_days_month_jj,:);
        [mean_energy_working_day,std_energy_working] = mean_std_energy_month(working_days_data_aug);
        
        
        
        off_days_month_jj=find(data_month_jj(:,6)==0);
        off_days_data_month_jj = data_month_jj(off_days_month_jj,:);
        
        [mean_energy_off_days,std_energy_off_days] = mean_std_energy_month(off_days_data_month_jj);
        
        Models.StoreNumber{ii,jj}=selected_store;
        Models.DataWorkingDays{ii,jj}=[mean_energy_working_day,std_energy_working];
        Models.DataOffDays{ii,jj}=[mean_energy_off_days,std_energy_off_days];
        Models.DataWorkingDaysComplete{ii,jj}=working_days_data_aug;
        Models.DataOffDaysComplete{ii,jj}=off_days_data_month_jj;
        
    end
    Models.Months{ii}=selected_month;
   
end
StoresModels=Models;
end






