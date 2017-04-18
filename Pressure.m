function rNodes = Pressure( Nodes )
% Давление
[Nx,Ny,Nz] = size(Nodes);
rNodes = Nodes;
for i = 1:Nx
    for j = 1:Ny
        for k = 1:Nz
            if Nodes(i,j,k).boundary == 0
                if ((i == 1)&&(j~=Ny)&&(j == 1)&&(i~=Nx))
                    dx = 0.5.*(abs(Nodes(i+1,j,k).x-Nodes(i,j,k).x));
                    dy = 0.5.*(abs(Nodes(i,j+1,k).y-Nodes(i,j,k).y));
                    B = (Nodes(i+1,j,k).p + Nodes(i,j,k).p)./ (dx.^2);
                    C = (Nodes(i,j+1,k).p + Nodes(i,j,k).p)./ (dy.^2);
                    D = 2 ./ (dx.^2);
                    E = 2 ./ (dy.^2);
                    P = (B - Nodes(i,j,k).A + C) ./ (D + E);
                    rNodes(i,j,k).p = P;
                    
                elseif ((i == Nx)&&(j ~= 1)&&(j == Ny)&&(i ~= 1))
                    dx = 0.5.*(abs(Nodes(i,j,k).x-Nodes(i-1,j,k).x));
                    dy = 0.5.*(abs(Nodes(i,j,k).y-Nodes(i,j-1,k).y));
                    B = (Nodes(i,j,k).p + Nodes(i-1,j,k).p)./ (dx.^2);
                    C = (Nodes(i,j,k).p + Nodes(i,j-1,k).p)./ (dy.^2);
                    D = 2 ./ (dx.^2);
                    E = 2 ./ (dy.^2);
                    P = (B - Nodes(i,j,k).A + C) ./ (D + E);
                    rNodes(i,j,k).p = P;
                    
                elseif (i > 1 && i < Nx && j > 1 && j < Ny)
                    dx = 0.5.*(abs(Nodes(i+1,j,k).x-Nodes(i-1,j,k).x));
                    dy = 0.5.*(abs(Nodes(i,j+1,k).y-Nodes(i,j-1,k).y));
                    B = (Nodes(i+1,j,k).p + Nodes(i-1,j,k).p)./ (dx.^2);
                    C = (Nodes(i,j+1,k).p + Nodes(i,j-1,k).p)./ (dy.^2);
                    D = 2 ./ (dx.^2);
                    E = 2 ./ (dy.^2);
                    P = (B - Nodes(i,j,k).A + C) ./ (D + E);
                    rNodes(i,j,k).p = P;
                end
            end
        end
    end
end
end

