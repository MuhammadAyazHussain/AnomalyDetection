function status_input = test__input(test_data,beta,StoresModels)
%test_data=input('Enter the Test Input');

test_year=test_data(1);
test_time=test_data(2);
test_store_id=test_data(3);
test_energy_consumption=test_data(4);
test_month=test_data(5);
test_day_tag=test_data(6);
[mean_std,number_of_samples]=model_data_extraction(test_month,test_store_id,test_day_tag,test_time,StoresModels);

mean_test_input=mean_std(1);
std_test_input=mean_std(2);

lower_limit= -beta*std_test_input; % beta:learning parameter
upper_limit=beta*std_test_input;

if test_energy_consumption>=lower_limit && test_energy_consumption<upper_limit
    a='Given test inputs is not Anamoly';
    disp(a);
    status_input=0;
   
    
else
    b='Given test inputs is an Anamoly';
    disp(b);
    status_input=1;
end

end

function p_val=t_test(test_energy_consumption,mean_test_input,std_test_input,number_of_samples)
 t = (test_energy_consumption - mean_test_input)/(std_test_input/sqrt(number_of_samples));
 p_val = 1-tcdf(t,number_samples-1);
end













