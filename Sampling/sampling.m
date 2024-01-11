clc;
clear all;
close all;

% Defining basic signal representation terms...
% defining sampling frequencies
f1 = 1000; 
f2 = 2000;
f3 = 3000;
% defining maximum frequencies
fm = max(f3, max(f1, f2));
% defining the time period
T = 1 / min(f3, min(f1, f2));
% defining the time range
t = 0:0.1*T:2*T;
% defining frequency range
f = 0:1/(0.1*T):1/(2*T);
% defining the composite signal (sum of cosine waves)
x = cos(2*pi*f1*t) + cos(2*pi*f2*t) + cos(2*pi*f3*t);

% Plotting the original signal
subplot(2,2,1);
plot(t, x,linewidth=4);
title('Original Signal');
xlabel('Time');
ylabel('Amplitude');
legend('21UEC095');

% Exact Sampling...
f_es = 2 * fm;
n1 = 0:1/f_es:2*T;
x1 = cos(2*pi*f1*n1) + cos(2*pi*f2*n1) + cos(2*pi*f3*n1);


% Plotting the exact sampled signal
subplot(2,2,2);
stem(n1, x1);
hold on;
plot(n1, x1, 'r',linewidth=4);
title('Exact Sampling');
xlabel('Time');
ylabel('Amplitude');
legend('21UEC095');

% Under Sampling...
f_us = 0.5 * fm;
n2 = 0:1/f_us:2*T;
x2 = cos(2*pi*f1*n2) + cos(2*pi*f2*n2) + cos(2*pi*f3*n2);

% Plotting the under-sampled signal
subplot(2,2,3);
stem(n2, x2);
hold on;
plot(n2, x2, 'r',linewidth=4);
title('Under Sampling');
xlabel('Time');
ylabel('Amplitude');
legend('21UEC095');

% Over Sampling...
f_os = 8 * fm;
n3 = 0:1/f_os:2*T;
x3 = cos(2*pi*f1*n3) + cos(2*pi*f2*n3) + cos(2*pi*f3*n3);

% Plotting the over-sampled signal
subplot(2,2,4);
stem(n3, x3);
hold on;
plot(n3, x3, 'r',linewidth=4);
title('Over Sampling');
xlabel('Time');
ylabel('Amplitude');
legend('21UEC095');