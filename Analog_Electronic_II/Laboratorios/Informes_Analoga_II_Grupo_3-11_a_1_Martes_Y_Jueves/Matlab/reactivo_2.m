%Amplicador Mosfet diferencial con carga activa
%Analisis a pequeña señal
%Polarización del transistor, valores vt k(n,p), lamda
Vcc=12.02;%voltaje vcc de alimentacion
vtp3=Vcc-10.89;%voltaje de activaci�n
vd3=6.7;%voltaje de la compuerta
R3=1.490;%resistencia
%kp3=(vd3)/(R3*(Vcc-vd3-vtp3)^2);%Calculo de kn prácticamente
kp=0.247;
kn=0.279;
lamda=0.02;
vtp4=Vcc-10.89;%voltaje de activaci�n
vd4=6.7;%voltaje de la compuerta
R4=1.490;%resistencia
%kp4=(vd4)/(R4*(Vcc-vd4-vtp4)^2);%Calculo de kn prácticamente
%lamda4=0.04;
id=1;%corriente de polarización
%lamda1=0.04;%Voltaje Early
vtp1=Vcc-10.89;%voltaje de activaci�n
vd1=6.7;%voltaje de la compuerta
R1=1.490;%resistencia
%kp1=(vd1)/(R1*(Vcc-vd1-vtp1)^2);%Calculo de kn prácticamente
%lamda2=0.04;%Voltaje Early
vtp2=Vcc-10.89;%voltaje de activaci�n
vd2=6.7;%voltaje de la compuerta
R2=1.490;%resistencia
%kp2=(vd2)/(R2*(Vcc-vd2-vtp2)^2);%Calculo de kn prácticamente
%lamda5=0.04;%Voltaje Early
vtn5=Vcc-14.72;%voltaje de activación
vd5=8.09;%voltaje de la comouerta
R5=0.986;%resistencia
%kn5=(Vcc-vd5)/(R5*(vd5-vtn5)^2);%Calculo de kn prácticamente
%lamda6=0.04;
vtn6=Vcc-14.72;%voltaje de activación
vd6=8.09;%voltaje de la comouerta
R6=0.986;%resistencia
%kn6=(Vcc-vd6)/(R6*(vd6-vtn6)^2);%Calculo de kn prácticamente
%Analisis del circuito para ambas señales
rn=(lamda*id)^-1;
r01=(lamda*id)^-1;
gm1=2*sqrt(id*kp);
r02=(lamda*id)^-1;
gm2=2*sqrt(id*kp);
r05=(lamda*id)^-1;
gm5=2*sqrt(id*kn);
r06=(lamda*id)^-1;
gm6=2*sqrt(id*kn);
re=1/gm5;
%Modo Diferencial
A=1/r05+1/re+1/r01+gm1;
B=0;
D=gm6;
E=1/r02+1/r06+gm2;
F=1/2*gm1;
G=-1/2*gm2;
s1=[A B; D E]^-1*[F; G];
fprintf('La ganancia de voltaje en modo diferencial es %f V/V\n',s1(2));
%Modo comun
A1=gm1+1/r01+1/r05+1/re;
B1=-1/r01;
C1=0;
D1=0;
E1=1/r01+gm1;
F1=-(1/r01+1/(2*rn));
G1=0;
H1=0;
I1=gm6;
J1=0;
K1=-1/r02;
L1=1/r06+1/r02+gm2;
M1=0;
N1=0;
O1=-(1/r02+1/(2*rn));
P1=1/r02+gm2;
Q1=gm1;
R11=gm1;
S1=gm2;
T1=gm2;
s2=[A1 B1 C1 D1; E1 F1 G1 H1; I1 J1 K1 L1; M1 N1 O1 P1]^-1*[Q1; R11; S1; T1];
fprintf('La ganancia de voltaje en modo comun es %f V/V\n',s2(4));
%Rechazo a modo comun
cmmr=20*log10(abs(s1(2)/s2(4)));
fprintf('El rechazo a modo comun es %f dB \n',cmmr);