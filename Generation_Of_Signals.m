% Sine signal generation
clear all;
close all;
clc;
frequency=1000; % Set the frequency of the signal
timeperiod=1/frequency; % Compute the time period
amplitude=1; % Set the amplitude of the signal
dcoffset=0; % Mention the dc offset value
t=0:0.00001:2*timeperiod; % Define the time period the signal
out=dcoffset+amplitude*sin(2*pi*frequency*t); %Generate the signal as per the given specifications
stem(t,out); title('Sinusoidal Signal' ); xlabel('Time' );
ylabel('Amplitude' );

