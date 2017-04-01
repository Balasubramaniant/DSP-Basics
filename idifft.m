function [Out] = idifft(y,N)
X=zeros(N,1);
for K=0:N-1
    for n=0:N-1
        X(K+1)=X(K+1)+(y(n+1)*exp(1i*pi*2*K*n/N));
    end
end
X=X./N;
Out=X;