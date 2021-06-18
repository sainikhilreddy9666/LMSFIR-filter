clc;
clear all;
close all;

len = 1000;
y = zeros(len,1);
x = ones(len,1)*2; % input signal
d = ones(len,1); % desired signal
stepsize = 0.1;%stepsizeiter = length (x);
n=1;
y = lms(x, d, n, stepsize)

%result
figure
plot([x,y' ,d],'linewidth',2)
legend ('x(k) ', 'y(k)','d(k)')
xlabel ( 'k \rightarrow')
ylabel ({'x(k)'; 'y(k)';'d(k)'})
  


function y=lms(x,d,n,stepsize)
w = zeros(1000, 1);
for k=1:1000   
y(k) = (transpose(w(k))) * x(k);
%N = matlab.lang.makeValidName(y(k))
e(k)= d(k) - y(k);
w(k+1) = w(k) + stepsize * ( e(k)*x(k));
end
end
