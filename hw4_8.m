a = 0;
b = 2;

h = 0.25;

n = (b-a)/h;

s = 0;
t = 0;
m = 0;

% Composite Simpsons Rule
for j = 1:(n-1)

	if mod(j,2) == 1
		q = j*h;
		s = s + (4*f(q));
	else
		q = j*h;
		s = s + (2*f(q));
	end

end

s = s + f(a) + f(b);
simp = (h/3) * s

% Composite Trapozoidal Rule
for i = 1:(n-1)

	k = h*i;
	t = t + (2*f(k));
end 

t = t + f(a) + f(b);
trap = t*(h/2)


% Composite Midpoint Rule
for i = 0:((n-2)/2)
	
	w = (a+((2*i)+1)*h);
	m = m + (2*h) * (f(w));

end

midpoint = m


function y = f(x)

	y = (x^2) * exp(-(x^2));


end
