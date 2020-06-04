% Crank-Nicolson

m = 25;
N = 25;
a = 0;
b = 1;
h = (b-a)/m;
al = 1.1;


T = 1;
tau = T/N;
x = a + (1:m-1)*h;
%x = 0:h:1;
t = (0:N-1)*tau;


U = zeros(m,N);

f = @(x,t,al) (1+t)^(al-1)*(x-1).^2 * x.^2 * al+1/(gamma(5-al)) ...
    *x.^(-al).* ((((1+t)/(1-x))^al).*(x-1).^2 .* x.^al...
    *(12*x.^2 -6*al.*x+al^2-al)+(1+t).^al .*x.^2.*(12*(x-1).^2+...
    (6*x-7)*al+al^2))*sec(pi*al/2);

uexact = @(x,t,al) (t+1).^al.*x.^2*(1-x).^2;

fhalf=[];
for i = 1:m-1
    for j=0:N-1
        fhalf(i,j+1)=f(x(i),t(j+1)+tau/2,al);
    end
end

U = zeros(m-1,N);
% initial and boundary conditions
U(:,1) = x.^2.*(1-x).^2;
U(1,:) = 0;
U(end,:) = 0;

for j = 2:N-1
    U(:,j+1) = U(:,j)+tau*fhalf(:,j);
end


plot(x,U(:,end),'sk-') % formerly U(:,end)

% g0 = gamma(alpha+1)/gamma(alpha/2+1)^2;
% gk1 = (1- (alpha+1)/(alpha/2+k+1))*g_k;
% 
% A=zeros(m,m);
% 
% for i = 0:m-1
%     for j=0:m-1
%         A(i+1,j+1) = a*g0;
%     end
% end
