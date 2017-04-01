% Sine signal
clear all;
close all;
clc;
frequency=input('Enter frequency of Signal Fm ');
F1=input('Enter the sampling frequency = 2*Fm ');
F2=input('Enter the sampling frequency > 2*Fm ');
F3=input('Enter the sampling frequency < 2*Fm ');
             
timeperiod=1/frequency;     
amplitude=2;                
t=0:0.0001:5*timeperiod;    
out=amplitude*sin(2*pi*frequency*t);  
subplot(4,2,1); plot(t,out,'k'); title('Sinusoidal Signal'); xlabel('Time');
ylabel('Amplitude');hold
n=0:floor((5*timeperiod)*10000);
xd=sin(2*pi*frequency*(n/10000));
subplot(4,2,2);
stem((n/10000),xd,'o');title('Sinusoidal Signal'); xlabel('Time');
ylabel('Amplitude');

% Sampling at the rate fs>2fm (Over sampling)
t=0:1/F2:5*timeperiod;                 
out=amplitude*sin(2*pi*frequency*t);    
subplot(4,2,3); plot(t,out,'k'); title('Sinusoidal Signal sampled at the rate fs>2fm');
xlabel('Time');
ylabel('Amplitude');hold
n=0:floor((5*timeperiod)*1000);
xd=sin(2*pi*frequency*(n/1000));
subplot(4,2,4);
stem((n/1000),xd,'o');title('Sinusoidal Signal'); xlabel('Time');
ylabel('Amplitude');

% Sampling at the rate fs=2fm (Critical sampling)
t=0:1/F1:5*timeperiod; 
out=amplitude*sin(2*pi*frequency*t);
subplot(4,2,5); plot(t,round(out),'k'); title('Sinusoidal Signal sampled at the rate fs=2fm');
xlabel('Time');
ylabel('Amplitude');
hold
n=0:floor((5*timeperiod)*200);
xd=sin(2*pi*frequency*(n/200));subplot(4,2,6);
stem((n/200),xd,'o');title('Sinusoidal Signal'); xlabel('Time');
ylabel('Amplitude');

% Sampling at the rate fs<2fm (Under sampling)
t=0:1/F3:5*timeperiod;
out=amplitude*sin(2*pi*frequency*t);
subplot(4,2,7); plot(t,out,'k'); title('Sinusoidal Signal sampled at the rate fs<2fm');
xlabel('Time');
ylabel('Amplitude');
hold
n=0:floor((5*timeperiod)*150);
xd=sin(2*pi*frequency*(n/150));subplot(4,2,8);
stem((n/150),xd,'o');title('Sinusoidal Signal'); xlabel('Time');
ylabel('Amplitude');