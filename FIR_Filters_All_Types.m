clc
clear all;
close all;
N=1024;
Fs=10000;
NN=31;
Data=sprintf('Desing Filters For the Following Specs, Fc1=1000Hz, Fc2=2000 Fs=10000Hz, Filter Order=%d, FFT-Order=%d',N,NN); 
disp(Data);
t=0:1/Fs:0.01;
x1=10*sin(2*pi*500*t);
%x2=9*sin(2*pi*1000*t);
x3=15*sin(2*pi*1500*t);
x4=13*sin(2*pi*2000*t);
x5=5*sin(2*pi*2500*t);
X=x1+x3+x4+x5;

disp('1.Low Pass Filter');
disp('2.High Pass Filter');
disp('3.Band Pass Filter');
disp('4.Band Reject Filter');
Ch1=input('Enter choice:   ');
        switch Ch1
            case 1
                disp('1.Rectangular Window Method');
                disp('2.Hamming Window Method');
                disp('3.Hanning Window Method');
                disp('4.Blackman Window Method');
                Ch2=input('Enter choice:   ');
                for i=1:N/2;
                    f(i)=Fs*i/N;
                end
                c=zeros(1,NN);
                c(1)=1/5;
                for n=2:(NN+1)/2
                    c(n)=0.2*sinc(0.2*(n-1));
                end
                Hd=[fliplr(c(1:(NN+1)/2)) c(2:(NN+1)/2)];
                
                switch Ch2
                    case 1
                    %Rectangular Window Method
                    Wn=ones(1,NN);
                    Hn=Hd.*Wn;
                    figure ('Name','Butterworth Filter');
                    XX1=fft(X,N);
                    XX2=abs(XX1);
                    subplot(221);
                    plot(f,XX2(1:N/2));title('Spectrum of input');axis tight;
                    xlabel('Frequency');ylabel('Amplitude');
                    subplot(222);
                    stem(Hn);title('H(n) of Filter');
                    axis tight;xlabel('Frequency');ylabel('|H(n)|');
                    [H1 F1]=freqz(Hn,1,N,Fs);
                    subplot(223);
                    plot(F1,20*log10(abs(H1)/max(abs(H1))));title('H of Filter');
                    axis tight;xlabel('Frequency');ylabel('Gain in dB');
                    y1=filter(Hn,1,X);
                    HH1=fft(y1,N);
                    subplot(224);
                    HHH1=abs(HH1);
                    plot(f,HHH1(1:N/2));title('Output "y"');
                    xlabel('Frequency');ylabel('Amplitude');
                    axis tight;
                    
                    case 2
                    %Hamming Window Method
                    for k=-(NN-1)/2:(NN-1)/2;
                        Wn(k+1+(NN-1)/2)=0.54+0.46*cos(2*pi*k/(NN-1));
                    end
                    Hn=Hd.*Wn;
                    figure ('Name','Butterworth Filter');
                    XX1=fft(X,N);
                    XX2=abs(XX1);
                    subplot(221);
                    plot(f,XX2(1:N/2));title('Spectrum of input');axis tight;
                    xlabel('Frequency');ylabel('Amplitude');
                    subplot(222);
                    stem(Hn);title('H(n) of Filter');
                    axis tight;xlabel('Frequency');ylabel('|H(n)|');
                    [H1 F1]=freqz(Hn,1,N,Fs);
                    subplot(223);
                    plot(F1,20*log10(abs(H1)/max(abs(H1))));title('H of Filter');
                    axis tight;xlabel('Frequency');ylabel('Gain in dB');
                    y1=filter(Hn,1,X);
                    HH1=fft(y1,N);
                    subplot(224);
                    HHH1=abs(HH1);
                    plot(f,HHH1(1:N/2));title('Output "y"');
                    xlabel('Frequency');ylabel('Amplitude');
                    axis tight;
                    
                    case 3
                    %Hanning Window Method
                    for k=-(NN-1)/2:(NN-1)/2;
                        Wn(k+1+(NN-1)/2)=0.5+0.5*cos(2*pi*k/(NN-1));
                    end
                    Hn=Hd.*Wn;
                    figure ('Name','Butterworth Filter');
                    XX1=fft(X,N);
                    XX2=abs(XX1);
                    subplot(221);
                    plot(f,XX2(1:N/2));title('Spectrum of input');axis tight;
                    xlabel('Frequency');ylabel('Amplitude');
                    subplot(222);
                    stem(Hn);title('H(n) of Filter');
                    axis tight;xlabel('Frequency');ylabel('|H(n)|');
                    [H1 F1]=freqz(Hn,1,N,Fs);
                    subplot(223);
                    plot(F1,20*log10(abs(H1)/max(abs(H1))));title('H of Filter');
                    axis tight;xlabel('Frequency');ylabel('Gain in dB');
                    y1=filter(Hn,1,X);
                    HH1=fft(y1,N);
                    subplot(224);
                    HHH1=abs(HH1);
                    plot(f,HHH1(1:N/2));title('Output "y"');
                    xlabel('Frequency');ylabel('Amplitude');
                    axis tight;
                    
                    case 4
                    %Blackman Window Method
                    for k=-(NN-1)/2:(NN-1)/2;
                        Wn(k+1+(NN-1)/2)=0.42+0.5*cos(2*pi*k/(NN-1))+0.08*cos(4*pi*k/(NN-1));
                    end
                    Hn=Hd.*Wn;
                    figure ('Name','Butterworth Filter');
                    XX1=fft(X,N);
                    XX2=abs(XX1);
                    subplot(221);
                    plot(f,XX2(1:N/2));title('Spectrum of input');axis tight;
                    xlabel('Frequency');ylabel('Amplitude');
                    subplot(222);
                    stem(Hn);title('H(n) of Filter');
                    axis tight;xlabel('Frequency');ylabel('|H(n)|');
                    [H1 F1]=freqz(Hn,1,N,Fs);
                    subplot(223);
                    plot(F1,20*log10(abs(H1)/max(abs(H1))));title('H of Filter');
                    axis tight;xlabel('Frequency');ylabel('Gain in dB');
                    y1=filter(Hn,1,X);
                    HH1=fft(y1,N);
                    subplot(224);
                    HHH1=abs(HH1);
                    plot(f,HHH1(1:N/2));title('Output "y"');
                    xlabel('Frequency');ylabel('Amplitude');
                    axis tight;
                end
                
           case 2
                disp('1.Rectangular Window Method');
                disp('2.Hamming Window Method');
                disp('3.Hanning Window Method');
                disp('4.Blackman Window Method');
                Ch3=input('Enter choice:   ');
                for i=1:N/2;
                    f(i)=Fs*i/N;
                end
                c=zeros(1,NN);
                c(1)=4/5;
                for n=2:(NN+1)/2
                    c(n)=sinc((n-1))-0.2*sinc(0.2*(n-1));
                end
                Hd=[fliplr(c(1:(NN+1)/2)) c(2:(NN+1)/2)];
                
                switch Ch3
                    case 1
                    %Rectangular Window Method
                    Wn=ones(1,NN);
                    Hn=Hd.*Wn;
                    figure ('Name','Butterworth Filter');
                    XX1=fft(X,N);
                    XX2=abs(XX1);
                    subplot(221);
                    plot(f,XX2(1:N/2));title('Spectrum of input');axis tight;
                    xlabel('Frequency');ylabel('Amplitude');
                    subplot(222);
                    stem(Hn);title('H(n) of Filter');
                    axis tight;xlabel('Frequency');ylabel('|H(n)|');
                    [H1 F1]=freqz(Hn,1,N,Fs);
                    subplot(223);
                    plot(F1,20*log10(abs(H1)/max(abs(H1))));title('H of Filter');
                    axis tight;xlabel('Frequency');ylabel('Gain in dB');
                    y1=filter(Hn,1,X);
                    HH1=fft(y1,N);
                    subplot(224);
                    HHH1=abs(HH1);
                    plot(f,HHH1(1:N/2));title('Output "y"');
                    xlabel('Frequency');ylabel('Amplitude');
                    axis tight;
                    
                    case 2
                    %Hamming Window Method
                    for k=-(NN-1)/2:(NN-1)/2;
                        Wn(k+1+(NN-1)/2)=0.54+0.46*cos(2*pi*k/(NN-1));
                    end
                    Hn=Hd.*Wn;
                    figure ('Name','Butterworth Filter');
                    XX1=fft(X,N);
                    XX2=abs(XX1);
                    subplot(221);
                    plot(f,XX2(1:N/2));title('Spectrum of input');axis tight;
                    xlabel('Frequency');ylabel('Amplitude');
                    subplot(222);
                    stem(Hn);title('H(n) of Filter');
                    axis tight;xlabel('Frequency');ylabel('|H(n)|');
                    [H1 F1]=freqz(Hn,1,N,Fs);
                    subplot(223);
                    plot(F1,20*log10(abs(H1)/max(abs(H1))));title('H of Filter');
                    axis tight;xlabel('Frequency');ylabel('Gain in dB');
                    y1=filter(Hn,1,X);
                    HH1=fft(y1,N);
                    subplot(224);
                    HHH1=abs(HH1);
                    plot(f,HHH1(1:N/2));title('Output "y"');
                    xlabel('Frequency');ylabel('Amplitude');
                    axis tight;
                    
                    case 3
                    %Hanning Window Method
                    for k=-(NN-1)/2:(NN-1)/2;
                        Wn(k+1+(NN-1)/2)=0.5+0.5*cos(2*pi*k/(NN-1));
                    end
                    Hn=Hd.*Wn;
                    figure ('Name','Butterworth Filter');
                    XX1=fft(X,N);
                    XX2=abs(XX1);
                    subplot(221);
                    plot(f,XX2(1:N/2));title('Spectrum of input');axis tight;
                    xlabel('Frequency');ylabel('Amplitude');
                    subplot(222);
                    stem(Hn);title('H(n) of Filter');
                    axis tight;xlabel('Frequency');ylabel('|H(n)|');
                    [H1 F1]=freqz(Hn,1,N,Fs);
                    subplot(223);
                    plot(F1,20*log10(abs(H1)/max(abs(H1))));title('H of Filter');
                    axis tight;xlabel('Frequency');ylabel('Gain in dB');
                    y1=filter(Hn,1,X);
                    HH1=fft(y1,N);
                    subplot(224);
                    HHH1=abs(HH1);
                    plot(f,HHH1(1:N/2));title('Output "y"');
                    xlabel('Frequency');ylabel('Amplitude');
                    axis tight;
                    
                    case 4
                    %Blackman Window Method
                    for k=-(NN-1)/2:(NN-1)/2;
                        Wn(k+1+(NN-1)/2)=0.42+0.5*cos(2*pi*k/(NN-1))+0.08*cos(4*pi*k/(NN-1));
                    end
                    Hn=Hd.*Wn;
                    figure ('Name','Butterworth Filter');
                    XX1=fft(X,N);
                    XX2=abs(XX1);
                    subplot(221);
                    plot(f,XX2(1:N/2));title('Spectrum of input');axis tight;
                    xlabel('Frequency');ylabel('Amplitude');
                    subplot(222);
                    stem(Hn);title('H(n) of Filter');
                    axis tight;xlabel('Frequency');ylabel('|H(n)|');
                    [H1 F1]=freqz(Hn,1,N,Fs);
                    subplot(223);
                    plot(F1,20*log10(abs(H1)/max(abs(H1))));title('H of Filter');
                    axis tight;xlabel('Frequency');ylabel('Gain in dB');
                    y1=filter(Hn,1,X);
                    HH1=fft(y1,N);
                    subplot(224);
                    HHH1=abs(HH1);
                    plot(f,HHH1(1:N/2));title('Output "y"');
                    xlabel('Frequency');ylabel('Amplitude');
                    axis tight;
                end
                
                case 3
                disp('1.Rectangular Window Method');
                disp('2.Hamming Window Method');
                disp('3.Hanning Window Method');
                disp('4.Blackman Window Method');
                Ch4=input('Enter choice:   ');
                for i=1:N/2;
                    f(i)=Fs*i/N;
                end
                c=zeros(1,NN);
                c(1)=1/5;
                for n=2:(NN+1)/2
                    c(n)=0.4*sinc(0.4*(n-1))-0.2*sinc(0.2*(n-1));
                end
                Hd=[fliplr(c(1:(NN+1)/2)) c(2:(NN+1)/2)];
                
                switch Ch4
                    case 1
                    %Rectangular Window Method
                    Wn=ones(1,NN);
                    Hn=Hd.*Wn;
                    figure ('Name','Butterworth Filter');
                    XX1=fft(X,N);
                    XX2=abs(XX1);
                    subplot(221);
                    plot(f,XX2(1:N/2));title('Spectrum of input');axis tight;
                    xlabel('Frequency');ylabel('Amplitude');
                    subplot(222);
                    stem(Hn);title('H(n) of Filter');
                    axis tight;xlabel('Frequency');ylabel('|H(n)|');
                    [H1 F1]=freqz(Hn,1,N,Fs);
                    subplot(223);
                    plot(F1,20*log10(abs(H1)/max(abs(H1))));title('H of Filter');
                    axis tight;xlabel('Frequency');ylabel('Gain in dB');
                    y1=filter(Hn,1,X);
                    HH1=fft(y1,N);
                    subplot(224);
                    HHH1=abs(HH1);
                    plot(f,HHH1(1:N/2));title('Output "y"');
                    xlabel('Frequency');ylabel('Amplitude');
                    axis tight;
                    
                    case 2
                    %Hamming Window Method
                    for k=-(NN-1)/2:(NN-1)/2;
                        Wn(k+1+(NN-1)/2)=0.54+0.46*cos(2*pi*k/(NN-1));
                    end
                    Hn=Hd.*Wn;
                    figure ('Name','Butterworth Filter');
                    XX1=fft(X,N);
                    XX2=abs(XX1);
                    subplot(221);
                    plot(f,XX2(1:N/2));title('Spectrum of input');axis tight;
                    xlabel('Frequency');ylabel('Amplitude');
                    subplot(222);
                    stem(Hn);title('H(n) of Filter');
                    axis tight;xlabel('Frequency');ylabel('|H(n)|');
                    [H1 F1]=freqz(Hn,1,N,Fs);
                    subplot(223);
                    plot(F1,20*log10(abs(H1)/max(abs(H1))));title('H of Filter');
                    axis tight;xlabel('Frequency');ylabel('Gain in dB');
                    y1=filter(Hn,1,X);
                    HH1=fft(y1,N);
                    subplot(224);
                    HHH1=abs(HH1);
                    plot(f,HHH1(1:N/2));title('Output "y"');
                    xlabel('Frequency');ylabel('Amplitude');
                    axis tight;
                    
                    case 3
                    %Hanning Window Method
                    for k=-(NN-1)/2:(NN-1)/2;
                        Wn(k+1+(NN-1)/2)=0.5+0.5*cos(2*pi*k/(NN-1));
                    end
                    Hn=Hd.*Wn;
                    figure ('Name','Butterworth Filter');
                    XX1=fft(X,N);
                    XX2=abs(XX1);
                    subplot(221);
                    plot(f,XX2(1:N/2));title('Spectrum of input');axis tight;
                    xlabel('Frequency');ylabel('Amplitude');
                    subplot(222);
                    stem(Hn);title('H(n) of Filter');
                    axis tight;xlabel('Frequency');ylabel('|H(n)|');
                    [H1 F1]=freqz(Hn,1,N,Fs);
                    subplot(223);
                    plot(F1,20*log10(abs(H1)/max(abs(H1))));title('H of Filter');
                    axis tight;xlabel('Frequency');ylabel('Gain in dB');
                    y1=filter(Hn,1,X);
                    HH1=fft(y1,N);
                    subplot(224);
                    HHH1=abs(HH1);
                    plot(f,HHH1(1:N/2));title('Output "y"');
                    xlabel('Frequency');ylabel('Amplitude');
                    axis tight;
                    
                    case 4
                    %Blackman Window Method
                    for k=-(NN-1)/2:(NN-1)/2;
                        Wn(k+1+(NN-1)/2)=0.42+0.5*cos(2*pi*k/(NN-1))+0.08*cos(4*pi*k/(NN-1));
                    end
                    Hn=Hd.*Wn;
                    figure ('Name','Butterworth Filter');
                    XX1=fft(X,N);
                    XX2=abs(XX1);
                    subplot(221);
                    plot(f,XX2(1:N/2));title('Spectrum of input');axis tight;
                    xlabel('Frequency');ylabel('Amplitude');
                    subplot(222);
                    stem(Hn);title('H(n) of Filter');
                    axis tight;xlabel('Frequency');ylabel('|H(n)|');
                    [H1 F1]=freqz(Hn,1,N,Fs);
                    subplot(223);
                    plot(F1,20*log10(abs(H1)/max(abs(H1))));title('H of Filter');
                    axis tight;xlabel('Frequency');ylabel('Gain in dB');
                    y1=filter(Hn,1,X);
                    HH1=fft(y1,N);
                    subplot(224);
                    HHH1=abs(HH1);
                    plot(f,HHH1(1:N/2));title('Output "y"');
                    xlabel('Frequency');ylabel('Amplitude');
                    axis tight;
                end
                
                case 4
                disp('1.Rectangular Window Method');
                disp('2.Hamming Window Method');
                disp('3.Hanning Window Method');
                disp('4.Blackman Window Method');
                Ch5=input('Enter choice:   ');
                for i=1:N/2;
                    f(i)=Fs*i/N;
                end
                c=zeros(1,NN);
                c(1)=4/5;
                for n=2:(NN+1)/2
                    c(n)=sinc((n-1))-0.4*sinc(0.4*(n-1))+0.2*sinc(0.2*(n-1));
                end
                Hd=[fliplr(c(1:(NN+1)/2)) c(2:(NN+1)/2)];
                
                switch Ch5
                    case 1
                    %Rectangular Window Method
                    Wn=ones(1,NN);
                    Hn=Hd.*Wn;
                    figure ('Name','Butterworth Filter');
                    XX1=fft(X,N);
                    XX2=abs(XX1);
                    subplot(221);
                    plot(f,XX2(1:N/2));title('Spectrum of input');axis tight;
                    xlabel('Frequency');ylabel('Amplitude');
                    subplot(222);
                    stem(Hn);title('H(n) of Filter');
                    axis tight;xlabel('Frequency');ylabel('|H(n)|');
                    [H1 F1]=freqz(Hn,1,N,Fs);
                    subplot(223);
                    plot(F1,20*log10(abs(H1)/max(abs(H1))));title('H of Filter');
                    axis tight;xlabel('Frequency');ylabel('Gain in dB');
                    y1=filter(Hn,1,X);
                    HH1=fft(y1,N);
                    subplot(224);
                    HHH1=abs(HH1);
                    plot(f,HHH1(1:N/2));title('Output "y"');
                    xlabel('Frequency');ylabel('Amplitude');
                    axis tight;
                    
                    case 2
                    %Hamming Window Method
                    for k=-(NN-1)/2:(NN-1)/2;
                        Wn(k+1+(NN-1)/2)=0.54+0.46*cos(2*pi*k/(NN-1));
                    end
                    Hn=Hd.*Wn;
                    figure ('Name','Butterworth Filter');
                    XX1=fft(X,N);
                    XX2=abs(XX1);
                    subplot(221);
                    plot(f,XX2(1:N/2));title('Spectrum of input');axis tight;
                    xlabel('Frequency');ylabel('Amplitude');
                    subplot(222);
                    stem(Hn);title('H(n) of Filter');
                    axis tight;xlabel('Frequency');ylabel('|H(n)|');
                    [H1 F1]=freqz(Hn,1,N,Fs);
                    subplot(223);
                    plot(F1,20*log10(abs(H1)/max(abs(H1))));title('H of Filter');
                    axis tight;xlabel('Frequency');ylabel('Gain in dB');
                    y1=filter(Hn,1,X);
                    HH1=fft(y1,N);
                    subplot(224);
                    HHH1=abs(HH1);
                    plot(f,HHH1(1:N/2));title('Output "y"');
                    xlabel('Frequency');ylabel('Amplitude');
                    axis tight;
                    
                    case 3
                    %Hanning Window Method
                    for k=-(NN-1)/2:(NN-1)/2;
                        Wn(k+1+(NN-1)/2)=0.5+0.5*cos(2*pi*k/(NN-1));
                    end
                    Hn=Hd.*Wn;
                    figure ('Name','Butterworth Filter');
                    XX1=fft(X,N);
                    XX2=abs(XX1);
                    subplot(221);
                    plot(f,XX2(1:N/2));title('Spectrum of input');axis tight;
                    xlabel('Frequency');ylabel('Amplitude');
                    subplot(222);
                    stem(Hn);title('H(n) of Filter');
                    axis tight;xlabel('Frequency');ylabel('|H(n)|');
                    [H1 F1]=freqz(Hn,1,N,Fs);
                    subplot(223);
                    plot(F1,20*log10(abs(H1)/max(abs(H1))));title('H of Filter');
                    axis tight;xlabel('Frequency');ylabel('Gain in dB');
                    y1=filter(Hn,1,X);
                    HH1=fft(y1,N);
                    subplot(224);
                    HHH1=abs(HH1);
                    plot(f,HHH1(1:N/2));title('Output "y"');
                    xlabel('Frequency');ylabel('Amplitude');
                    axis tight;
                    
                    case 4
                    %Blackman Window Method
                    for k=-(NN-1)/2:(NN-1)/2;
                        Wn(k+1+(NN-1)/2)=0.42+0.5*cos(2*pi*k/(NN-1))+0.08*cos(4*pi*k/(NN-1));
                    end
                    Hn=Hd.*Wn;
                    figure ('Name','Butterworth Filter');
                    XX1=fft(X,N);
                    XX2=abs(XX1);
                    subplot(221);
                    plot(f,XX2(1:N/2));title('Spectrum of input');axis tight;
                    xlabel('Frequency');ylabel('Amplitude');
                    subplot(222);
                    stem(Hn);title('H(n) of Filter');
                    axis tight;xlabel('Frequency');ylabel('|H(n)|');
                    [H1 F1]=freqz(Hn,1,N,Fs);
                    subplot(223);
                    plot(F1,20*log10(abs(H1)/max(abs(H1))));title('H of Filter');
                    axis tight;xlabel('Frequency');ylabel('Gain in dB');
                    y1=filter(Hn,1,X);
                    HH1=fft(y1,N);
                    subplot(224);
                    HHH1=abs(HH1);
                    plot(f,HHH1(1:N/2));title('Output "y"');
                    xlabel('Frequency');ylabel('Amplitude');
                    axis tight;
                end
        end