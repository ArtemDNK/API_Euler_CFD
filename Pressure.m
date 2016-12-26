function rNodes = Pressure( Nodes )
% Давление
[Nx,Ny,Nz] = size(Nodes);
rNodes = Nodes;
for i = 2:Nx-1
    for j = 2:Ny-1
        for k = 1:Nz
            if Nodes(i,j,k).boundary == 'none'
                hxL = (abs(Nodes(i,j,k).x-Nodes(i-1,j,k).x));
                hxR = (abs(Nodes(i+1,j,k).x-Nodes(i,j,k).x));
                hyL = (abs(Nodes(i,j,k).y-Nodes(i,j-1,k).y));
                hyR = (abs(Nodes(i,j+1,k).y-Nodes(i,j,k).y));
                B1 = Nodes(i-1,j,k).p./hxR;
                B2 = Nodes(i+1,j,k).p./hxL;
                C1 = Nodes(i,j-1,k).p./hyR;
                C2 = Nodes(i,j+1,k).p./hyL;
                D1 = 1./hxL;
                D2 = 1./hxR;
                E1 = 1./hyL;
                E2 = 1./hyR;
                B = (B1+B2)/(hxR./2+hxL./2);
                C = (C1+C2)/(hyR./2+hyL./2);
                D = (D1+D2)/(hxR./2+hxL./2);
                E = (E1+E2)/(hyR./2+hyL./2);
                P = (B-(Nodes(i,j,k).A)+C)./(D+E);
                rNodes(i,j,k).p = P;
            end
        end
    end
end
end

