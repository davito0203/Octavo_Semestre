clear all;
format long;
id=2;
vcc=14.94;
R=0.986;
vt=vcc-13.7;
%Fet 345
vd=6.90;
kn1=(vcc-vd)/(R*(vd-vt)^2);
%Fet 678
vcc=14.94;
vd=6.71;
kn2=(vcc-vd)/(R*(vd-vt)^2);
%calculo del circuito
vgs=vt+sqrt(id/kn1);
vcc=12;%inicial
fprintf('El valor de Vgs es: %f\n',vgs)
Rref=(vcc-vgs)/id;
fprintf('El valor de la resistencia de referencia es: %f\n',Rref)
Rref=3.9;
i=(vcc-vgs)/Rref;
fprintf('El valor de la corriente es: %f mA\n',i)
%calculo de RL
rl=((vt-vgs)+vcc)/2;
fprintf('El valor máximo para la resistencia de carga es: %f\n',rl)