% Program to perform Fast Fourier Transform
% Example:
% Enter the sequence x(n): [1 3 6 5 4]
%   19.0000          
%   -5.7361 + 0.3633i
%   -1.2639 + 1.5388i
%   -1.2639 - 1.5388i
%   -5.7361 - 0.3633i
%         0          
%         0          
%         0  

clear all;
x=input('Enter the sequence x(n): ');
N=length(x);
A=log(N)/log(2);
B=2^(ceil(A));
X=[x zeros(1,B-N)];
NN=length(X);
Xe=X(1:2:NN);
Xo=X(2:2:NN);
Y=zeros(NN,1);
for K=0:N-1
    for n=0:N/2
        Y(K+1)=Y(K+1)+ ( ( Xe(n+1)*exp(-1i*pi*4*(K)*(n)/N) ) + ( Xo(n+1)*exp(-1i*pi*2*(K)/N)*exp(-1i*pi*4*(K)*(n)/N) ) );
    end
end
disp(Y);