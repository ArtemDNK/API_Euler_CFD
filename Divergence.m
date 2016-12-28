function rNodes = Divergence( Nodes, hx, hy, hz )
% Дивергенция скоростей с помощью аппроксимации
% производной по центральной схеме
[Nx,Ny,Nz] = size(Nodes);
rNodes = Nodes;
for i = 2:Nx-1
    for j = 2:Ny-1
        for k = 1:Nz
            if Nodes(i,j,k).boundary == 'none'
                dudx = ((Nodes(i+1,j,k).u-Nodes(i-1,j,k).u))./ abs(2 * hx);
                dvdy = ((Nodes(i,j+1,k).v-Nodes(i,j-1,k).v))./ abs(2 * hy);
                % dwdz = ((Node(i,j,k-1).w-Node(i,j,k+1).w)./2.*abs(Node(i,j,k-1).z-Node(i,j,k+1).z));
                
                dudy = (Nodes(i,j-1,k).u-Nodes(i,j+1,k).u)./ abs(2 * hy);
                dvdx = (Nodes(i-1,j,k).v-Nodes(i+1,j,k).v)./ abs(2 * hx);
                
                d2udx2 = ((Nodes(i+1,j,k).u-2.*Nodes(i,j,k).u+Nodes(i-1,j,k).u)./ abs(hx).^2);
                d2vdy2 = ((Nodes(i,j+1,k).v-2.*Nodes(i,j,k).v+Nodes(i,j-1,k).v)./ abs(hy).^2);
                Div = dudx+dvdy;
                
                rNodes(i,j,k).Div0 = rNodes(i,j,k).Div;
                rNodes(i,j,k).Div = Div;
                
                rNodes(i,j,k).dudx = dudx;
                rNodes(i,j,k).dvdy = dvdy;
                rNodes(i,j,k).dudy = dudy;
                rNodes(i,j,k).dvdx = dvdx;
                rNodes(i,j,k).d2udx2 = d2udx2;
                rNodes(i,j,k).d2vdy2 = d2vdy2;
            end
        end
    end
end

end

