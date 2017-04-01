function [out,A]=ifftt(x,NN)
if nargin<2
    N=length(x);
    A=log(N)/log(2);
    B=2^(ceil(A));
    X=[x zeros(1,B-length(x))];
    NN=length(X);
else
    A=log(NN)/log(2);
    B=2^(ceil(A));
    X=[x zeros(1,B-length(x))];
    NN=length(X); 
end
X=conj(X);
Xe=X(1:2:NN);
Xo=X(2:2:NN);
Y=zeros(NN,1);
for K=1:NN
    for n=1:NN/2
        Y(K)=Y(K)+ ( ( Xe(n)*exp(-1i*pi*4*(K-1)*(n-1)/NN) ) + ( Xo(n)*exp(-1i*pi*2*(K-1)/NN)*exp(-1i*pi*4*(K-1)*(n-1)/NN) ) );
    end
end
Y=conj(Y);
Y=Y/NN;
out=Y;
A=NN;