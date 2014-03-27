clear all
f=10000*2*pi;
num=[0 0 0 1];
den=[1/f^3 2/f^2 2/f 1];
sys = tf(num,den);
figure
bode(sys);
num1=[1 0 0 0];
den1=[1 2*f 2*f^2 1*f^3];
sys1 = tf(num1,den1);
figure
bode(sys1);
%%---------------------------------------------------
f=8;
%Orden 1
b=1;%ancho de banda
num2=[b 0];
den2=[1 b f^2];
sys2 = tf(num2,den2);
figure
bode(sys2);
grid;
%Orden 2
num3=[3*b 0];
den3=[1 3*b (3*b+2*f^2) 3*b*f^2 f^4];
sys3 = tf(num3,den3);
figure
bode(sys3);
grid;
%%---------------------------------------------------
%Chebyshev
f1=10000*2*pi;
%Orden 1
b=1000000;%ancho de banda
num4=[1.97 0 1.97*f1^2];
den4=[1.97 b 1.97*f1^2];
sys4 = tf(num4,den4);
figure
bode(sys4);
grid;
%Orden 2
num5=[0.983 0 1.966*f1^2 0 0.983*f1^4];
den5=[1.10 1.10*b b^2+2.2*f1^2 1.10*b*f1^2 1.10*f1^4];
sys5 = tf(num5,den5);
figure
bode(sys5);
grid;
