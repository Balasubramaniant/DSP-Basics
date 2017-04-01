% Program to illustrate Interpolation
% Up-sampling factor: 2 
% Enter the input signal: [1 2 3]
% Output:
%      1     0     2     0     3
clear all;
L=input('Up-sampling factor: ' );
x=input('Enter the input signal: ' );
N=length(x);
n=0:N-1;
y=zeros(1,(L*N)-1);
y(1:L:length(y))=x;
disp('Output:');
disp(y);
NN=0:length(y)-1;
stem(NN,y);title('Interpolation');
ylabel('|x(n)|');xlabel('samples');axis tight;
