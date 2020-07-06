function [out1, out2, out3, out4, T] = Path(p, v, a, r, para)

traj = Trajectory(p, v, a);
pos = traj(:,2);
tta = pos./r; %+ Thetas;

x = r.*cos(tta);
y = r.*sin(tta);
z = traj(:,2);%.*Theta/Theta;
phi = 0.*tta./tta;

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

%figure;
%plot(x,y);
%figure;
%plot(t,x);
%hold on;
%plot(t,y);
end