%%Amplificador Base com�n BJT. Una etapa
clear all;
format long;
b=265;%beta del transistor
vt=0.025;%voltaje termico en volts
va=74.03;%voltaje Earli en volts
vce=5.574;%voltaje colector-emisor de operaci�n en volts
icq=2.278;%corriente colector operaci�n en mA
r1=13.03;%resistencia en kilo ohms
r2=61.52;%resistencia en kilo ohms
rc=2.225;%resistencia colector en kilo ohms
re=0.5136;%resistencia emisor en kilo ohms
rl=4.7;%resistencia de carga en kilo ohms
rg=0.05;%resistencia del generador en kilo ohms
rpi=b*vt/(icq*(b+1));
gm=icq/vt;
r0=(va+vce)/icq;
%%ganancia voltaje
A=rg*(1/re+1/rg+1/rpi+1/r0);
B=-rg/r0;
C=-(1/r0+gm);
D=1/r0+1/rc+1/rl;
sol=[A,B;C,D]^(-1)*[1;0];
fprintf('La ganancia Ve/Vi es: %f\n', sol(1))
fprintf('La ganancia V0/Vi es: %f\n', sol(2))
sol1=sol(2)/sol(1);
fprintf('La ganancia V0/Ve es: %f\n', sol1)
%%Impedancia de entrada
A1=1/re+1/r0+1/rpi;
B1=-1/r0;
C1=-(1/r0+gm);
D1=1/r0+1/rc+1/rl;
zin1=[A1,B1;C1,D1]^(-1)*[1;0];
fprintf('La impedancia de entrada sin resistenica del generador es: %f\n', zin1(1))
zin2=rg+zin1(1);
fprintf('La impedancia de entrada con resistenica del generador es: %f\n', zin2)
%%Impedancia de salida
A2=1/rc+1/r0;
B2=-(1/r0+gm);
C2=-1/r0;
D2=1/re+1/rpi+1/r0;
zout1=[A2,B2;C2,D2]^(-1)*[1;0];
fprintf('La impedancia de salida sin resistenica del generador es: %f\n', zout1(1))
re=1/(1/re+1/rg);
D2=1/re+1/rpi+1/r0;
zout2=[A2,B2;C2,D2]^(-1)*[1;0];
fprintf('La impedancia de salida con resistenica del generador es: %f\n', zout2(1))