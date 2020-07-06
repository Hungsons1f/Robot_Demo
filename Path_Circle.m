function [out1, out2, out3, out4, T] = Path_Circle(srca, mid, desa, v, a, para)

src = [srca(1) srca(2) srca(3)];
des = [desa(1) desa(2) desa(3)];
tripoint = [src; mid; des];
trilink = [1 2 3];
triangle = triangulation(trilink, tripoint);
[cen, rad] = circumcenter(triangle);
%trisurf(triangle);
%hold on;
%plot3(cen(1),cen(2),cen(3),'r*');

ms = src - mid;
md = des - mid;
sd = sqrt((des(1) - src(1)).^2 + (des(2) - src(2)).^2 + (des(3) - src(3)).^2);
cosm = dot(ms,md)/(norm(ms)*norm(md));
if (cosm<=0)
    p = 2*rad*asin(sd/(2*rad));
else 
    p = 2*pi*rad - 2*rad*asin(sd/(2*rad));
end

zax = cross(md,ms); zax = zax/norm(zax);
xax = src - cen; xax = xax/norm(xax);
yax = cross(zax, xax); yax = yax/norm(yax);
homo = [xax 0; yax 0; zax 0; cen 1]';

traj = Trajectory(p, v, a);
dang = traj(:,2)./rad; 
pox = rad.*cos(dang);
poy = rad.*sin(dang);
poz = zeros(length(dang),1);
dump = ones(1,length(dang));
po = [pox'; poy'; poz'; dump];
pos = (homo*po)';

x = pos(:,1);
y = pos(:,2);
z = pos(:,3);
dpos = traj(:,2)./p;
ang = srca(4) + dpos.*(desa(4) - srca(4));
phi = ang.*pi./180;
%phi = zeros(length(dpos),1);

tta = Inverse(x, y, z, phi, para);
theta1 = [traj(:,1), (-tta(:,1).*180./pi)];
theta2 = [traj(:,1), (tta(:,2).*180./pi-90)];
theta3 = [traj(:,1), (-tta(:,3).*180./pi-90)];
theta4 = [traj(:,1), (tta(:,4).*180./pi)];

out1 = theta1;
out2 = theta2;
out3 = theta3;
out4 = theta4;
T = traj(length(traj),1);

figure;
plot3(x,y,z);
grid on;
%figure;
%plot(t,x);
%hold on;
%plot(t,y);
end