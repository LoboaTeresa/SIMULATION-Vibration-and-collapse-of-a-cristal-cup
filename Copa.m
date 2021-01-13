close all
a = 1.5;
b = 1.5;
c = 3;
t = linspace(0,2*pi,200);
p = linspace(0,pi,200);
[T,P] = meshgrid(t,p);
x = a*cos(T).*cos(P);
y = b*cos(T).*sin(P);
z = -(1-c*sin(T));

i=(z<0).*x+(z>0).*(-x/1.7);
j=(z<0).*y+(z>0).*-y/1.7;
k=(z<0).*z+(z>0).*-5;

[~,Fx] = gradient (abs(x.*y.*y.*x));
figure
s=surf(i,j,k,Fx,'EdgeColor','black')
shading interp;
axis([-2,2,-2,2,-7,1])
hold on


