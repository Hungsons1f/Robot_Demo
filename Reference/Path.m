clear;
Robot_para;
Trajectory;
syms PosInstant Radius Thetas VelInstant Theta;
Thetas = 0;
Radius = 100;

PosInstant = q;
%Theta = linspace(0,2*pi, 100);
Theta = PosInstant/Radius + Thetas;

PosXInstant = Radius.*cos(Theta);
PosYInstant = Radius.*sin(Theta);
PosZInstant = q;%.*Theta/Theta;
PhiInstant = 0.*Theta/Theta;

Inverse;
theta1 = [t.', (-tta1.*180./pi).'];
theta2 = [t.', (tta2.*180./pi-90).'];
theta3 = [t.', (-tta3.*180./pi-90).'];
theta4 = [t.', (tta4.*180./pi).'];

figure;
plot(theta1(:,1), theta1(:,2));
hold on;
plot(theta2(:,1), theta2(:,2));
plot(theta3(:,1), theta3(:,2));
plot(theta4(:,1), theta4(:,2));
figure;
plot(t,tta1);
hold on;
plot(t,tta2);
plot(t,tta3);
plot(t,tta4);

%figure;
%plot(PosXInstant,PosYInstant);
%figure;
%plot(t,PosXInstant);
%hold on;
%plot(t,PosYInstant);

