%calculo de la fuente de corriente. Hallando la Rn
%%Rn = Vt/It
clear all;
%format long;
%Polarizacion del Zener
b3=80;%Beta del transistor del zener
vz=5.1;%voltaje del zener
icq3=2.997;%Corriente de polarizacion
vt3=0.025;%voltaje termico
va3=20;%Voltaje Early del transistor
vce3=4.45;%Voltaje de colector-emisor de transitor 3
rpi3=b3*vt3/icq3;
gm3=icq3/vt3;
re3=1.47;%Resistencia del emisor del transistor 3
rz=0.2347;%Resistencia de polarización de la fuente de corriente
rd=0.019;%resistencia dinamica del diodo zener a pequeñaa señal
r03=(va3+vce3)/icq3;
A=1/r03;
B=-(1/r03+gm3);
C=gm3;
D=0;
E=1/re3+1/rpi3;
F=-1/rpi3;
G=0;
H=-1/r03;
I=1/rpi3+1/rz+1/rd;
zrn=[A B C; D E F; G H I]^-1*[1; 1; 0];
fprintf('La resistencia Norton (Rn) de la fuente de corriente es: %f Kilo-Ohms \n',zrn(1))
fprintf('El valor de la Corriente Norton es: %f mA \n',icq3)
%Analisis a pequeña señal del par diferncial con ganancia v0/vdi
vt=0.025;%voltaje termico
b=80;%Beta del transistor del zener
icq=1.3677;%Corriente de polarización del transistor para el zener
va=20;%Voltaje Early del transistor
vce=7.55;%Voltaje de colector-emisor de transitor 3
rpi=b*vt/icq;
gm=icq/vt;
r0=(va+vce)/icq;
rg=0.052;%resistencia del generador
rc=5.52;%Resistencia del colector
rb=16.3;%Resistencia de la base
rl=19.1;%Resistencia de carga
gvl=1/2*gm*1/(1/r0+1/rc+1/rl);
gv=1/2*gm*1/(1/r0+1/rc);
fprintf('La ganancia de voltaje sin Rl y sin Rg es de %f v/v \n',gv)
fprintf('La ganancia de voltaje con Rl y sin Rg es de %f v/v \n',gvl)
%Modo comun
rpl=1/(1/rc+1/rl);
av=-((b*r0-2*zrn(1))*rpl)/(2*zrn(1)*(rpl+r0)+rpi*(2*zrn(1)+rpl+r0)+b*r0*2*zrn(1));
fprintf('La ganancia de voltaje en modo común es %f v/v \n',av)
CMRR=20*log10(abs(gvl/av));
fprintf('La ganancia CMRR es %f dB \n',CMRR)
%Cola resistiva
Rn=3.196;
fprintf('La ganancia de voltaje sin Rl y sin Rg es de %f v/v \n',gv)
fprintf('La ganancia de voltaje con Rl y sin Rg es de %f v/v \n',gvl)
av1=-((b*r0-2*Rn)*rpl)/(2*Rn*(rpl+r0)+rpi*(2*Rn+rpl+r0)+b*r0*2*Rn);
fprintf('La ganancia de voltaje en modo común es %f v/v \n',av1)
CMRR1=20*log10(abs(gvl/av1));
fprintf('La ganancia CMRR es %f dB \n',CMRR1)