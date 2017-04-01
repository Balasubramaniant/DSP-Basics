% Linear convolution using FFT
% Example:
% Enter the input Sequence: [1 8 3]
% Enter the impulse response: [1 2 3]
% Output:   
%     1.0000
%    10.0000
%    22.0000
%    30.0000
%     9.0000
clear all;
x=input('Enter the input Sequence: ');
h=input('Enter the impulse response: ');
N=length(x)+length(h)-1;
X1=[x zeros(1,N-length(x))];
H1=[h zeros(1,N-length(h))];
X2=fft(x,N);
H2=fft(h,N);
OUT=X2.*H2;
ANS=ifft(OUT);
disp('Output:   ');
disp(ANS(1:N)');
n=0:N-1;
subplot(311);
stem(n,X1);title('Input Sequence');
ylabel('x(n)');xlabel('n');
axis tight;
subplot(312);
stem(n,H1);title('Impulse Sequence');
ylabel('h(n)');xlabel('n');
axis tight;
subplot(313);
stem(n,ANS(1:N));title('Linear Convolution');
ylabel('Y(k)');xlabel('n');
axis tight;