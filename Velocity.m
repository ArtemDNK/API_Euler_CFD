function rNodes = Velocity( dt, Nodes )
%Нахождение скоростей
ro = 1000;
[Nx,Ny,Nz] = size(Nodes);
rNodes = Nodes;
for i = 2:Nx-1
    for j = 2:Ny-1
        for k = 1:Nz
            if Nodes(i,j,k).boundary == 'none'
                A = (Nodes(i+1,j,k).p-Nodes(i-1,j,k).p)./(2.*ro.*(abs(Nodes(i-1,j,k).x-Nodes(i+1,j,k).x)));
                B = Nodes(i,j,k).u./dt;
                C = (Nodes(i,j,k).x.*(Nodes(i+1,j,k).u-Nodes(i-1,j,k).u))./(2.*(abs(Nodes(i+1,j,k).x-Nodes(i-1,j,k).x)));
                D = (Nodes(i,j,k).y.*(Nodes(i,j+1,k).u-Nodes(i,j-1,k).u))./(2.*(abs(Nodes(i,j+1,k).y-Nodes(i,j-1,k).y)));
                Ux = -dt.*(A-B+C+D);
                
                A1 = (Nodes(i,j+1,k).p-Nodes(i,j-1,k).p)./(2.*ro.*(abs(Nodes(i,j-1,k).y-Nodes(i,j+1,k).y)));
                B1 = Nodes(i,j,k).v./dt;
                C1 = (Nodes(i,j,k).x.*(Nodes(i+1,j,k).v-Nodes(i-1,j,k).v))./(2.*(abs(Nodes(i+1,j,k).x-Nodes(i-1,j,k).x)));
                D1 = (Nodes(i,j,k).y.*(Nodes(i,j+1,k).v-Nodes(i,j-1,k).v))./(2.*(abs(Nodes(i,j+1,k).y-Nodes(i,j-1,k).y)));
                Uy = -dt.*(A1-B1+C1+D1);

                rNodes(i,j,k).u = Ux;
                rNodes(i,j,k).v = Uy;
            end
        end
    end
end
end

