% PRogram to perform FFT by DIT method 
% Example
% Enter the sequence x(n) [1 2 3 4 5 6]
%   21.0000          
%   -9.6569 - 3.0000i
%    3.0000 - 4.0000i
%    1.6569 + 3.0000i
%   -3.0000 - 0.0000i
%    1.6569 - 3.0000i
%    3.0000 + 4.0000i
%   -9.6569 + 3.0000i

clear all;
x=input('Enter the sequence x(n) ');
N=length(x);
A=log(N)/log(2);
B=2^(ceil(A));
X=[x zeros(1,B-N)];
NN=length(X);
Xe=X(1:2:NN);
Xo=X(2:2:NN);
Y=zeros(NN,1);
for K=1:NN
    for n=1:NN/2
        Y(K)=Y(K)+ ( ( Xe(n)*exp(-1i*pi*4*(K-1)*(n-1)/NN) ) + ( Xo(n)*exp(-1i*pi*2*(K-1)/NN)*exp(-1i*pi*4*(K-1)*(n-1)/NN) ) );
    end
end
disp(Y);
n=0:NN-1;
subplot(3,1,1);
stem(n,X);title('Input Signal');
xlabel('n');ylabel('|x(n)|');

subplot(3,1,2);
stem(n,abs(Y));title('Output Signal');
xlabel('k');ylabel('|X(k)|');

subplot(3,1,3);
stem(n,angle(Y));title('Output Signal');
xlabel('k');ylabel('Phase of X(k)');axis tight;