x = linspace(0,4*pi,100);
y = sin(x);
z = cos(x);

plot(x,y,'-')
title('Graph')
ylabel('y-Achse')
xlabel('x-Achse')
hold on
plot(x,z,'-')
legend('sin', 'cos')