clc;
close all;
clear all;

x = input('Enter  sequence : ');
N = length(x);
C= fft(x,N);

disp('DFT sequence is :');
disp(C);
for n = 0:N-1
    x_n = 0; % Initialize x_n for the current n
    for k = 0:N-1
        x_n = x_n + x(k+1) * exp(1i * 2 * pi * k * n / N);
    end
    x(n+1) = x_n / N;
end
disp(x_n);
P= ifft(C,N);
disp('IDFT sequence is :')
disp(P);
% Magnitude
subplot(2, 2, 1)
stem(0:N-1, abs(P));
title('Magnitude');
xlabel('Frequency');
ylabel('|X[K]|');

% Phase
subplot(2, 2, 2)
stem(0:N-1, angle(P));
title('Phase');
xlabel('Angle');
ylabel('∠X[K]');

% Original DFT sequence
subplot(2, 2, 3)
stem(0:N-1, abs(P));
title('Original DFT Magnitude');
xlabel('Frequency');
ylabel('|X[K]|');

subplot(2, 2, 4)
stem(0:N-1, angle(P));
title('Original DFT Phase');
xlabel('Angle');
ylabel('∠X[K]');
