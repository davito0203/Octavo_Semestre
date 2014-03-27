%%Amplificador Source común Fet. Una etapa
clear all;
format long;
vt=0.972;%voltaje de activación
vcc=11.99;%voltaje vcc de alimentacion
vd=7.09;%voltaje de la compuerta practica
R=0.984;%resistencia practica
kn=(vcc-vd)/(R*(vd-vt)^2);%Calculo de kn prácticamente
% w=1;%ancho del canal teorico
% l=1;%largo del canal teorico
% up=2;%movilidad treorica
% kn=1/2*w/l*up; teorico
%kn=0.0745;
lamda=0.004;%hace parte de la curva caracteristica
idq=3.417;%corriente colector operación en mA
r1=468.6;%resistencia en kilo ohms
r2=571.6;%resistencia en kilo ohms
rd=2.189;%resistencia colector en kilo ohms
rs=0.331;%resistencia emisor en kilo ohms
rl=99.1;%resistencia de carga en kilo ohms
rg=0.05;%resistencia del generador en kilo ohms
gm=2*sqrt(kn*idq);
r0=(lamda*idq)^-1;
%%ganancia voltaje
A=rg*(1/r1+1/r2+1/rg);
B=0;
C=gm;
D=1/r0+1/rd+1/rl;
sol=[A,B;C,D]^(-1)*[1;0];
fprintf('La ganancia Vg/Vi es: %f\n', sol(1))
fprintf('La ganancia V0/Vi es: %f\n', sol(2))
sol1=sol(2)/sol(1);
fprintf('La ganancia V0/Vg es: %f\n', sol1)
%%Impedancia de entrada
zin1=1/(1/r1+1/r2);
fprintf('La impedancia de entrada sin resistenica del generador es: %f\n', zin1)
zin2=rg+1/(1/r1+1/r2);
fprintf('La impedancia de entrada con resistenica del generador es: %f\n', zin2)
%%Impedancia de salida
zout=1/(1/r0+1/rd);
fprintf('La impedancia de salida es: %f\n', zout)