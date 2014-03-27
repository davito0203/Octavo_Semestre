%%Amplificador Drane com�n Fet. Una etapa
clear all;
format long;
vcc=14.96;%voltaje vcc de alimentacion
vt=vcc-14.71;%voltaje de activaci�n
vd=8.05;%voltaje de la comouerta
R=0.986;%resistencia
kn=(vcc-vd)/(R*(vd-vt)^2);%Calculo de kn pr�cticamente
% w=1;%ancho del canal
% l=1;%largo del canal
% up=2;%movilidad
% kn=1/2*w/l*up;
lamda=0.004;%hace parte de la curva caracteristica
idq=7.43/2.189;%corriente colector operaci�n en mA
r1=468.6;%resistencia en kilo ohms
r2=571.6;%resistencia en kilo ohms
rd=2.189;%resistencia colector en kilo ohms
rs=0.331;%resistencia emisor en kilo ohms
rl=100.3;%resistencia de carga en kilo ohms
rg=0.05;%resistencia del generador en kilo ohms
gm=2*sqrt(kn*idq);
r0=(lamda*idq)^-1;
%%ganancia voltaje
a=1/(1/r1+1/r2);
sol=a/(rg+a);
fprintf('La ganancia Vg/Vi es: %f\n', sol)
sol2=1/((1/gm)*((1/r0+1/rs+1/rl)+1));
sol1=sol*sol2;
fprintf('La ganancia V0/Vi es: %f\n', sol1)
fprintf('La ganancia V0/Vg es: %f\n', sol2)
%%Impedancia de entrada
zin1=1/(1/r1+1/r2);
fprintf('La impedancia de entrada sin resistenica del generador es: %f\n', zin1)
zin2=rg+zin1(1);
fprintf('La impedancia de entrada con resistenica del generador es: %f\n', zin2)
%%Impedancia de salida
zout1=1/(1/r0+1/rs);
fprintf('La impedancia de salida sin resistenica del generador es: %f\n', zout1)