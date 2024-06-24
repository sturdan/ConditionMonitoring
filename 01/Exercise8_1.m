y = 1:1:10;
z = linspace(1,5,9);
a = 3:2:13;
b = linspace(1,10,5);
vec = linspace(1,2*pi,100);
b = transpose(b);

x = rand(5,5);
a = transpose(a);
y = rand(1, 5);
y = transpose(y);
x_one = 2*ones(6,3);
mat = rand(size(x_one));

m = rand(7,3);
m1 = m(5,:);
% no 6th colum
% m1_2 = m(:,6);
m2 = m(4);
m2_1 = m(9);
m3 = m(:,2);
m4 = m(end-1,:);
m4_1 = m(:,end-2);
m(5,:) = ones(1,3);
% no 6th colum
% m(:,6) = ones(6,1);
m(5,:) = zeros(1,3);


