load('data143.mat');
e=0.00001;
q=1./y;
F=(q-('a'*x+'b')).^2;
S=sum(F);
