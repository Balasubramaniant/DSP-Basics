% Program to perform correlation
% Example
% Enter the input sequence I: [1 2 5]
% Enter the input sequence II: [8 5 2]
% Output:
%      2     9    28    41    40

clear all;
x=input('Enter the input sequence I: ' );
h=input('Enter the input sequence II: ' );
n1=length(x);
n2=length(h);
N=n1+n2-1;
x1=fliplr(x);
x2=[x1 zeros(1,N-n1)];
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
y=(H*x2');
y1=fliplr(y');
disp('Output:');
disp(y1);
n=0:N-1;
stem(n,y1);title('Cross Correlation');
xlabel('n');ylabel('Rxy(n)');
axis tight;