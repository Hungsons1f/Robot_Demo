clear;
syms t p v0 a tc T;
p = 20;
v0 = 2;
a = 1;


tc = v0/a; 
T = p/v0 + 2*tc;
td = T - 2*tc;
a1 = a/tc;
t = linspace(0,T,1000);

t1 = t(1,(t(1,:)<=tc));
q1 = (a1*t1.^3)/6;
dq1 = 0.5*a1*t1.^2;
ddq1 = a1*t1;


t2 = t(1,((t(1,:)>tc) & (t(1,:)<=2*tc)));
pc = (a1*tc.^3)/6;
px = pc - a1*tc^3/6 + v0*tc;
q2 = -a1*(t2-2*tc).^3/6 + v0*(t2-2*tc) + px;
dq2 = -0.5*a1*(t2-2*tc).^2 + v0;
ddq2 = -a1*(t2-2*tc);


t3 = t(1,((t(1,:)>2*tc) & (t(1,:)<=td)));
q3 = px + v0*(t3 - 2*tc);
dq3 = v0 + t3*0;
ddq3 = 0+t3*0;

t4 = t(1,((t(1,:)>td) & (t(1,:)<=td+tc)));
q4 = -a1*(t4-td).^3/6 + v0*(t4-td) + p - px;
dq4 = -0.5*a1*(t4-td).^2 + v0;
ddq4 = -a1*(t4-td);

t5 = t(1,(t(1,:)>=td+tc));
q5 = (a1*(t5- T).^3)/6 + p;
dq5 = 0.5*a1*(t5 - T).^2;
ddq5 = a1*(t5 - T);

q = [q1 q2 q3 q4 q5];
dq = [dq1 dq2 dq3 dq4 dq5];
ddq = [ddq1 ddq2 ddq3 ddq4 ddq5];
plot(t,q,'r');
figure;
plot(t,dq);
figure;
plot(t,ddq,'g');
%figure;
%x = linspace(-10,10,1000);
%q2x = -a1*(x-2*tc).^3/6 + v0*(x-2*tc) ;
%plot(x,q2x);
%grid on
