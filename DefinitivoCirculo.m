% Representación 3D de la copa que se rompe
Arrot=
n=1

while  max(ut(n,:),[],2)<Arot && n<npasos
R=1.5;
X=R*cos(2*Q);
Y=R*sin(2*Q);
h=plot3(X,Y,ut(n,:),'-r','LineWidth',1.5);
axis ([-1.5,1.5,-1.5,1.5,-0.0001,0.007])
pause(0.0005); %
delete(h);
n=n+200
end

rotura=n

for n= rotura:200:npasos
R=1.5;
X=R*cos(2*Q);
Y=R*sin(2*Q);
h=plot3(X,Y,ut(n,:),'-r','LineWidth',1.5);
axis ([-1.5,1.5,-1.5,1.5,-0.0001,0.007])
pause(0.0005); %
delete(h);
n=n+1
end
 

% Nótese que 