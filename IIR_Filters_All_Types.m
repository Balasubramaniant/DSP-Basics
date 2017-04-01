clear all;
close all;
N=input('Enter the order of FFT  ');
Fs=input('Enter the sampling Frequency  ');
t=0:1/Fs:0.01;
x1=10*sin(2*pi*500*t);
x2=9*sin(2*pi*1000*t);
x3=15*sin(2*pi*3000*t);
%x4=13*sin(2*pi*1000*t);
%x5=5*sin(2*pi*1500*t);
X=x1+x2+x3;

disp('1.Filter By I2T Method');
disp('2.Filter By BLT Method');
Ch=input('Enter Choice:   ');
switch Ch
    case 1
        disp('1.Low Pass Filter');
        disp('2.Band Pass Filter');
        Ch2=input('Enter choice:   ');
        switch Ch2
            case 1
                disp('1.Butterworth Filter');
                disp('2.Chebyshev Type-I Filter');
                disp('3.Chebyshev Type-II Filter');
                Ch3=input('Enter choice:   ');
                Fp=input('Enter Fp  ');
                Fss=input('Enter Fs  ');
                Ap=input('Enter Ap  ');
                As=input('Enter As  ');     
                Op=2*pi*Fp;
                Os=2*pi*Fss;
                for i=1:N/2;
                        f(i)=Fs*i/N;
                end
                switch Ch3
                    
                    case 1
                    %Butterworth Filter
                    figure ('Name','Butterworth Filter');
                    subplot(221);
                    plot(t,X);title('Complex Input Signal');axis tight;
                    xlabel('time');ylabel('Amplitude');
                    XX1=fft(X,N);
                    subplot(222);
                    XX2=abs(XX1);
                    plot(f,XX2(1:N/2));title('Spectrum of input');axis tight;
                    xlabel('Frequency');ylabel('Amplitude');
                    [NN1 Oc1]=buttord(Op,Os,Ap,As,'s');
                    [bb1 aa1]=butter(NN1,Oc1,'s');
                    [b1 a1]=impinvar(bb1,aa1,Fs);
                    [H1 F1]=freqz(b1,a1,N,Fs);
                    subplot(223);
                    
                    plot(F1,20*log10(abs(H1)/max(abs(H1))));title('H of Filter');
                    axis tight;xlabel('Frequency');ylabel('Gain in dB');
                    y1=filter(b1,a1,X);
                    HH1=fft(y1,N);
                    subplot(224);
                    HHH1=abs(HH1);
                    plot(f,HHH1(1:N/2));title('Output "y"');
                    xlabel('Frequency');ylabel('Amplitude');
                    axis tight;
                    
                    case 2
                    %chebyshev type 1
                    figure ('Name','chebysher type 1 Filter');
                    subplot(221);
                    plot(t,X);title('Complex Input Signal');axis tight;
                    xlabel('time');ylabel('Amplitude');
                    XX1=fft(X,N);
                    subplot(222);
                    XX2=abs(XX1);
                    plot(f,XX2(1:N/2));title('Spectrum of input');axis tight;
                    xlabel('Frequency');ylabel('Amplitude');
                    [NN2 Oc2]=cheb1ord(Op,Os,Ap,As,'s');
                    [bb2 aa2]=cheby1(NN2,Ap,Oc2,'s');
                    [b2 a2]=impinvar(bb2,aa2,Fs);
                    [H2 F2]=freqz(b2,a2,N,Fs);
                    subplot(223);
                    plot(F2,20*log10(abs(H2)/max(abs(H2))));title('H of Filter');
                    axis tight;xlabel('Frequency');ylabel('Gain in dB');
                    y2=filter(b2,a2,X);
                    HH2=fft(y2,N);
                    subplot(224);
                    HHH2=abs(HH2);
                    plot(f,HHH2(1:N/2));title('Output "y"');
                    axis tight;
                    xlabel('Frequency');ylabel('Amplitude');
                    
                    case 3
                    %chebyshev type-2
                    figure ('Name','chebysher type 2 Filter');
                    subplot(221);
                    plot(t,X);title('Complex Input Signal');axis tight;
                    xlabel('time');ylabel('Amplitude');
                    XX1=fft(X,N);
                    subplot(222);
                    XX2=abs(XX1);
                    plot(f,XX2(1:N/2));title('Spectrum of input');axis tight;
                    xlabel('Frequency');ylabel('Amplitude');
                    [NN3 Oc3]=cheb2ord(Op,Os,Ap,As,'s');
                    [bb3 aa3]=cheby2(NN3,As,Oc3,'s');
                    [b3 a3]=impinvar(bb3,aa3,Fs);
                    [H3 F3]=freqz(b3,a3,N,Fs);
                    subplot(223);
                    plot(F3,20*log10(abs(H3)/max(abs(H3))));title('H of Filter');
                    xlabel('Frequency');ylabel('Gain in dB');
                    axis tight;
                    y3=filter(b3,a3,X);
                    HH3=fft(y3,N);
                    subplot(224);
                    HHH3=abs(HH3);
                    plot(f,HHH3(1:N/2));title('Output "y"');
                    xlabel('Frequency');ylabel('Amplitude');
                    axis tight;
                end
                
            case 2
                disp('1.Butterworth Filter');
                disp('2.Chebyshev Type-I Filter');
                disp('3.Chebyshev Type-II Filter');
                Ch4=input('Enter choice:   ');
                Fp1=input('Enter Fp1  ');
                Fp2=input('Enter Fp2  ');
                Fss1=input('Enter Fs1  ');
                Fss2=input('Enter Fs2  ');
                Ap=input('Enter Ap  ');
                As=input('Enter As  ');
                Op=[2*pi*Fp1 2*pi*Fp2];
                Os=[2*pi*Fss1 2*pi*Fss2];
                for i=1:N/2;
                        f(i)=Fs*i/N;
                end
                switch Ch4
                    case 1
                    %Butterworth Filter
                    figure ('Name','Butterworth Filter');
                    subplot(221);
                    plot(t,X);title('Complex Input Signal');axis tight;
                    xlabel('time');ylabel('Amplitude');
                    XX1=fft(X,N);
                    subplot(222);
                    XX2=abs(XX1);
                    plot(f,XX2(1:N/2));title('Spectrum of input');axis tight;
                    xlabel('Frequency');ylabel('Amplitude');
                    [NN1 Oc1]=buttord(Op,Os,Ap,As,'s');
                    [bb1 aa1]=butter(NN1,Oc1,'bandpass','s');
                    [b1 a1]=impinvar(bb1,aa1,Fs);
                    [H1 F1]=freqz(b1,a1,N,Fs);
                    subplot(223);
                    plot(F1,20*log10(abs(H1)/max(abs(H1))));title('H of Filter');
                    axis tight;xlabel('Frequency');ylabel('Gain in dB');
                    y1=filter(b1,a1,X);
                    HH1=fft(y1,N);
                    subplot(224);
                    HHH1=abs(HH1);
                    plot(f,HHH1(1:N/2));title('Output "y"');
                    xlabel('Frequency');ylabel('Amplitude');
                    axis tight;

                    case 2
                    %chebysher type 1
                    figure ('Name','chebysher type 1 Filter');
                    subplot(221);
                    plot(t,X);title('Complex Input Signal');axis tight;
                    xlabel('time');ylabel('Amplitude');
                    XX1=fft(X,N);
                    subplot(222);
                    XX2=abs(XX1);
                    plot(f,XX2(1:N/2));title('Spectrum of input');axis tight;
                    xlabel('Frequency');ylabel('Amplitude');
                    [NN2 Oc2]=cheb1ord(Op,Os,Ap,As,'s');
                    [bb2 aa2]=cheby1(NN2,Ap,Oc2,'bandpass','s');
                    [b2 a2]=impinvar(bb2,aa2,Fs);
                    [H2 F2]=freqz(b2,a2,N,Fs);
                    subplot(223);
                    plot(F2,20*log10(abs(H2)/max(abs(H2))));title('H of Filter');
                    axis tight;xlabel('Frequency');ylabel('Gain in dB');
                    y2=filter(b2,a2,X);
                    HH2=fft(y2,N);
                    subplot(224);
                    HHH2=abs(HH2);
                    plot(f,HHH2(1:N/2));title('Output "y"');
                    axis tight;
                    xlabel('Frequency');ylabel('Amplitude');
                    
                    case 3
                    %chebysher type 2
                    figure ('Name','chebysher type 2 Filter');
                    subplot(221);
                    plot(t,X);title('Complex Input Signal');axis tight;
                    xlabel('time');ylabel('Amplitude');
                    XX1=fft(X,N);
                    subplot(222);
                    XX2=abs(XX1);
                    plot(f,XX2(1:N/2));title('Spectrum of input');axis tight;
                    xlabel('Frequency');ylabel('Amplitude');
                    [NN3 Oc3]=cheb2ord(Op,Os,Ap,As,'s');
                    [bb3 aa3]=cheby2(NN3,As,Oc3,'bandpass','s');
                    [b3 a3]=impinvar(bb3,aa3,Fs);
                    [H3 F3]=freqz(b3,a3,N,Fs);
                    subplot(223);
                    plot(F3,20*log10(abs(H3)/max(abs(H3))));title('H of Filter');
                    xlabel('Frequency');ylabel('Gain in dB');
                    axis tight;
                    y3=filter(b3,a3,X);
                    HH3=fft(y3,N);
                    subplot(224);
                    HHH3=abs(HH3);
                    plot(f,HHH3(1:N/2));title('Output "y"');
                    xlabel('Frequency');ylabel('Amplitude');
                    axis tight;
                end
            end
              
    case 2
        disp('1.Low Pass Filter');
        disp('2.High Pass Filter');
        disp('3.Band Pass Filter');
        disp('4.Band Reject Filter');
        Ch5=input('Enter choice:   ');
        switch Ch5
            case 1
                disp('1.Butterworth Filter');
                disp('2.Chebyshev Type-I Filter');
                disp('3.Chebyshev Type-II Filter');
                Ch6=input('Enter choice:   ');
                Fp=input('Enter Fp  ');
                Fss=input('Enter Fs  ');
                Ap=input('Enter Ap  ');
                As=input('Enter As  ');
                Wp=2*Fp/Fs;
                Ws=2*Fss/Fs;
                for i=1:N/2;
                    f(i)=Fs*i/N;
                end
                switch Ch6
                    case 1
                    %Butterworth Filter
                    figure ('Name','Butterworth Filter');
                    subplot(221);
                    plot(t,X);title('Complex Input Signal');axis tight;
                    xlabel('time');ylabel('Amplitude');
                    XX1=fft(X,N);
                    subplot(222);
                    XX2=abs(XX1);
                    plot(f,XX2(1:N/2));title('Spectrum of input');axis tight;
                    xlabel('Frequency');ylabel('Amplitude');
                    [NN1 Wc1]=buttord(Wp,Ws,Ap,As);
                    [b1 a1]=butter(NN1,Wc1);
                    [H1 F1]=freqz(b1,a1,N,Fs);
                    subplot(223);
                    plot(F1,20*log10(abs(H1)/max(abs(H1))));title('H of Filter');
                    axis tight;xlabel('Frequency');ylabel('Gain in dB');
                    y1=filter(b1,a1,X);
                    HH1=fft(y1,N);
                    subplot(224);
                    HHH1=abs(HH1);
                    plot(f,HHH1(1:N/2));title('Output "y"');
                    xlabel('Frequency');ylabel('Amplitude');
                    axis tight;
                    
                    case 2
                    %chebysher type 1
                    figure ('Name','chebysher type 1 Filter');
                    subplot(221);
                    plot(t,X);title('Complex Input Signal');axis tight;
                    xlabel('time');ylabel('Amplitude');
                    XX1=fft(X,N);
                    subplot(222);
                    XX2=abs(XX1);
                    plot(f,XX2(1:N/2));title('Spectrum of input');axis tight;
                    xlabel('Frequency');ylabel('Amplitude');
                    [NN2 Wc2]=cheb1ord(Wp,Ws,Ap,As);
                    [b2 a2]=cheby1(NN2,Ap,Wc2);
                    [H2 F2]=freqz(b2,a2,N,Fs);
                    subplot(223);
                    plot(F2,20*log10(abs(H2)/max(abs(H2))));title('H of Filter');
                    axis tight;xlabel('Frequency');ylabel('Gain in dB');
                    y2=filter(b2,a2,X);
                    HH2=fft(y2,N);
                    subplot(224);
                    HHH2=abs(HH2);
                    plot(f,HHH2(1:N/2));title('Output "y"');
                    axis tight;
                    xlabel('Frequency');ylabel('Amplitude');
                    
                    case 3
                    %chebysher type 2
                    figure ('Name','chebysher type 2 Filter');
                    subplot(221);
                    plot(t,X);title('Complex Input Signal');axis tight;
                    xlabel('time');ylabel('Amplitude');
                    XX1=fft(X,N);
                    subplot(222);
                    XX2=abs(XX1);
                    plot(f,XX2(1:N/2));title('Spectrum of input');axis tight;
                    xlabel('Frequency');ylabel('Amplitude');
                    [NN3 Wc3]=cheb2ord(Wp,Ws,Ap,As);
                    [b3 a3]=cheby2(NN3,As,Wc3);
                    [H3 F3]=freqz(b3,a3,N,Fs);
                    subplot(223);
                    plot(F3,20*log10(abs(H3)/max(abs(H3))));title('H of Filter');
                    xlabel('Frequency');ylabel('Gain in dB');
                    axis tight;
                    y3=filter(b3,a3,X);
                    HH3=fft(y3,N);
                    subplot(224);
                    HHH3=abs(HH3);
                    plot(f,HHH3(1:N/2));title('Output "y"');
                    xlabel('Frequency');ylabel('Amplitude');
                    axis tight;
                end
                
            case 2
                disp('1.Butterworth Filter');
                disp('2.Chebyshev Type-I Filter');
                disp('3.Chebyshev Type-II Filter');
                Ch7=input('Enter choice:   ');
                Fp=input('Enter Fp  ');
                Fss=input('Enter Fs  ');
                Ap=input('Enter Ap  ');
                As=input('Enter As  ');
                Wp=2*Fp/Fs;
                Ws=2*Fss/Fs;
                for i=1:N/2;
                    f(i)=Fs*i/N;
                end
                switch Ch7
                    case 1
                        %Butterworth Filter
                        figure ('Name','Butterworth Filter');
                        subplot(221);
                        plot(t,X);title('Complex Input Signal');axis tight;
                        xlabel('time');ylabel('Amplitude');
                        XX1=fft(X,N);
                        subplot(222);
                        XX2=abs(XX1);
                        plot(f,XX2(1:N/2));title('Spectrum of input');axis tight;
                        xlabel('Frequency');ylabel('Amplitude');
                        [NN1 Wc1]=buttord(Wp,Ws,Ap,As);
                        [b1 a1]=butter(NN1,Wc1,'high');
                        [H1 F1]=freqz(b1,a1,N,Fs);
                        subplot(223);
                        plot(F1,20*log10(abs(H1)/max(abs(H1))));title('H of Filter');
                        axis tight;xlabel('Frequency');ylabel('Gain in dB');
                        y1=filter(b1,a1,X);
                        HH1=fft(y1,N);
                        subplot(224);
                        HHH1=abs(HH1);
                        plot(f,HHH1(1:N/2));title('Output "y"');
                        xlabel('Frequency');ylabel('Amplitude');
                        axis tight;
                        
                    case 2
                        %chebysher type 1
                        figure ('Name','chebysher type 1 Filter');
                        subplot(221);
                        plot(t,X);title('Complex Input Signal');axis tight;
                        xlabel('time');ylabel('Amplitude');
                        XX1=fft(X,N);
                        subplot(222);
                        XX2=abs(XX1);
                        plot(f,XX2(1:N/2));title('Spectrum of input');axis tight;
                        xlabel('Frequency');ylabel('Amplitude');
                        [NN2 Wc2]=cheb1ord(Wp,Ws,Ap,As);
                        [b2 a2]=cheby1(NN2,Ap,Wc2,'high');
                        [H2 F2]=freqz(b2,a2,N,Fs);
                        subplot(223);
                        plot(F2,20*log10(abs(H2)/max(abs(H2))));title('H of Filter');
                        axis tight;xlabel('Frequency');ylabel('Gain in dB');
                        y2=filter(b2,a2,X);
                        HH2=fft(y2,N);
                        subplot(224);
                        HHH2=abs(HH2);
                        plot(f,HHH2(1:N/2));title('Output "y"');
                        axis tight;
                        xlabel('Frequency');ylabel('Amplitude');
                    
                    case 3
                        %chebysher type 2
                        figure ('Name','chebysher type 2 Filter');
                        subplot(221);
                        plot(t,X);title('Complex Input Signal');axis tight;
                        xlabel('time');ylabel('Amplitude');
                        XX1=fft(X,N);
                        subplot(222);
                        XX2=abs(XX1);
                        plot(f,XX2(1:N/2));title('Spectrum of input');axis tight;
                        xlabel('Frequency');ylabel('Amplitude');
                        [NN3 Wc3]=cheb2ord(Wp,Ws,Ap,As);
                        [b3 a3]=cheby2(NN3,As,Wc3,'high');
                        [H3 F3]=freqz(b3,a3,N,Fs);
                        subplot(223);
                        plot(F3,20*log10(abs(H3)/max(abs(H3))));title('H of Filter');
                        xlabel('Frequency');ylabel('Gain in dB');
                        axis tight;
                        y3=filter(b3,a3,X);
                        HH3=fft(y3,N);
                        subplot(224);
                        HHH3=abs(HH3);
                        plot(f,HHH3(1:N/2));title('Output "y"');
                        xlabel('Frequency');ylabel('Amplitude');
                        axis tight;
                end
                
            case 4
                disp('1.Butterworth Filter');
                disp('2.Chebyshev Type-I Filter');
                disp('3.Chebyshev Type-II Filter');
                Ch8=input('Enter choice:   ');
                Fp1=input('Enter Fp1  ');
                Fp2=input('Enter Fp2  ');
                Fss1=input('Enter Fs1  ');
                Fss2=input('Enter Fs2  ');
                Ap=input('Enter Ap  ');
                As=input('Enter As  ');
                Wp=[2*Fp1/Fs 2*Fp2/Fs];
                Ws=[2*Fss1/Fs 2*Fss2/Fs];
                for i=1:N/2;
                    f(i)=Fs*i/N;
                end
                switch Ch8
                    case 1
                    %Butterworth Filter
                    figure ('Name','Butterworth Filter');
                    subplot(221);
                    plot(t,X);title('Complex Input Signal');axis tight;
                    xlabel('time');ylabel('Amplitude');
                    XX1=fft(X,N);
                    subplot(222);
                    XX2=abs(XX1);
                    plot(f,XX2(1:N/2));title('Spectrum of input');axis tight;
                    xlabel('Frequency');ylabel('Amplitude');
                    [NN1 Wc1]=buttord(Wp,Ws,Ap,As);
                    [b1 a1]=butter(NN1,Wc1,'stop');
                    [H1 F1]=freqz(b1,a1,N,Fs);
                    subplot(223);
                    plot(F1,20*log10(abs(H1)/max(abs(H1))));title('H of Filter');
                    axis tight;xlabel('Frequency');ylabel('Gain in dB');
                    y1=filter(b1,a1,X);
                    HH1=fft(y1,N);
                    subplot(224);
                    HHH1=abs(HH1);
                    plot(f,HHH1(1:N/2));title('Output "y"');
                    xlabel('Frequency');ylabel('Amplitude');
                    axis tight;

                    case 2
                    %chebysher type 1
                    figure ('Name','chebysher type 1 Filter');
                    subplot(221);
                    plot(t,X);title('Complex Input Signal');axis tight;
                    xlabel('time');ylabel('Amplitude');
                    XX1=fft(X,N);
                    subplot(222);
                    XX2=abs(XX1);
                    plot(f,XX2(1:N/2));title('Spectrum of input');axis tight;
                    xlabel('Frequency');ylabel('Amplitude');
                    [NN2 Wc2]=cheb1ord(Wp,Ws,Ap,As);
                    [b2 a2]=cheby1(NN2,Ap,Wc2,'stop');
                    [H2 F2]=freqz(b2,a2,N,Fs);
                    subplot(223);
                    plot(F2,20*log10(abs(H2)/max(abs(H2))));title('H of Filter');
                    axis tight;xlabel('Frequency');ylabel('Gain in dB');
                    y2=filter(b2,a2,X);
                    HH2=fft(y2,N);
                    subplot(224);
                    HHH2=abs(HH2);
                    plot(f,HHH2(1:N/2));title('Output "y"');
                    axis tight;
                    xlabel('Frequency');ylabel('Amplitude');

                    case 3
                    %chebysher type 2
                    figure ('Name','chebysher type 2 Filter');
                    subplot(221);
                    plot(t,X);title('Complex Input Signal');axis tight;
                    xlabel('time');ylabel('Amplitude');
                    XX1=fft(X,N);
                    subplot(222);
                    XX2=abs(XX1);
                    plot(f,XX2(1:N/2));title('Spectrum of input');axis tight;
                    xlabel('Frequency');ylabel('Amplitude');
                    [NN3 Wc3]=cheb2ord(Wp,Ws,Ap,As);
                    [b3 a3]=cheby2(NN3,As,Wc3,'stop');
                    [H3 F3]=freqz(b3,a3,N,Fs);
                    subplot(223);
                    plot(F3,20*log10(abs(H3)/max(abs(H3))));title('H of Filter');
                    xlabel('Frequency');ylabel('Gain in dB');
                    axis tight;
                    y3=filter(b3,a3,X);
                    HH3=fft(y3,N);
                    subplot(224);
                    HHH3=abs(HH3);
                    plot(f,HHH3(1:N/2));title('Output "y"');
                    xlabel('Frequency');ylabel('Amplitude');
                    axis tight;
                end
                
            case 3
                disp('1.Butterworth Filter');
                disp('2.Chebyshev Type-I Filter');
                disp('3.Chebyshev Type-II Filter');
                Ch9=input('Enter choice:   ');
                Fp1=input('Enter Fp1  ');
                Fp2=input('Enter Fp2  ');
                Fss1=input('Enter Fs1  ');
                Fss2=input('Enter Fs2  ');
                Ap=input('Enter Ap  ');
                As=input('Enter As  ');
                Wp=[2*Fp1/Fs 2*Fp2/Fs];
                Ws=[2*Fss1/Fs 2*Fss2/Fs];
                for i=1:N/2;
                    f(i)=Fs*i/N;
                end
                switch Ch9
                    
                    case 1
                    %Butterworth Filter
                    figure ('Name','Butterworth Filter');
                    subplot(221);
                    plot(t,X);title('Complex Input Signal');axis tight;
                    xlabel('time');ylabel('Amplitude');
                    XX1=fft(X,N);
                    subplot(222);
                    XX2=abs(XX1);
                    plot(f,XX2(1:N/2));title('Spectrum of input');axis tight;
                    xlabel('Frequency');ylabel('Amplitude');
                    [NN1 Wc1]=buttord(Wp,Ws,Ap,As);
                    [b1 a1]=butter(NN1,Wc1,'bandpass');
                    [H1 F1]=freqz(b1,a1,N,Fs);
                    subplot(223);
                    plot(F1,20*log10(abs(H1)/max(abs(H1))));title('H of Filter');
                    axis tight;xlabel('Frequency');ylabel('Gain in dB');
                    y1=filter(b1,a1,X);
                    HH1=fft(y1,N);
                    subplot(224);
                    HHH1=abs(HH1);
                    plot(f,HHH1(1:N/2));title('Output "y"');
                    xlabel('Frequency');ylabel('Amplitude');
                    axis tight;

                    case 2
                    %chebysher type 1
                    figure ('Name','chebysher type 1 Filter');
                    subplot(221);
                    plot(t,X);title('Complex Input Signal');axis tight;
                    xlabel('time');ylabel('Amplitude');
                    XX1=fft(X,N);
                    subplot(222);
                    XX2=abs(XX1);
                    plot(f,XX2(1:N/2));title('Spectrum of input');axis tight;
                    xlabel('Frequency');ylabel('Amplitude');
                    [NN2 Wc2]=cheb1ord(Wp,Ws,Ap,As);
                    [b2 a2]=cheby1(NN2,Ap,Wc2,'bandpass');
                    [H2 F2]=freqz(b2,a2,N,Fs);
                    subplot(223);
                    plot(F2,20*log10(abs(H2)/max(abs(H2))));title('H of Filter');
                    axis tight;xlabel('Frequency');ylabel('Gain in dB');
                    y2=filter(b2,a2,X);
                    HH2=fft(y2,N);
                    subplot(224);
                    HHH2=abs(HH2);
                    plot(f,HHH2(1:N/2));title('Output "y"');
                    axis tight;
                    xlabel('Frequency');ylabel('Amplitude');
                    
                    case 3
                    %chebysher type 2
                    figure ('Name','chebysher type 2 Filter');
                    subplot(221);
                    plot(t,X);title('Complex Input Signal');axis tight;
                    xlabel('time');ylabel('Amplitude');
                    XX1=fft(X,N);
                    subplot(222);
                    XX2=abs(XX1);
                    plot(f,XX2(1:N/2));title('Spectrum of input');axis tight;
                    xlabel('Frequency');ylabel('Amplitude');
                    [NN3 Wc3]=cheb2ord(Wp,Ws,Ap,As);
                    [b3 a3]=cheby2(NN3,As,Wc3,'bandpass');
                    [H3 F3]=freqz(b3,a3,N,Fs);
                    subplot(223);
                    plot(F3,20*log10(abs(H3)/max(abs(H3))));title('H of Filter');
                    xlabel('Frequency');ylabel('Gain in dB');
                    axis tight;
                    y3=filter(b3,a3,X);
                    HH3=fft(y3,N);
                    subplot(224);
                    HHH3=abs(HH3);
                    plot(f,HHH3(1:N/2));title('Output "y"');
                    xlabel('Frequency');ylabel('Amplitude');
                    axis tight;
                end
        end          
end