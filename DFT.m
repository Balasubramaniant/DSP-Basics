% Program to perform Discrete Fourier Transform
% Example:
% Enter the input Sequence: [1 2 3 4 5 6]
% Output is
%   21.0000          
%   -3.0000 + 5.1962i
%   -3.0000 + 1.7321i
%   -3.0000 - 0.0000i
%   -3.0000 - 1.7321i
%   -3.0000 - 5.1962i

clear all;
x=input('Enter the input Sequence: ');
N=length(x);
Y=zeros(N,1);
for K=0:N-1
    for n=0:N-1
        Y(K+1)=Y(K+1)+(x(n+1)*exp(-1i*pi*2*K*n/N));
    end
end
disp('Output is');
disp(Y);
t=0:N-1;
subplot(3,1,1);
stem(t,x);title('Input Signal');
xlabel('n');ylabel('|x(n)|');

subplot(3,1,2);
stem(t,abs(Y));title('Output Signal');
xlabel('k');ylabel('|X(k)|');

subplot(3,1,3);
stem(t,angle(Y));title('Output Signal');
xlabel('k');ylabel('Phase of X(k)');axis tight;