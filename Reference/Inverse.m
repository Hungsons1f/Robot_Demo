%clear;
Robot_para;
syms x y z phi;
%syms a2 a3 a4 d1;

%x = PosXInstant;
%y = PosYInstant;
%z = PosZInstant;
%phi = PhiInstant;
x= [100; 150; 170];
y= [100; 120; 130];
z= [100; 160; 140];
phi= [0; 0; 0];

tta1 = atan2(y,x)
px = x - a4.*cos(tta1).*cos(phi);
py = y - a4.*sin(tta1).*cos(phi);
pz = z - a4.*sin(phi);

c3 = (px.^2 + py.^2 + (pz - d1).^2 - a2.^2 - a3.^2)/(2*a2*a3);
s3 = -sqrt(1-c3.^2);
tta3 = atan2(s3,c3)

A = (a2+a3.*c3);
B = a3.*s3;
C = sqrt(px.^2 + py.^2);
D = pz - d1;
c2 = C.*A + D.*B;
s2 = D.*A - C.*B;
tta2 = atan2(s2,c2)

tta4 = phi - tta2 -tta3
%t = 0;
%theta1 = [t, tta1*180/pi]
%theta2 = [t, tta2*180/pi]
%theta3 = [t, tta3*180/pi]
%theta4 = [t, tta4*180/pi]

%Direct;
%sim('OpenMan.slx');