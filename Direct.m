function out = Direct(tta1, tta2, tta3, tta4, a) 
dh = [0 pi/2 a(1) tta1; 
        a(2) 0 0 tta2; 
        a(3) 0 0 tta3; 
        a(4) 0 0 tta4];
    
a10 = homo(dh(1,1),dh(1,2),dh(1,3),dh(1,4));
a21 = homo(dh(2,1),dh(2,2),dh(2,3),dh(2,4));
a32 = homo(dh(3,1),dh(3,2),dh(3,3),dh(3,4));
a43 = homo(dh(4,1),dh(4,2),dh(4,3),dh(4,4));

direct_mat = a10*a21*a32*a43;
%direct_mat = simplify(direct)
out = direct_mat;

function mat = homo(fa, fafa, fd, ftta)
    mat = [cos(ftta) -cos(fafa)*sin(ftta) sin(fafa)*sin(ftta) fa*cos(ftta);
            sin(ftta) cos(fafa)*cos(ftta) -sin(fafa)*cos(ftta) fa*sin(ftta);
            0 sin(fafa) cos(fafa) fd;
            0 0 0 1];
end
end