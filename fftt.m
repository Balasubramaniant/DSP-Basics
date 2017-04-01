function [out,A] = fftt(X,NN)
if nargin<2
    N=length(X); 
    A=log(N)/log(2);
    B=2^(ceil(A));
    X=[X zeros(1,B-length(X))];
    NN=length(X);
    AA=NN;
elseif nargin==2
    A=log(NN)/log(2);
    B=2^(ceil(A));
    X=[X zeros(1,B-length(X))];
    NN=length(X); 
    AA=NN;
end
Xe=X(1:2:NN);
Xo=X(2:2:NN);
Y=zeros(NN,1);
for K=1:NN
    for n=1:NN/2
        Y(K)=Y(K)+ ( ( Xe(n)*exp(-1i*pi*4*(K-1)*(n-1)/NN) ) + ( Xo(n)*exp(-1i*pi*2*(K-1)/NN)*exp(-1i*pi*4*(K-1)*(n-1)/NN) ) );
    end
end
out=Y;
A=AA;