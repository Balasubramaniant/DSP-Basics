% Program to illustrate the down-sampling process by an integer factor
% Example
% Length of the signal = 10
% Down-sampling factor = 2
% Input signal frequency = 5000
clear all;
N=input('Length of the signal = ' );
M=input('Down-sampling factor = ' );
f0=input('Input signal frequency = ' );
%Generate the input sinusoidal sequence
n=0:N-1;
m=0:N*M-1;
x=sin(2*pi*f0*m);
%Generate the down-sampled sequence
y=x(1:M:length(x));
%Plot the input and downsampled signal in time domain
subplot(211); stem(n,x(1:N)); title('Input Signal' );
xlabel('Time Index n' ); ylabel('Signal Amplitude' );
subplot(212); stem(n,y); title('Signal Down Sampled by a factor');
xlabel('Time Index n' ); ylabel('Signal Amplitude' );