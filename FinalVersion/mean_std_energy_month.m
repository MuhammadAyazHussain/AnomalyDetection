function[mean_energy,std_energy] = mean_std_energy_month(data_one_month)
hours=unique(data_one_month(:,2));
hours_per_day = length(hours);
mean_energy=zeros(hours_per_day,1);
std_energy=zeros(hours_per_day,1);
for ii=1:hours_per_day
    indices_data_hour_ii = find(data_one_month(:,2)==ii-1);
    data_hour_ii =data_one_month(indices_data_hour_ii,4);
    [major_fence,minor_fence]=outlier_detection_algo(data_hour_ii);
    minor_fence_upper=minor_fence(1);
    minor_fence_lower=minor_fence(2);
    data_outliers_hour_ii=data_hour_ii>=minor_fence_lower & data_hour_ii<=minor_fence_upper;
    data_hour_ii=data_hour_ii(data_outliers_hour_ii==1);
    mean_hours_ii=mean(data_hour_ii);
    std_hours_ii=std(data_hour_ii);
    if std_hours_ii ==0
        std_hours_ii=0.1;%%%%%%
    end
    
    mean_energy(ii)=mean_hours_ii;
    std_energy(ii)=std_hours_ii;
    
end
end



function[major_fence,minor_fence]=outlier_detection_algo(data_array)
sorted_data=sort(data_array);

q2=median(sorted_data);

lower_quartile_data_indices= find(sorted_data<q2);
lower_quartile_data=sorted_data(lower_quartile_data_indices);
if isempty(lower_quartile_data)
    q1=q2-1;
else
    q1=median(lower_quartile_data);
end


upper_quartile_data_indices= find(sorted_data>q2);
upper_quartile_data=sorted_data(upper_quartile_data_indices);
if isempty(upper_quartile_data)
    q3=q2+1;
else
    q3=median(upper_quartile_data);

end


inter_quartile_range = q3-q1;
%outliers minors range
inner_fences_upper=inter_quartile_range*1.5+q3;
inner_fences_lower=q1-inter_quartile_range*1.5;
%outlier manjor range
outer_fences_upper=inter_quartile_range*3+q3;
outer_fences_lower=q1-inter_quartile_range*3;

major_fence=[outer_fences_upper,outer_fences_lower];
minor_fence=[inner_fences_upper,inner_fences_lower];
end



