function rNodes = A_Poisson( dt, Nodes, hx, hy, hz )
% Правая часть уравнения Пуассона
[Nx,Ny,Nz] = size(Nodes);
rNodes = Nodes;
ro = 1000;

for i = 2:Nx-1
    for j = 2:Ny-1
        for k = 1:Nz
            if Nodes(i,j,k).boundary == 'none'
                D = (Nodes(i,j,k).Div - Nodes(i,j,k).Div0)./dt;
                B1 = 2.*Nodes(i,j,k).dudy;
                B2 = Nodes(i,j,k).dvdx;
                C1 = Nodes(i,j,k).dudx .^2;
                C2 = Nodes(i,j,k).dvdy .^2;
                E1 = Nodes(i,j,k).u .* Nodes(i,j,k).d2udx2;
                E2 = Nodes(i,j,k).v .* Nodes(i,j,k).d2vdy2;
                G1 = Nodes(i,j,k).v .* (Nodes(i-1,j,k).dudy - Nodes(i+1,j,k).dudy) ./ abs(2 * hx); 
                G2 = Nodes(i,j,k).u .* (Nodes(i,j-1,k).dvdx - Nodes(i,j+1,k).dvdx) ./ abs(2 * hy);

                A = ro.*(D+B1.*B2+C1+C2+E1+E2+G1+G2);
                rNodes(i,j,k).A = A;
            end
        end
    end
end


end

