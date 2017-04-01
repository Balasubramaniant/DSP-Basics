% program to perform Inv DFT
% Example
% Enter the Sequence[1 2 3]
% Output is
%    2.0000          
%   -0.5000 - 0.2887i
%   -0.5000 + 0.2887i

clear all;
y=input('Enter the Sequence');
N=length(y);
X=zeros(N,1);
for K=0:N-1
    for n=0:N-1
        X(K+1)=X(K+1)+(y(n+1)*exp(1i*pi*2*K*n/N));
    end
end
X=X./N;
disp('Output is');
disp(X);
t=0:N-1;
subplot(3,1,1);
stem(t,y);title('Input Signal');
xlabel('k');ylabel('|X(k)|');
subplot(3,1,2);
stem(t,abs(X));title('Output Signal');
xlabel('n');ylabel('|X(k)|');
subplot(3,1,3);
stem(t,angle(X));title('Output Signal');
xlabel('n');ylabel('|x(n)|');
