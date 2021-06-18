clc;
clear all;
close all;

len = 1000;
x = ones(len,1)*2; % input signal
d = ones(len,1); % desired signal
stepsize = 0.01;%stepsizeiter = length (x);
%n=randn(len,1)*1e-2;
%d=d+n;
N=2;
[y,e,w]= lms2(x,d,N,stepsize)

    
figure,
plot([x,y',d], 'linewidth',2);
legend('x[k]','y[k]','d[k]');
xlabel('k \rightarrow');
ylabel ('x[k],y[k],d[k] \rightarrow');



figure,
semilogy(e.^2, 'linewidth',2);
legend('x[k]','y[k]','d[k]');
xlabel('k \rightarrow');
ylabel ('e.^2 \rightarrow');


figure,
plot(w(1,:),w(2,:), 'x','linewidth',2);
legend('x[k]','y[k]','d[k]');
xlabel('w_1[k]');
ylabel ('w_2[k]');







function [y,e,w]= lms2(x,d,N,stepsize)
x_w=zeros(N,1);
w = zeros(N, 1000);
w_new=zeros(N,1);

for k=1:1000
   while k==1
   x_w(1)= x(k);
   break;
   end
   while (k> 1)
   x_w(2) = x_w(1);
   x_w(1) = x(k);
   break;
   end
   x_w(1)= x(k);
y(k) = (transpose(w_new) * x_w);
%N = matlab.lang.makeValidName(y(k))
e(k)= d(k) - y(k);
w_new = w_new + stepsize * ( e(k)*x_w);
w(1,k)=w_new(1);
w(3,k)=w_new(3);
end
end
