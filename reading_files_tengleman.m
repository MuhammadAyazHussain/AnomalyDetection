% tengleman_readfile, for 15 min
%data_analysis

clear 
clc



read_tengleman= xlsread('Lastgang_alle_Maerkte_ab201508_AVG_Stunde.csv');
store_id_numbers=read_tengleman(:,1);  % list of all stores
energy_consumptions=read_tengleman(:,2); %list of repective energy_consumption
%%
specefic_store_number = [];  
index_specefic_store_number=[];
%%
specefic_store_energy_consumption = [];

%% calclate the total number of stores
store_init = store_id_numbers(1)
store_no=0;
i=2;

while store_no ~= store_init
    
    store_no=store_id_numbers(i);
    i=i+1;
end
total_stores=i-2;
    
%% feature = energy_consumption ; calculation of energy consumption of every store
% separately

stores_ids_list=store_id_numbers(1:total_stores);

for m=1:1:2%length(stores_ids_list);
    selected_store=stores_ids_list(m);
    % Every store is selected one by one 
   
    
    for i=1:1:length(store_id_numbers);
        % For every store, it is required to itterate through complete list
        % of store_numbers and energy_consumptions
        if store_id_numbers(i)==selected_store;
            % If the selected store_number(i) is equal to seletced store
            % then i want to store the index of that store
            
            specefic_store_number=[specefic_store_number,store_id_numbers(i)];
            index_specefic_store_number=[index_specefic_store_number,i];
            
            % and also  want to calculate the energy consumption
            
            specefic_store_energy_consumption=[specefic_store_energy_consumption,energy_consumptions(i)];
        end
    end
end


  energy_consumption_all_stores=reshape(specefic_store_energy_consumption , 4620,2)

%%apending time of the day
% second feature
  
  x=0:1:23; % hrs per day with sampling rate is one hours
  y=[];
  for i=1:1:193; % there would be 193 days of total
      y=[y,x];
  end
  hrs=y(1:4620);
  hrs=hrs'
  
%% now apply tag to every day weather it is a working day or not, for now
%  i have treated mon:sat as working day and suday as off day
% third feature
% for now i am considering only one month
day_tags=[1,0,1,1,1,1,1];
days=[]
for i=1:1:28 % i am considering five weeks
    for j=1:1:7 % 7 days per week
        if day_tags(j)== 1 %% check it is working day or not working day
            for k=1:1:24
                days=[days,1];
            end
        else           % if it is sunday do the following
            for k=1:24
                        days=[days,0];
            end
        end
    end
end
days=days(1:4620);
days=days';


%% Now I have collected three fetaures, Now I want to integrate these features
% and want to analyse these features
% data=[];
% energy_feature = energy_consumption_all_stores(:,2); % energy consumpption
% energy_feature = energy_feature(1:744,1); % i am intersted in one month now
% 
% hrs_feature=hrs(1,1:744); % 2nd feature which is also very important
% hrs_feature=hrs_feature'
% 
% days_feature=days(1,1:744); % Third feature
% days_feature=days_feature'; 
% 
% features=[energy_feature,hrs_feature,days_feature]; % integrating all the fetaures
% 




 
    


                    
    



  
  
  
  
  
  
  
  
  
  
  
  
  
%% cehck the if distance is same
% for j =1:1:length(index_specefic_store_number)-1;
%     a=index_specefic_store_number(j+1) - index_specefic_store_number(j)
%     if a==227; 
%     else
%         fprintf('wrong')
%     end
% end









