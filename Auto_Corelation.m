% Program to perform Auto Correlation
% Example
%     Enter the input sequence: [1 2 3 4 5 6]
% Output:
%	 6    17    32    50    70    91    70    50    32    17     6

clear all;
x=input('Enter the input sequence: ' );
n1=length(x);
N=2*n1-1;
x1=fliplr(x);
x2=[x1 zeros(1,N-n1)];
h1=[x zeros(1,N-n1)];
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
disp('Output:');
disp(y');
n=0:N-1;
stem(n,y);title('Auto Correlation');
xlabel('n');ylabel('Rxx(n)');
axis tight;