% Brute force approach to compute N-point DFT
clc;
close all;
clear all;
% Define the input sequence x
x = input('Enter the sequence : '); % Replace this with your input sequence

% Length of the input sequence
N = length(x);

% Initialize DFT output vector
X = zeros(1, N);

% Compute DFT using the formula
for k = 0:N-1
    X(k+1) = 0; % Initialize the real part of X(k)
    for n = 0:N-1
        X(k+1) = X(k+1) + x(n+1) * exp(-1i * 2 * pi * k * n / N);
    end
end

% Magnitude and Phase plots
figure;

% Magnitude plot
subplot(2, 1, 1);
stem(0:N-1, abs(X), 'b', 'LineWidth', 1.5);
title('Magnitude Plot'); 
xlabel('Frequency (k)');
ylabel('|X(k)|');

% Phase plot
subplot(2, 1, 2);
stem(0:N-1, angle(X), 'r', 'LineWidth', 1.5);
title('Phase Plot');
xlabel('Frequency (k)');
ylabel('Phase (radians)');

% Adjust subplot layout
sgtitle('Magnitude and Phase Plots');

% Display the result
disp('Input sequence:');
disp(x);
disp('DFT result:');
disp(X);



