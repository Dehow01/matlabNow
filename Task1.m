x = [-4 , -3, -2, -1];
A = 0;
y = 1./(A.^2 - x);
xx = linspace(-4,-1,1000);
yy = lagrange(x,y,xx);

while max(abs(yy - 1./(A.^2 - xx)))> 0.00001
    A = A + 0.00001;
    y = 1./(A.^2 - x);
    yy = lagrange(x,y,xx);
end
A
plot(xx,1./(A.^2 - xx))
hold on
plot(xx , yy)



function yy = lagrange(x,y,xx) 
N = length(x); 
yy=zeros(size(xx)); 
for k=1:N 
t=ones(size(xx)); 
for j=[1:k-1, k+1:N] 
t=t.*(xx-x(j))/(x(k)-x(j)); 
end 
yy = yy + y(k)*t; 
end 
end
