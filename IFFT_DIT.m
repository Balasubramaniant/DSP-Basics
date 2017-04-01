% Program to perform Inv FFT by DIF Method
% Example
% Enter the sequence x(n) [ 8.0000,-4.0000-2.0000i,4.0000-0.0000i,-4.0000 + 2.0000i]
% Output:
%    1.0000          
%    2.0000
%    5.0000 - 0.0000i
%         0 + 0.0000i
clear all;
x=input('Enter the sequence x(n) ');
N=length(x);
A=log(N)/log(2);
B=2^(ceil(A));
X1=[x zeros(1,B-N)];
X=conj(X1);
NN=length(X);
Xe=X(1:2:NN);
Xo=X(2:2:NN);
Y=zeros(NN,1);
for K=1:NN
    for n=1:NN/2
        Y(K)=Y(K)+ ( ( Xe(n)*exp(-1i*pi*4*(K-1)*(n-1)/NN) ) + ( Xo(n)*exp(-1i*pi*2*(K-1)/NN)*exp(-1i*pi*4*(K-1)*(n-1)/NN) ) );
    end
end
Y=conj(Y);
Y=Y./NN;
disp(Y);
n=0:NN-1;
subplot(3,1,1);
stem(n,X1);title('Input Signal');
xlabel('k');ylabel('|x(k)|');
 
subplot(3,1,2);
stem(n,abs(Y));title('Output Signal');
xlabel('n');ylabel('|X(n)|');
 
subplot(3,1,3);
stem(n,angle(Y));title('Output Signal');
xlabel('n');ylabel('Phase of X(n)');axis tight;

