% Task 1: Pairwise correlation coeﬀicients

clear all
clc

% Firts element Height, Second element Age, Third element Weight(kg)
array = importdata('Assignment1-files/Task_1/task_1.mat');

size_array = size(array);


number_rows = size_array(1, 1);

number_colums = size_array(1, 2);



% % Correlacion = +-1 for validating the formulas
% 
%  array(1, 1) = -1;
%  array(1, 2) = 1;
% 
% for i = 2:number_rows
%       j = i -1;
%        
%       array(i, 1) = array(j, 1) - 1;
%       array(i, 2) = array(j, 2) + 1 ;
% end 
% 
% %Delete until here


%  We calculate the mean of the features

sum_colum1 = 0;
sum_colum2 = 0;
sum_colum3 = 0;

for i = 1:number_rows
    
    sum_colum1 = sum_colum1 + array(i, 1);
    sum_colum2 = sum_colum2 + array(i, 2);
    sum_colum3 = sum_colum3 + array(i, 3);
    
end 

avg1 = sum_colum1 / number_rows;
avg2 = sum_colum2 / number_rows;
avg3 = sum_colum3 / number_rows;




% % Correlation of colum 1 vs 2 
% 
% %Correlation formula 1 = [Sumatory (xi-meanx)(yi-meany))] / [Sumatory((xi-meanx)^2)* Sumatory(yi-meany)^2)]1^/2
% 
% sum_top = 0;
% sum_bot1 = 0;
% sum_bot2 = 0;
% 
% for i =1:number_rows
%     
%     %Top
%     sum_top = sum_top + (array(i,1) - avg1)*(array(i,2)-avg2);
%     
%     %Bot
%     sum_bot1 = sum_bot1 + (array(i,1) - avg1)^2;
%     sum_bot2 = sum_bot2 + (array(i,2) - avg2)^2;
%     
% end 
% 
% correlation1 = sum_top/sqrt((sum_bot1 * sum_bot2));
% 
% fprintf('Value by formula 1: %d \n', correlation1);


for colum1 =1:(number_colums)
    
   colum2 = colum1 + 1;
   
    if colum2 > 3
        colum2 = 1;
    end 
    
    %Correlation formula 2 

    sum_top = 0;
    sum_bot1 = 0;
    sum_bot2 = 0;

    for i =1:number_rows

        %Top
        sum_top = sum_top + array(i,colum1) * array(i,colum2);

        %Bot
        sum_bot1 = sum_bot1 + array(i,1)^2;
        sum_bot2 = sum_bot2 + array(i,2)^2;

    end 

    a = sqrt(sum_bot1 - number_rows * avg1^2);
    b = sqrt(sum_bot2 - number_rows * avg2^2);
    
    correlation2 = [sum_top - number_rows * avg1 * avg2] /(a * b);
    
    fprintf('Correlation between column %d and column %d: %d\n', colum1, colum2, correlation2);

end



