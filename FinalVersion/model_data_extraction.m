function [mean_std_selected_data,number_of_samples] = model_data_extraction(month,store_number,day_tag,hour,StoresModels)



test_month=month;

month_cell=StoresModels.Months;
month_list=cell2mat(StoresModels.Months);
test_store_row=find(month_list==test_month);



test_store_number=store_number;
store_numbers_cells = StoresModels.StoreNumber;
store_numbers_matrix=cell2mat(StoresModels.StoreNumber);
store_numbers_array=store_numbers_matrix(1,:);

test_store_column=find(store_numbers_array==test_store_number);


if day_tag==1
    selected_data = StoresModels.DataWorkingDays{test_store_row,test_store_column};
    number_of_samples=length(selected_data(:,1));
    
elseif day_tag==0
    selected_data = StoresModels.DataOffDays{test_store_row,test_store_column};
    number_of_samples=length(selected_data(:,1));
    
end

working_hour=hour;

mean_std_selected_data=selected_data(working_hour+1,:);
end













