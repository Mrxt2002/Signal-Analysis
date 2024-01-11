 
%circular convolution.....
clc;
close all;
clear all;
seq1=input('enter seq1 : ');
l1=length(seq1);
seq2=input('enter seq2 : ');
l2=length(seq2);
N=max(l1,l2);
if N>l1
seq1=[seq1,zeros(1,N-l1)];
end
if N>l2
seq2=[seq2,zeros(1,N-l2)];
end
w=seq1';
for j=2:N
    for i=2:N
        w(1,j)=w(N,j-1);
        w(i,j)=w(i-1,j-1);
    end
end

disp(w);
y=w*seq2';
disp(y);

%displaying graph
figure;
stem(0:N-1, y);
xlabel('Index');
ylabel('Value');
title('Circular Convolution Result');
legend('21UEC095');
grid on;

%z=cconv(seq1,seq2,N);
%disp(z');