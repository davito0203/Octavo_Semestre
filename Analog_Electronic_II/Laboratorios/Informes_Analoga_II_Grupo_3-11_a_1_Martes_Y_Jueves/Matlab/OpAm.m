%Amplificador Operacional Inversor con ganancia G
clear all;
format long;
disp('\n Amplificador Inversor')
r1=input('Ingrese el valor de la resistencia R1: ');%Resistencia de la entrada inversora en Kilo-Ohms
r2=input('Ingrese el valor de la resistencia R2: ');%resistencia de realimentación en Kilo-Ohms
r3=input('Ingrese el valor de la resistencia R3: ');%Resistencia de la entrada no inversora en Kilo-Ohms
g=-r2/r1;%Calculo de la ganancia V/V
fprintf('El valor de la ganancia es de: %f V/V\n',g)
%Amplificador Operacional sumador inversor
%Primera entrada
disp('Amplificador Sumador Inversor')
r1=input('Ingrese el valor de la resistencia R1: ');%Resistencia de la primera entrada de voltaje
r2=input('Ingrese el valor de la resistencia R2: ');%resistencia de la segunda entrada de voltaje
r3=input('Ingrese el valor de la resistencia R3: ');%Resistencia de realimentacion
r4=input('Ingrese el valor de la resistencia R4: ');%Resitencia de la entrada no inversora
g1=-r3/r1;
fprintf('El valor de la ganancia 1 es de: %f V/V\n',g1)
g2=-r3/r2;
fprintf('El valor de la ganancia 2 es de: %f V/V\n',g2)
gt=-r3*(1/r1+1/r2);
fprintf('El valor de la ganancia Total es de: %f V/V\n',gt)