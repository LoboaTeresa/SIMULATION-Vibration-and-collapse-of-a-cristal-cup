% Representación 3D de la cuerda cerrada
close all

%Círculo
R=1.42;
%X=R*cos(2*Q)
%Y=R*sin(2*Q)

% Bucle de reproducción
for n=1:200:npasos
X=R*cos(2*Q)+100*ut(n,:).*cos(2*Q);
Y=R*sin(2*Q)+100*ut(n,:).*sin(2*Q);

h=plot(X,Y,'-','LineWidth',1.5);
axis([-2,2,-2,2])
%h=plot3(X,Y,ut(n,:),'-','LineWidth',1.5);
%axis ([-1.5,1.5,-1.5,1.5,-0.0001,0.007])

pause(0.0005); %

delete(h);
end

% Nótese que 