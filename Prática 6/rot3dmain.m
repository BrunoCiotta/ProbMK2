function rot3dmain(rot)

N = 74;   % - 2 ultimos algarimos do NUSP
theta = (-((90-N)/4))*(pi/180);,  % - Angulo theta em radianos

if rot==1
% Rotacao #1 - Em z de theta, depois em y de theta, depois em x de 4*theta (4x mais rapido)
rotord=123;
phi=[0:-pi/400:theta];
phi_x=[0:-pi/100:4*theta];
phizv=[phi phi(end)+0*phi phi(end)+0*phi];
phiyv=[0*phi phi phi(end)+0*phi];
phixv=[0*phi_x 0*phi_x phi_x];

elseif rot==2
% Rotacao #2 - Em z de theta, depois em y de theta, depois em x de 4*theta (4x mais rapido) simultaneamente
rotord=123;
phi=[0:-pi/400:theta];
phi_x=[0:-pi/100:4*theta];
phixv=[phi_x];
phiyv=[phi];
phizv=[phi];
else return;
end

for id=1:length(phixv)
    phix=phixv(id); phiy=phiyv(id); phiz=phizv(id);
    Rx = [1 0 0;0 cos(phix) -sin(phix);0 sin(phix) cos(phix)];
    Ry = [cos(phiy) 0 sin(phiy);0 1 0;-sin(phiy) 0 cos(phiy)];
    Rz = [cos(phiz) -sin(phiz) 0;sin(phiz) cos(phiz) 0;0 0 1];
    if rotord==321 R(:,:,id)=Rz*Ry*Rx;
    elseif rotord==123 R(:,:,id)=Rx*Ry*Rz;
    end
end

fcnrot3d(R)
