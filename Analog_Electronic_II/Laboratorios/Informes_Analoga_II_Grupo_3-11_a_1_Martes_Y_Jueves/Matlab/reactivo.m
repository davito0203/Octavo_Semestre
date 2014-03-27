clear all;
format long eng;
%Valores del canal P
Vcc=12.02;%voltaje vcc de alimentacion
vtp=Vcc-10.51;%voltaje de activacion
vd=5.83;%voltaje de la compuerta
R=0.982;%resistencia
kp=(vd)/(R*(Vcc-vd-vtp)^2);%Calculo de kn prácticamente
i01=1.6;
vsg=sqrt(i01/kp)+vtp;
vcc=15;
ref=(vcc-vsg)/i01;
fprintf('La resistencia de referencia es de %f Kilo-Ohms\n',ref)
renf=6.8;%Valor para evaluar
fprintf('La corriente del espejo teorica es %f mA\n',i01)
syms i0 vsg;
j=solve('i0=kp*(vsg-vtp)^2','i0*renf+vsg=vcc','i0,vsg');
solve=eval([j.i0 j.vsg]);
%i0=(vcc - ((4*kn*renf*vcc - 4*kn*renf*vt + 1)^(1/2) + 2*kn*renf*vt - 1)/(2*kn*renf))/renf;
%vsg=((4*kn*renf*vcc - 4*kn*renf*vt + 1)^(1/2) + 2*kn*renf*vt - 1)/(2*kn*renf);
fprintf('El valor de la corriente calculada normalizada es %f mA\n',solve(2,1));
fprintf('El valor de Vsg calculado ajustado es %f V\n',solve(2,2));
%Analisis en señal
lamdan=0.3356;
lamdap=0.40415;
r02=(lamdap*solve(2,1))^-1;%Resistencia del espejo de corriente
fprintf('El valor de la resistencia Norton del espejo de corriente es %f Kilo-Ohms\n',r02);
rf=1000;
%valores del canal N
Vcc1=12.00;%voltaje vcc de alimentacion
vtn=Vcc1-10.79;%voltaje de activación
vd1=6.00;%voltaje de la comouerta
R1=0.982;%resistencia
kn=(Vcc1-vd)/(R1*(vd1-vtn)^2);%Calculo de kn prácticamente
gm=2*sqrt(kn*solve(2,1));
r0=(lamdan*solve(2,1))^-1;
gain=(1/rf-gm)/(1/rf+1/r0+1/r02);
fprintf('La ganancia de voltaje V0/Vi es %f V/V\n',gain);