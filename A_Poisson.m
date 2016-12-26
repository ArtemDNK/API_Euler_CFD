function rNodes = A_Poisson( dt, Nodes )
% Правая часть уравнения Пуассона
[Nx,Ny,Nz] = size(Nodes);
rNodes = Nodes;
ro = 1000;
for i = 2:Nx-1
    for j = 2:Ny-1
        for k = 1:Nz
            if Nodes(i,j,k).boundary == 'none'
                D = (Nodes(i,j,k).Div-Nodes(i,j,k).Div)./dt;
                B1 = 2.*((Nodes(i,j+1,k).u-Nodes(i,j-1,k).u)./(2.*(abs(Nodes(i,j-1,k).y-Nodes(i,j+1,k).y))));
                B2 = ((Nodes(i+1,j,k).v-Nodes(i-1,j,k).v)./(2.*(abs(Nodes(i-1,j,k).x-Nodes(i+1,j,k).x))));
                C1 = (((Nodes(i+1,j,k).u-Nodes(i-1,j,k).u)./(2.*(abs(Nodes(i-1,j,k).x-Nodes(i+1,j,k).x)))).^2);
                C2 = (((Nodes(i,j+1,k).v-Nodes(i,j-1,k).v)./(2.*(abs(Nodes(i,j+1,k).y-Nodes(i,j-1,k).y)))).^2);
                E1 = Nodes(i,j,k).u.*((Nodes(i+1,j,k).u-2.*Nodes(i,j,k).u+Nodes(i-1,j,k).u)./(2.*(abs(Nodes(i-1,j,k).x-Nodes(i+1,j,k).x))).^2);
                E2 = Nodes(i,j,k).v.*((Nodes(i,j+1,k).v-2.*Nodes(i,j,k).v+Nodes(i,j-1,k).v)./(2.*(abs(Nodes(i,j+1,k).y-Nodes(i,j-1,k).y))).^2);
                ddx1 = ((Nodes(i+1,j,k).u-Nodes(i-1,j,k).u)./((abs(Nodes(i,j-1,k).y-Nodes(i,j+1,k).y)).^2));
                ddx2 = ((Nodes(i,j+1,k).v-Nodes(i,j-1,k).v)./((abs(Nodes(i-1,j,k).x-Nodes(i+1,j,k).x)).^2));
                G1 = Nodes(i,j,k).v.*(ddx1./(abs(Nodes(i-1,j,k).x-Nodes(i+1,j,k).x)));
                G2 = Nodes(i,j,k).u.*(ddx2./(abs(Nodes(i-1,j,k).x-Nodes(i+1,j,k).x)));

                A = ro.*(D+B1.*B2+C1+C2+E1+E2+G1+G2);
                rNodes(i,j,k).A = A;
            end
        end
    end
end


end

