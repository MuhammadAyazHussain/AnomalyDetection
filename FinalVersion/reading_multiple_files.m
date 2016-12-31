%data_stores=xlsread('C:\Users\engrs\Desktop\matlab\tengleman\store15.xlsx');
d=dir('*.xlsx');
for i=1:length(d)
  m{i}=xlsread(d(i).name);   % put into cell array
end
toc
tic
data_stores=[m{1};m{2}];