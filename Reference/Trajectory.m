%clear;
syms t p v0 a ta T;
p = 2*pi*100/3;
v0 = 20;
a = 2;


v = v0;
ta = v/a;
Q1 = 0.5*a*ta.^2;
Q2 = p - Q1;
lm = (Q2-Q1)/v;
if (lm<0)
    lm = 0;
    Q1 = p/2;
    Q2 = p/2;
    ta = sqrt(Q1/(0.5*a));
    v = a*ta;
end
T = lm+2*ta;


t = linspace(0,T,1000);
t1 = t(1,(t(1,:)<=ta));
q1 = 0.5*a*t1.^2;
dq1 = a*t1;
ddq1 = a+t1*0;


t2 = t(1,((t(1,:)>ta) & (t(1,:)<=lm+ta)));
b0 = Q1 - v*ta;
q2 = b0 + v*t2;
dq2 = v+t2*0;
ddq2 = 0+t2*0;


t3 = t(1,(t(1,:)>lm+ta));
c1 = v*T/ta;
c0 = Q2- c1*(lm+ta) + 0.5*a*(lm+ta)^2;
q3 = c0 + c1*t3 - 0.5*a*t3.^2;
dq3 = c1-a*t3;
ddq3 = -a+t3*0;


q = [q1,q2,q3];
dq = [dq1,dq2,dq3];
ddq = [ddq1,ddq2, ddq3];
%plot(t,q,'r');
%figure;
%plot(t,dq);
%figure;
%plot(t,ddq,'g');

