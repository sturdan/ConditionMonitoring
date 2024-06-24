function out = faculty(x)
    fac = 1;
    while x > 0
        fac = fac * x;
        x = x - 1;
    end
    out = fac; 
end




