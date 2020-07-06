function out = Inverse(x, y, z, phi, a)

tta1 = atan2(y,x);
px = x - a(4).*cos(tta1).*cos(phi);
py = y - a(4).*sin(tta1).*cos(phi);
pz = z - a(4).*sin(phi);

c3 = (px.^2 + py.^2 + (pz - a(1)).^2 - a(2).^2 - a(3).^2)/(2*a(2)*a(3));
s3 = -sqrt(1-c3.^2);
tta3 = atan2(s3,c3);

A = (a(2)+a(3).*c3);
B = a(3).*s3;
C = sqrt(px.^2 + py.^2);
D = pz - a(1);
c2 = C.*A + D.*B;
s2 = D.*A - C.*B;
tta2 = atan2(s2,c2);

tta4 = phi - tta2 -tta3;

array = [tta1 tta2 tta3 tta4];
out = array;
end
