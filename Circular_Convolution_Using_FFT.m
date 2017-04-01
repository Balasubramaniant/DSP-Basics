% Program to perform Circular Convolution using FFT
% Example:
% Enter the input Sequence: [1 5 6]
% Enter the impulse response: [7 8 9]
% Output:   
%    100
%     97
%     91

clear all;
x=input('Enter the input Sequence: ');
h=input('Enter the impulse response: ');
N=max(length(x),length(h));
n=0:N-1;
X1=[x zeros(1,N-length(x))];
H1=[h zeros(1,N-length(h))];
X2=fft(x,N);
H2=fft(h,N);
OUT=X2.*H2;
ANS=ifft(OUT);
disp('Output:   ');
disp(ANS');
subplot(311);
stem(n,X1);title('Input Sequence');
ylabel('x(n)');xlabel('n');
axis tight;
subplot(312);
stem(n,H1);title('Impulse Sequence');
ylabel('h(n)');xlabel('n');
axis tight;
subplot(313);
stem(n,ANS(1:N));title('Circular Convolution');
ylabel('Y(k)');xlabel('n');
axis tight;