load('datatx3.mat')

p1 = polyfit(xx,t,195);%�������� ������ ����������������� ��������
p2 = polyfit(yy,t,105);

X = polyval(p1,t);%�������� �������� �������� ���������� �� t
Y = polyval(p2,t);

plot(Y,t,'r')
hold on
plot(X,t,'b')
