% Linear Convolution
% Example:
% Enter the input sequence [1 2 3]
% Enter the impulse response sequence [1 8 3]
% Output:
%      1    10    22    30     9
clear all;
x=input('Enter the input sequence ' );
h=input('Enter the impulse response sequence ' );
n1=length(x);
n2=length(h);
N=n1+n2-1;
x1=[x zeros(1,N-n1)];
h1=[h zeros(1,N-n2)];
for n=1:N
    for m=1:N
        if n>m
        H(m,n)=0;
        else
        H(m,n)=h1(m-(n-1));
        end
    end
end
y=(H*x1');
disp('Output:');
disp(y');
n=0:N-1;
stem(n,y);title('Linear Convolution');
ylabel('Y(n)');xlabel('Time');
axis tight;