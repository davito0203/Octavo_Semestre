%%Amplificador Gate común Fet. Una etapa
clear all;
format long;
vt=1.8;%voltaje de activación
vcc=11.94;%voltaje vcc de alimentacion
vd=4.777;%voltaje de la comouerta
R=1.964;%resistencia
kn=(vcc-vd)/(R*(vd-vt)^2);%Calculo de kn prácticamente
% w=1;%ancho del canal
% l=1;%largo del canal
% up=2;%movilidad
% kn=1/2*w/l*up;
lamda=0.004;%hace parte de la curva caracteristica
idq=3.3165;%corriente colector operación en mA
r1=464.8;%resistencia en kilo ohms
r2=562.6;%resistencia en kilo ohms
rd=2.2;%resistencia colector en kilo ohms
rs=0.3285;%resistencia emisor en kilo ohms
rl=9.94;%resistencia de carga en kilo ohms
rg=0.05;%resistencia del generador en kilo ohms
gm=2*sqrt(kn*idq);
rk=1/gm;
r0=(lamda*idq)^-1;
%%ganancia voltaje
A=rg*(1/rs+1/rk+1/r0+1/rg);
B=-rg/r0;
C=-(gm+1/r0);
D=1/r0+1/rd+1/rl;
sol=[A,B;C,D]^(-1)*[1;0];
fprintf('La ganancia Vs/Vi es: %f\n', sol(1))
fprintf('La ganancia V0/Vi es: %f\n', sol(2))
sol1=sol(2)/sol(1);
fprintf('La ganancia V0/Vs es: %f\n', sol1)
%%Impedancia de entrada
A1=1/rs+1/rk+1/r0;
B1=-1/r0;
C1=-(1/r0+gm);
D1=1/r0+1/rd+1/rl;
zin1=[A1,B1;C1,D1]^(-1)*[1;0];
fprintf('La impedancia de entrada sin resistenica del generador es: %f\n', zin1(2))
zin2=rg+zin1(1);
fprintf('La impedancia de entrada con resistenica del generador es: %f\n', zin2)
%%Impedancia de salida
A2=1/rd+1/r0;
B2=-(1/r0+gm);
C2=-1/r0;
D2=1/r0+1/rk+1/rs;
zout1=[A2,B2;C2,D2]^(-1)*[1;0];
fprintf('La impedancia de salida sin resistenica del generador es: %f\n', zout1(1))
rs=1/(1/rs+1/rg);
D2=1/rs+1/rk+1/r0;
zout2=[A2,B2;C2,D2]^(-1)*[1;0];
fprintf('La impedancia de salida con resistenica del generador es: %f\n', zout2(1))