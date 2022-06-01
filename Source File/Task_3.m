clear all;
close all;
clc;

 

load '03_task3_x_d.mat'
N = 4;
len = 1000;
mu = 0.01;
k = (0:999);

 

n = randn(len,1)*1e-4;
%d = d+n;

 

[y,e,w] = lms3(x,d,N,mu)
h = round(w(:,end),1);
w = round(w,1);

 

figure
semilogy(e.^2),
grid on,

 


function [y,e,w]=lms3(x,d,N,mu)
w=zeros(1000,1);
x_w = zeros(N,1);
e =zeros(1000,1);
y=zeros(1000,1);
E=zeros(1000,1);
w_new = zeros(N,1);

for k = 1 : 1000
while k == 1
x_w(1) = x(k);
break;
end
while k>1
x_w = circshift(x_w,1)
x_w(1) = x(k);
break;
end

y(k) = (w_new)' * x_w;
e(k) = d(k) - y(k);
w_new = w_new + mu * e(k)* x_w;
for c = 1:N
w(c,k) = w_new(c);
end
end
end
