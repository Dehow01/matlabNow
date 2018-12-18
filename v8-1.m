n = input("??????? n: ");
x = linspace(-1,1,n);
y = abs(x);
xx = linspace(-1,1,1000);
yy = lagrange(x,y,xx);

pow = 0:n-1;
x = linspace(-5*pi,5*pi,n);
vecY1 = sin(x);
vecX1 = x';
matrX1 = vecX1.^pow;
vecC1 = linsolve(matrX1,vecY1');
matrXX  = xx'.^pow;
Y1 = matrXX*vecC1;

  m = 0:n-1;
  VecChe = cos((2*m+1)*pi/(2*n))*5*pi;
  VecChe = fliplr(VecChe);
  vecY2 = sin(VecChe);
  vecX2 = VecChe';
  matrX2 = vecX2.^pow;
  vecC2 = linsolve(matrX2,vecY2');
  matrXX  = xx'.^pow;
  Y2 = matrXX*vecC2;

k = n-1;
while max(abs(sin(xx) - yy)) > 0.001
    k = k + 1;
    x = linspace(-5*pi,5*pi,k);
    y = sin(x);
    yy = lagrange(x,y,xx);
end
k
c = n-1;

while max(abs(Y1.' - sin(xx))) > 0.001
    c = c + 1;
    pow = 0:c-1;
    x = linspace(-5*pi,5*pi,c);
    vecY1 = sin(x);
    vecX1 = x';
    matrX1 = vecX1.^pow;
    vecC1 = linsolve(matrX1,vecY1');
    matrXX  = xx'.^pow;
    Y1 = matrXX*vecC1;
end
c
q = n-1;
while max(abs(Y2.' - sin(xx))) > 0.001
    q = q +1;
    m = 0:q-1;
    pow = 0:q-1;
    VecChe = cos((2*m+1)*pi/(2*q))*5*pi;
    VecChe = fliplr(VecChe);
    vecY2 = sin(VecChe);
    vecX2 = VecChe';
    matrX2 = vecX2.^pow;
    vecC2 = linsolve(matrX2,vecY2');
    matrXX  = xx'.^pow;
    Y2 = matrXX*vecC2;
end
q



plot(xx,yy)
hold on
plot(xx,Y1)
hold on
plot(xx,Y2)


function yy=lagrange(x,y,xx)
N=length(x);
yy=zeros(size(xx));
for k=1:N
    t=ones(size(xx));
    for j=[1:k-1, k+1:N]
        t=t.*(xx-x(j))/(x(k)-x(j));
    end
    yy = yy + y(k)*t;
end
end
