clc;
close all;
clear all;
x = input("Enter the first signal: ");

h = input("Enter the second signal: ");
L=length(x);
M=length(h);

N =6;

if L < N
    x = [x zeros(1, N-L)];
end

if M<N
h = [h zeros(1, N-M)];
end

X = zeros(1, N);
H = zeros(1, N);

for k = 0:N-1
    for n = 0:N-1
        X(k+1) = X(k+1) + x(n+1) * exp(-1j*2*pi*k*n/N);
        H(k+1) = H(k+1) + h(n+1) * exp(-1j*2*pi*k*n/N);
    end
end

Y = X .* H;
result = zeros(1, N);

for n = 0:N-1
    for k = 0:N-1
        result(n+1) = result(n+1) + Y(k+1) * exp(1j*2*pi*k*n/N);
    end
end

result = real(result) / N;

disp("Circular Convolution Result:");
disp(result);
figure;
stem(0:N-1, result);
xlabel('Index');
ylabel('Value');
title('Circular Convolution Result');
grid on;