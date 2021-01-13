clear all
close all
home

% Condiciones iniciales de la cuerda
L=pi;
ntrozos=200;
ntrozos=ntrozos+2;
dq=L/(ntrozos-1);
Q=linspace(0,L+2*dq,ntrozos);
%U=sin(2*Q-dq);                     % Nótese que es necesario restar dq cada vez
U=abs(sin(3*Q-dq))-sin(3*Q-dq);     % introducimos Q para centrar la función.
u=U.*L./1000;                       % Disminuímos la energía de la cuerda (Fig.5)
m=5;
T=m/L;



tini=0;
tfin=10;
dt=0.0001;
t=[tini:dt:tfin];
npasos=length(t);

% Función integrante de la aceleración

% SD(1)=0;
% SD(ntrozos)=0;

% for p=2:ntrozos-1
% SD(p)=(u(p+1)+u(p-1)-2*u(p))/dq.^2;
% end


%Condiciones iniciales para RK4
ut=zeros(npasos,ntrozos);
vt=zeros(npasos,ntrozos);
at=zeros(npasos,ntrozos);

ut(1,:)=u;
vt(1,:)=linspace(0,0,ntrozos);
at(1,:)=SDcuerdaC2(u,ntrozos)./dq.^2;

%RK4
for n=2:npasos


kiu1=ut(n-1,:);
kiv1=vt(n-1,:);
kia1=SDcuerdaC2(kiu1,ntrozos)./dq.^2;

kiu2=kiu1+kiv1*dt/2;
kiv2=kiv1+kia1*dt/2;
kia2=SDcuerdaC2(kiu2,ntrozos)./dq.^2;

kiu3=kiu1+kiv2*dt/2;
kiv3=kiv1+kia2*dt/2;
kia3=SDcuerdaC2(kiu3,ntrozos)./dq.^2;

kiu4=kiu1+kiu3*dt;
kiv4=kiv1+kiv3*dt;
kia4=SDcuerdaC2(kiu4,ntrozos)./dq.^2;


ut(n,:)=ut(n-1,:)+dt/6*(kiv1+2*kiv2+2*kiv3+kiv4);
vt(n,:)=vt(n-1,:)+dt/6*(kia1+2*kia2+2*kia3+kia4);
at(n,:)=SDcuerdaC2(ut(n,:),ntrozos)./dq.^2;


end

% Se eliminan los trozos virtuales de la cuerda
ut(:,1)=[];
ut(:,ntrozos-1)=[];
vt(:,1)=[];
vt(:,ntrozos-1)=[];

ntrozos=200;
Q=linspace(0,pi,ntrozos);

% Gráfico Dinámico Unidimensional
for n=1:200:npasos
h=plot(Q,ut(n,:),'-','LineWidth',1.5);
axis ([0,pi,-0.05,0.05])
pause(0.005); %
delete(h);
end
