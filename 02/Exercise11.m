for v = 10:-2:0
    disp(v)
end
disp('---------------------------------------------------')
sum = 0; 
for w = 0:1:20
    sum = sum + w;
    disp(sum)
end


n = 10;
sum_while = 0;
while i <= n
    sum_while = sum_while + i;
    i = i+ 1;
end


n = 3;
num = 1;
sum_while = 0;
while num <= n
    %disp(sum_while)
    sum_while = sum_while + num;
    num = num + 2;
end
disp(sum_while)