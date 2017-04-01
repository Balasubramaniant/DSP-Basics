% Program to perform Circular Convolution by Matrix method
% Example: 
% Enter the input sequence [1 2 9]
% Enter the impulse response sequence [8 2 5]
% Output:
%     36    63    81

clear all;
x=input('Enter the input sequence ' );
h=input('Enter the impulse response sequence ' );
n1=length(x);
n2=length(h);
N=max(n1,n2);
x1=[x zeros(1,N-n1)];
h1=[h zeros(1,N-n2)];
for n=1:N
    for m=1:N
        if n>m
        H(m,n)=h1(N-(n-(m+1)));
        else
        H(m,n)=h1(m-(n-1));
        end
    end
end
y=(H*x1');
disp('Output:');
disp(y');