    ...MUHAMMET ASIM UYANIK...
    ...1801022012...
    clc;
    clear all;
    % Define Equations
    t=-20:0.001:20;
    c=5*cos(400*pi*t);  
    m=rectangularPulse(t-(1/2))-rectangularPulse(t-(3/2));
    kf=50;
    
    ...1) Plot the message signal. Obtain and plot the magnitude spectrum of the message signal. 
    % Message Signal m(t)
    figure(1)
    plot(t,m);
    title('m(t)')
    xlabel('t(s)')
    ylabel('|m(t)|')
    xlim([-1 3])
    grid on;
    
    % Message Signal Fourier Transform m(f)
    N = length(m);
    f = linspace(-500,500,N);
    Mf = fftshift(fft(m)/N);
    figure(2);
    plot(f,abs(Mf));
    title('Message Signal Fourier m(f)')
    xlabel('f(hz)')
    ylabel('|m(f)|')
    grid on;
    xlim([-50 50])
    
    ...2) Obtain and plot the time-domain representation and magnitude spectrum of the phase ∅(𝑡).
    %fi=2*pi*kf*int((rectangularPulse(x-(1/2))-rectangularPulse(x-(3/2))),0,2); %çalışmadı
    
    fi=2*pi*kf*(triangularPulse(t-1)); % 2πkf∫m(T)dT
    figure(3)
    plot(t,fi);
    title('∅(t)')
    xlabel('t(s)')
    ylabel('|∅(t)|')
    grid on;
    
    % ∅(t) Fourier Transform ∅(f)
    N1 = length(fi);
    f1 = linspace(-500,500,N1);
    Fi1 = fftshift(fft(fi)/N1);
    figure(4);
    plot(f1,abs(Fi1));
    title('∅(f)')
    xlabel('f(hz)')
    ylabel('|∅(f)|')
    grid on;
    xlim([-10 10])
    
    ...3) Obtain and plot the time-domain representation and magnitude spectrum of the modulated signal 𝑦(𝑡). 
    y=5*cos(400*pi*t+fi);
    figure(5)
    plot(t,y,t,m);
    legend('y(t)','m(t)');
    title('y(t)')
    xlabel('t(s)')
    ylabel('|y(t)|')
    grid on;
    hi=hilbert(y);

    % y(t) Fourier Transform y(f)
    N2 = length(y);
    f2 = linspace(-500,500,N2);
    Yf = fftshift(fft(y)/N2);
    figure(6);
    plot(f2,abs(Yf));
    title('y(f)')
    xlabel('f(hz)')
    ylabel('|y(f)|')
    grid on;
    xlim([-10 10])
    
    ...4) Obtain and plot the time-domain representation and magnitude spectrum of the signal
    ...at each step of the demodulator. (Do the filtering in frequency domain.) Comment on
    ...the signal at each step. Compare the message signal and demodulated signal, and comment on them
    
    % % BP LIMITER (çalışmadı)
    % for i=1:N2
    %     if y(i)>1
    %         y(i)=0;
    %     end
    %     if y(i)<-1
    %         y(i)=0;
    %     end
    % end
    % figure(7)
    % plot(t,y);
    % title('After BP Limiter Yfm(t)')
    % xlabel('t(s)')
    % ylabel('|Yfm(t)|')
    % grid on;
    % xlim([-1 1])
    
    dy=diff(y);
    dy=[dy 0];
    figure(7)
    plot(t,dy);
    title('after d/dt dy(t)')
    xlabel('t(s)')
    ylabel('|dy(t)|')
    grid on;
    
    figure(8)
    [up,low] = envelope(dy);...Envelope dedektörü
    plot(t,up,t,low,t,m,'linewidth',1.5)
    legend('up','low','m(t)');
    title('m(t)')
    xlabel('t(s)')
    ylabel('|m(t)|')
    grid on;
    
    dhi=diff(hi);
    dhi=[dhi 0];
    figure(9)
    plot(t,abs(dhi)-5.87775);...DC Bileşeni çıkardım.
    title('m(t)')
    xlabel('t(s)')
    ylabel('|m(t)|')
    grid on;
