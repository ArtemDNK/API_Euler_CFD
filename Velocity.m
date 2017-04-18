function rNodes = Velocity( dt, Nodes )
%Нахождение скоростей
ro = 1000;
[Nx,Ny,Nz] = size(Nodes);
rNodes = Nodes;
for i = 1:Nx
    for j = 1:Ny
        for k = 1:Nz
            if Nodes(i,j,k).boundary == 0
                if ((i == 1)&&(j~=Ny)&&(j == 1)&&(i~=Nx))
                    A = (Nodes(i+1,j,k).p-Nodes(i,j,k).p)./(1.*ro.*(abs(Nodes(i+1,j,k).x-Nodes(i,j,k).x)));
                    B = Nodes(i,j,k).u./dt;
                    C = Nodes(i,j,k).u .* Nodes(i,j,k).dudx;
                    D = Nodes(i,j,k).v.* Nodes(i,j,k).dudy;
                    Ux = -dt.*(A-B+C+D);
                    
                    A1 = (Nodes(i,j+1,k).p-Nodes(i,j,k).p)./(1.*ro.*(abs(Nodes(i,j+1,k).y-Nodes(i,j,k).y)));
                    B1 = Nodes(i,j,k).v./dt;
                    C1 = Nodes(i,j,k).u .* Nodes(i,j,k).dvdx;
                    D1 = Nodes(i,j,k).v.* Nodes(i,j,k).dvdy;
                    Uy = -dt.*(A1-B1+C1+D1);
                    
                    rNodes(i,j,k).u = Ux;
                    rNodes(i,j,k).v = Uy;
                    
                elseif ((i == Nx)&&(j ~= 1)&&(j == Ny)&&(i ~= 1))
                    A = (Nodes(i,j,k).p-Nodes(i-1,j,k).p)./(1.*ro.*(abs(Nodes(i,j,k).x-Nodes(i-1,j,k).x)));
                    B = Nodes(i,j,k).u./dt;
                    C = Nodes(i,j,k).u .* Nodes(i,j,k).dudx;
                    D = Nodes(i,j,k).v.* Nodes(i,j,k).dudy;
                    Ux = -dt.*(A-B+C+D);
                    
                    A1 = (Nodes(i,j,k).p-Nodes(i,j-1,k).p)./(1.*ro.*(abs(Nodes(i,j,k).y-Nodes(i,j-1,k).y)));
                    B1 = Nodes(i,j,k).v./dt;
                    C1 = Nodes(i,j,k).u .* Nodes(i,j,k).dvdx;
                    D1 = Nodes(i,j,k).v.* Nodes(i,j,k).dvdy;
                    Uy = -dt.*(A1-B1+C1+D1);
                    
                    rNodes(i,j,k).u = Ux;
                    rNodes(i,j,k).v = Uy;
                    
                elseif (i > 1 && i < Nx && j > 1 && j < Ny)
                    A = (Nodes(i+1,j,k).p-Nodes(i-1,j,k).p)./(1.*ro.*(abs(Nodes(i+1,j,k).x-Nodes(i-1,j,k).x)));
                    B = Nodes(i,j,k).u./dt;
                    C = Nodes(i,j,k).u .* Nodes(i,j,k).dudx;
                    D = Nodes(i,j,k).v.* Nodes(i,j,k).dudy;
                    Ux = -dt.*(A-B+C+D);
                    
                    A1 = (Nodes(i,j+1,k).p-Nodes(i,j-1,k).p)./(1.*ro.*(abs(Nodes(i,j+1,k).y-Nodes(i,j-1,k).y)));
                    B1 = Nodes(i,j,k).v./dt;
                    C1 = Nodes(i,j,k).u .* Nodes(i,j,k).dvdx;
                    D1 = Nodes(i,j,k).v.* Nodes(i,j,k).dvdy;
                    Uy = -dt.*(A1-B1+C1+D1);
                    
                    rNodes(i,j,k).u = Ux;
                    rNodes(i,j,k).v = Uy;
                end
            end
        end
    end
end
end

