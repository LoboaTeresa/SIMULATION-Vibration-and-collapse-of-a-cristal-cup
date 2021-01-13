clear all
close all
home

% Condiciones iniciales de la cuerda
L=pi; %
ntrozos=200;
Q=linspace(0,L,ntrozos);
U=sin(2*Q);
u=U.*L./1000;
dq=L/(ntrozos-1);
m=5;    % Masa total de la cuerda (kg)   Nótese que T y m se suponen constantes
T=m/L;  % Tensión de la cuerda (N)       a lo largo de la cuerda
mu=1;   % Factor de amortiguamiento (s^-1)
xpasos=10;
w=2*pi/xpasos;
A=2;


tini=0;
tfin=10;
dt=0.0005;
t=[tini:dt:tfin];
npasos=length(t);

% Función integrante de la aceleración
% SD(1)=0;
% SD(ntrozos)=0;

% for p=2:ntrozos-1
% SD(p)=(u(p+1)+u(p-1)-2*u(p))/dq.^2;
% end

ut=zeros(npasos,ntrozos);
vt=zeros(npasos,ntrozos);
at=zeros(npasos,ntrozos);
%Condiciones iniciales para RK4

ut(1,:)=u;
vt(1,:)=linspace(0,0,ntrozos);
at(1,:)=(SDcuerda(u,ntrozos)./dq.^2)-(mu*vt(1,:))+Golpecitos(xpasos,w,A,0,ntrozos);

%RK4
for n=2:npasos

kiu1=ut(n-1,:);
kiv1=vt(n-1,:);
kia1=(SDcuerda(kiu1,ntrozos)./dq.^2)-(mu*kiv1)+Golpecitos(xpasos,w,A,n,ntrozos);

kiu2=kiu1+kiv1*dt/2;
kiv2=kiv1+kia1*dt/2;
kia2=(SDcuerda(kiu2,ntrozos)./dq.^2)-(mu*kiv2)+Golpecitos(xpasos,w,A,n,ntrozos);

kiu3=kiu1+kiv2*dt/2;
kiv3=kiv1+kia2*dt/2;
kia3=(SDcuerda(kiu3,ntrozos)./dq.^2)-(mu*kiv3)+Golpecitos(xpasos,w,A,n,ntrozos);

kiu4=kiu1+kiu3*dt;
kiv4=kiv1+kiv3*dt;
kia4=(SDcuerda(kiu4,ntrozos)./dq.^2)-(mu*kiv4)+Golpecitos(xpasos,w,A,n,ntrozos);


ut(n,:)=ut(n-1,:)+dt/6*(kiv1+2*kiv2+2*kiv3+kiv4);
vt(n,:)=vt(n-1,:)+dt/6*(kia1+2*kia2+2*kia3+kia4);
at(n,:)=(SDcuerda(ut(n,:),ntrozos)./dq.^2)-(mu*vt(n,:))+Golpecitos(xpasos,w,A,n,ntrozos);




end


% Reproducción de la simulación
salto=20
for n=1:salto:npasos
h=plot(Q,ut(n,:),'-','LineWidth',1.5);
axis ([0,pi,-0.05,0.05])
pause(0.005); %
delete(h);
end
% Si la simulación ocurre a una velocidad demasiado alta o baja, pruebe a
% cambiar el número de pasos "salto".