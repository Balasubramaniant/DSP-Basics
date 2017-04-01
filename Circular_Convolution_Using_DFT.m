% Program to perform Circular Convolution using DFT
% Example: 
% Enter the input Sequence: [1 5 6]
% Enter the impulse response: [7 8 9]
% Output:   
%   1.0e+002 *
% 
%    1.0000 + 0.0000i
%    0.9700 + 0.0000i
%    0.9100 - 0.0000i

clear all;
x=input('Enter the input Sequence: ');
h=input('Enter the impulse response: ');
n1=length(x);
n2=length(h);
N=max(n1,n2);
x1=[x zeros(1,N-n1)];
h1=[h zeros(1,N-n2)];
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