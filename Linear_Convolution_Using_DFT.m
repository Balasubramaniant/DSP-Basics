% Program for Linear convolution using DFT
% Example
% Enter the input Sequence: [1 8 3]
% Enter the impulse response: [1 2 3]
% Output:   
%    1.0000 - 0.0000i
%   10.0000 - 0.0000i
%   22.0000 + 0.0000i
%   30.0000 + 0.0000i
%    9.0000 + 0.0000i
clear all;
x=input('Enter the input Sequence: ');
h=input('Enter the impulse response: ');
N=length(x)+length(h)-1;
x1=[x zeros(1,N-length(x))];
h1=[h zeros(1,N-length(h))];
Y1=difft(x1,N);
H1=difft(h1,N);
OUT=Y1.*H1;
ANS=idifft(OUT,N);
disp('Output:   ');
disp(ANS);
n=0:N-1;
subplot(311);
stem(n,x1);title('Input Sequence');
ylabel('x(n)');xlabel('n');
axis tight;
subplot(312);
stem(n,h1);title('Impulse Sequence');
ylabel('h(n)');xlabel('n');
axis tight;
subplot(313);
stem(n,ANS);title('Circular Convolution');
ylabel('Y(k)');xlabel('k');
axis tight;

