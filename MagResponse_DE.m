% Program to plot the magnitude response of a Difference Equation
% Example:
% Enter the co-efficients of x  [1 .5 1]
% Enter the co-efficients of y  [4 2 1]
clear all;
b=input('Enter the co-efficients of x  ');
a=input('Enter the co-efficients of y  ');
w=0:0.001:pi;
H=freqz(b,a,w);
Mag=20*log10(abs(H)/max(abs(H)));
Ang=angle(H);
figure ('Name','Digital Frequency Domain');
subplot(311);
plot(w,Mag);title('Magnitude Plot');xlabel('w');ylabel('Magnitude');
subplot(312);
plot(w,Ang);title('Phase Plot');xlabel('w');ylabel('Angle');
subplot(313);
zplane(b,a);

figure ('Name','Analog Frequency Domain');
N=1024;
Fs=5000;
[H F]=freqz(b,a,N,Fs);
Mag=20*log10(abs(H)/max(abs(H)));
Ang=angle(H);
subplot(311);
plot(F,Mag);title('Magnitude Plot');xlabel('f');ylabel('Magnitude');
subplot(312);
plot(F,Ang);title('Phase Plot');xlabel('f');ylabel('Angle');
subplot(313);
zplane(b,a);