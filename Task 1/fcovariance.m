function covariance = fcovanriance(array);

%Covariance functio. It calculates the covariance matrix
size_array = size(array);

number_rows = size_array(1, 1);
number_columns = size_array(1, 2);

convariance = zeros (number_columns, number_columns);

x = 0;

for j = 1:number_columns
    
    column1 = array(:,j);
    avg1 = faverage(column1);
    
    for h = 1:number_columns
        
        column2 = array(:,h);
        avg2 = faverage(column2);
        
        for i = 1:number_rows
            x = (column1(i) - avg1) * (column2(i) - avg2) + x;
            
        end
        covariance(j,h) = x /(number_rows - 1);
        
        x = 0;
    end
end

fprintf('Covariance matrix:\n');
disp(covariance);

end

