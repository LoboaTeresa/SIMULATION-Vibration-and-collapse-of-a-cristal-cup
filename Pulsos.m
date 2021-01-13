function[GP]=Golpecitos(xpasos,w,A,n,ntrozos)

GP=zeros(1,ntrozos);
r=rem(n,xpasos);
if r==(2000)
GP(1:ntrozos)=abs(sin(3*Q-dq))-sin(3*Q-dq);
else
GP(1)=0;
end

end