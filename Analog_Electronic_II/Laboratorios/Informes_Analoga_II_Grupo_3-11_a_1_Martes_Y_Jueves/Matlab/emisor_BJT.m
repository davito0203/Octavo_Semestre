%%Amplificador Emisor común BJT. Una etapa
clear all;
format long;
b=265;%beta del transistor
vt=0.025;%voltaje termico en volts
va=74.03;%voltaje Earli en volts
vce=5.574;%voltaje colector-emisor de operación en volts
icq=2.278;%corriente colector operación en mA
r1=13.03;%resistencia en kilo ohms
r2=61.52;%resistencia en kilo ohms
rc=2.225;%resistencia colector en kilo ohms
re=0.5136;%resistencia emisor en kilo ohms
rl=4.7;%resistencia de carga en kilo ohms
rg=0.05;%resistencia del generador en kilo ohms
rpi=vt*b/icq;
gm=icq/vt;
r0=(va+vce)/icq;
%%ganancia voltaje
A=1+rg/r1+rg/r2+rg/rpi;
B=0;
C=gm;
D=1/r0+1/rc+1/rl;
sol=[A,B;C,D]^(-1)*[1;0];
fprintf('La ganancia Vb/Vi es: %f\n', sol(1))
fprintf('La ganancia V0/Vi es: %f\n', sol(2))
sol1=sol(2)/sol(1);
fprintf('La ganancia V0/Vb es: %f\n', sol1)
%%Impedancia de entrada
zin1=1/(1/r1+1/r2+1/rpi);
fprintf('La impedancia de entrada sin resistenica del generador es: %f\n', zin1)
zin2=rg+1/(1/r1+1/r2+1/rpi);
fprintf('La impedancia de entrada con resistenica del generador es: %f\n', zin2)
%%Impedancia de salida
zout=1/(1/r0+1/rc);
fprintf('La impedancia de salida es: %f\n', zout)