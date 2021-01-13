% Análisis de energía EP,EK,ET

% Este análisis de energías es válido tanto para la cuerda abierta como la
% cuerda cerrada. En caso de que Octave no tenga suficiente memoria para 
% analizar los datos, 

% Energía cinética
EK=sum(m/(2*ntrozos).*(vt).^2,2);

% Energía potencial


EP=sum(diff(ut,1,2).^2,2)*T/2/dq;               


% ETotal
ET=EK+EP;  
k=min(ET);
threshold=linspace(k,k,npasos);

plot(t',EK,'-g',t',EP,'-r',t',ET,'-b',t',threshold,'k')

axis([0,6,0,0.0002])
title('Analisis de energia de la cuerda cerrada amortiguada' )
xlabel('Tiempo (s)')
ylabel('Energia (J)')
legend('Energia Cinetica','Energia Potencial', 'Energia Total')
%text(0.1,1.9*10^-4,'{\itError de ET} = 6.2746 %','Color','blue');
%'=6.2746 %'