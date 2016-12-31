function[major_fence,minor_fence]=outlier_detection(data_array)
sorted_data=sort(data_array);

q2=median(sorted_data);

lower_quartile_data_indices= find(sorted_data<q2);
lower_quartile_data=sorted_data(lower_quartile_data_indices);
q1=median(lower_quartile_data);

upper_quartile_data_indices= find(sorted_data>q2);
upper_quartile_data=sorted_data(upper_quartile_data_indices);
q3=median(upper_quartile_data);

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







