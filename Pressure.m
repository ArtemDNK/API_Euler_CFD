function rNodes = Pressure( Nodes )
% Давление
[Nx,Ny,Nz] = size(Nodes);
rNodes = Nodes;
for i = 2:Nx-1
    for j = 2:Ny-1
        for k = 1:Nz
            if Nodes(i,j,k).boundary == 'none'
                dx = 0.5.*(abs(Nodes(i-1,j,k).x-Nodes(i+1,j,k).x));
                dy = 0.5.*(abs(Nodes(i,j+1,k).y-Nodes(i,j-1,k).y));
                B = (Nodes(i-1,j,k).p + Nodes(i+1,j,k).p)./ (dx.^2);
                C = (Nodes(i,j-1,k).p + Nodes(i,j+1,k).p)./ (dy.^2);
                D = 2 ./ (dx.^2);
                E = 2 ./ (dy.^2);
                P = (B - Nodes(i,j,k).A + C) ./ (D + E);
                rNodes(i,j,k).p = P;
            end
        end
    end
end
end

