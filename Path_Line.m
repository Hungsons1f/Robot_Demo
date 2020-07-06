function [out1, out2, out3, out4, T] = Path_Line(src, des, v, a, para)

p = sqrt((des(1) - src(1)).^2 + (des(2) - src(2)).^2 + (des(3) - src(3)).^2);
traj = Trajectory(p, v, a);
dpos = traj(:,2)./p; 
pos = src + dpos.*(des - src);

x = pos(:,1);
y = pos(:,2);
z = pos(:,3);
phi = pos(:,4).*pi./180;

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