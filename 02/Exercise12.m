test = sqrt(2) <= 1.5;
M = randi(10,1,10);
M1 = M > 5;
M2 = M(M1);

M(M > 5) = 1;
values_between_1_and_3 = M(M >= 1 & M <= 3);


x = faculty(5);
function out = faculty(x)
    fac = 1;
    while x > 0
        fac = fac * x;
        x = x - 1;
    end
    out = fac; 
end
