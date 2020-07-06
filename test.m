P = [1 0 0;0 1 0; 0 0 1];
T = [1 2 3];
tp = triangulation(T,P);
[c,r] = circumcenter(tp);
r
trisurf(tp);
hold on;
plot3(c(1),c(2),c(3),'r.');