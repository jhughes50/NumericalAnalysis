x = -5: 0.01: 5;

y = sin(x);

figure(1);
plot(x,y, 'black', 'LineWidth',2);
hold on;
grid on;

F = @(x) sin(x);

y1 = F(pi/4);
y2 = F(-pi/4);
x1 = pi/4;
x2 = -pi/4;

slope1 = (y2-y1) / (x2-x1);
plot(x,(slope1 * (x - x1) + y1), 'red','LineWidth',1);

y3 = F(0);
y4 = F(pi/2);
x3 = 0;
x4 = pi/2;

slope2 = (y4-y3) / (x4-x3);
plot(x,(slope2 * (x-x3) + y3), 'green', 'LineWidth',1);

y5 = F(pi/3);
y6 = F(-pi/3);
x5 = pi/3;
x6 = -pi/3;

slope3 = (y6-y5) / (x6-x5);
plot(x,(slope3 * (x-x5) + y5),'blue','LineWidth',1);

f_prime = @(x) cos(x);

slope = f_prime(0);
plot(x,(slope * x),'magenta','LineWidth',2)

plot(x3,y3,'ok','MarkerFaceColor','black','MarkerSize',5);
title('y = sin(x)','Fontsize',16);
xlabel('X','Fontsize', 14);
ylabel('Y','Fontsize', 14);
xlim([-3,3]);

hold off;

fprintf(' h      slope   \n')
fprintf('---  -----------\n')
fprintf('  %1i %12.8f\n',pi/2,slope1)
fprintf('  %1i %12.8f\n',pi/2,slope2)
fprintf('%2.1f %12.8f\n',(2*pi)/3,slope3)
fprintf('  %1i %12.8f\n',0,slope)
