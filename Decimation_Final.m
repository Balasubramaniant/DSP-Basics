% Example
% Down-sampling factor = 5
% Enter the Sequence  [1 2 3 4 5 6 7 8 9 10 11 12 13 14 15]
%      1     6    11

clear all;
close all;
clc;
M=input('Down-sampling factor = ' );
x=input('Enter the Sequence  ');
N=length(x);
n=0:N-1;
y=x(1:M:N);
disp(y);
NN=0:length(y)-1;
stem(NN,y);title('Decimation');
ylabel('|x(n)|');xlabel('samples');axis tight;