
flag_data=exist('data_stores');
if flag_data==0
data_stores=load('data_stores');
data_stores=data_stores.data_stores ; 
StoresModels=Anamoly_detect_norm_dist(data_stores);%Produces Models for each stores
end

beta=input('Enter the hyperparamter');
test_data=input('Enter the test data in the compitable format');
flag_anamoly=test__input(test_data,beta,StoresModels);







































