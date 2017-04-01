% Linear Conolution using Circular Convolution
% Example:
% Enter the input Sequence: [1 8 3]
% Enter the impulse response: [1 2 3]
% Output:   
%     1    10    22    30     9
clear all;
x=input('Enter the input sequence: ' );
h=input('Enter the impulse response sequence: ' );
n1=length(x);
n2=length(h);
N=n1+n2-1;
x1=[x zeros(1,N-n1)];
h1=[h zeros(1,N-n2)];
for n=1:N
    for m=1:N
        if n>m
        H(m,n)=x1(N-(n-(m+1)));
        else
        H(m,n)=x1(m-(n-1));
        end
    end
end
y=(H*h1');
disp('Output:');
disp(y');