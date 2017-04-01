clear all;
close all;
fs=input('Enter the sampling frequency');
t=0:1/fs:0.1;
x1=10*sin(2*pi*100*t);
x2=9*sin(2*pi*200*t);
x3=15*sin(2*pi*500*t);
x4=13*sin(2*pi*1000*t);
X=x1+x2+x3+x4;

plot(t,X);
AB=length(X);
disp('Length of x=');
disp(AB);
N=input('Enter the No of Points  ');
[XX1]=fft(X,N);
XX2=abs(XX1);

subplot(411);
plot(t,X);title('Complex Input Signal');
xlabel('time');ylabel('Amplitude');axis tight;

subplot(412)
stem(XX2);title('FFT of input');
xlabel('Samples');ylabel('|x(k)|');axis tight;


for i=1:N;
    f(i)=fs*i/N;
end

subplot(413);
plot(f,XX2);title('In Frequency Domain');
xlabel('Frequency');ylabel('|x(n)|');axis tight;

for j=1:N/2;
    ff(j)=fs*j/N;
end
subplot(414);
plot(ff,XX2(1:N/2));title('Upto Fs/2');
xlabel('Frequency');ylabel('|x(n)|');axis tight;