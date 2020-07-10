clear;
para = Robot_para();

%i = Inverse(x,y,z,phi, para)
%j = Direct(i(1),i(2),i(3),i(4), para);
%k = Trajectory(2*pi*100, 20, 1);
%[theta1, theta2, theta3, theta4, T] = Path(2*pi*100/3,100,50,100,para);
[theta1, theta2, theta3, theta4, T] = Path_Line([150 150 0 0],[0 200 150 0],150,80,para);
%[theta1, theta2, theta3, theta4, T] = Path_Circle([274 0 204.5 0],[0 170 100], [-100 0.001 0 -90],4000,2000,para);
sim('OpenMan.slx');