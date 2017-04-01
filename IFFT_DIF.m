% Program to perform Inv FFT by DIF Method
% Example
% Enter the sequence x(n) [ 8.0000,-4.0000-2.0000i,4.0000-0.0000i,-4.0000 + 2.0000i]
% Output:
%    1.0000          
%    2.0000 - 0.0000i
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
X1=X(1:NN/2);
X2=X(NN/2+1:NN);
Y=zeros(NN,1);
for K=1:NN
    for n=1:(NN/2)
    Y(K)=Y(K)+((X1(n)+((-1)^(K-1))*(X2(n)))*exp(-1i*pi*2*(K-1)*(n-1)/NN));
    end
end
Y=conj(Y);
Y=Y./NN;
disp('Output:')
disp(Y);
n=0:N-1;
subplot(3,1,1);
stem(n,x);title('Input Signal');
xlabel('k');ylabel('|x(k)|');
n=0:NN-1;
subplot(3,1,2);
stem(n,abs(Y));title('Output Signal');
xlabel('n');ylabel('|X(n)|');

subplot(3,1,3);
stem(n,angle(Y));title('Output Signal');
xlabel('n');ylabel('Phase of X(n)');axis tight;
