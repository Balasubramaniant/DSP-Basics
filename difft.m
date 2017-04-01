function [Out] = difft(x,N)

H=length(x);

x=[x zeros(1,N-H)];
Y=zeros(length(x),1);
for K=0:N-1
    for n=0:N-1
        Y(K+1)=Y(K+1)+(x(n+1)*exp(-1i*pi*2*K*n/N));
    end
end
Out=Y;