% Representación 3D de la cuerda cerrada
close all

% Copa
a=1.5;
c = 3;
h = linspace(0,2*pi,200);
p = linspace(0,pi,200);
[H,P] = meshgrid(h,p);
x = a*cos(H).*cos(P);
y = a*cos(H).*sin(P);
z = -(1-c*sin(H));

i=(z<0).*x+(z>0).*-x/1.7;
%i=(z<0).*x+(z>0).*-x/1.7;
j=(z<0).*y+(z>0).*-y/1.7;
k=(z<0).*z+(z>0).*-5;
[~,Fx] = gradient (abs(x.*y));
s=surf(i,j,k,Fx,'EdgeColor','black');
shading interp;
%'FaceColor', 'cyan'
%Círculo
R=1.4;


for n=1:500:npasos
s;
X=R*cos(2*Q)+50*ut(n,:).*cos(2*Q);
Y=R*sin(2*Q)+50*ut(n,:).*sin(2*Q);
axis([-2,2,-2,2,-7,1])
hold on


h=plot(X,Y,'-','LineWidth',1.5);
% axis ([-1.5,1.5,-1.5,1.5,-0.0001,0.007])

pause(0.0005); %

delete(h);
end

% Nótese que 