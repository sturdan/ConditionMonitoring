% Define the original matrix
matrix = [1 2 3; 4 5 6; 7 8 9];

% Define the new column with the variable 'a'
a = 10; % example value for 'a', you can change it to whatever you want
new_column = a * ones(size(matrix, 1), 1);

% Concatenate the new column to the original matrix
result = [new_column matrix];

% Display the result
disp(result);

cell = {'1000','100','1';'1000','100','1';'1000','100','1';'1000','100','1';'1000','100','1';'1000','100','1'};
