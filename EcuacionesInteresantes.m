% Ecuaciones interesantes para cuerda
Q=linspace(0,pi,100);

% Pellizco Lambda 
u=-abs(Q-pi/2);

% Seno
u=sin(n*Q); % cualquier n

% Coseno
u=-cos(n*Q)+1; % n par

%Combinación senos y cosenos
u=-cos(2*Q)+1+sin(5*Q);

% notese que a mayor n, mayor número de pliegues. Senos y cosenos pueden sumarse
% para dar lugar a ondas más complejas.

% 2 pellizcos sinusoidales
u=abs(sin(2*Q));

% Pulso sinusoidal
y=abs(sin(3*x))-sin(3*x);

% Pulso triangular
k=1-3*abs(Q-pi/2); % Paso 1
u=(k+abs(k)); % Paso 2

% Pulso rectangular
u=sign(sin(2.9*Q+2.1*pi/2))