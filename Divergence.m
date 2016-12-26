function rNodes = Divergence( Nodes )
% Дивергенция скоростей с помощью аппроксимации
% производной по центральной схеме
[Nx,Ny,Nz] = size(Nodes);
rNodes = Nodes;
for i = 2:Nx-1
    for j = 2:Ny-1
        for k = 1:Nz
            if Nodes(i,j,k).boundary == 'none'
                dudx = ((Nodes(i-1,j,k).u-Nodes(i+1,j,k).u)./2.*abs(Nodes(i-1,j,k).x-Nodes(i+1,j,k).x));
                dvdy = ((Nodes(i,j-1,k).v-Nodes(i,j+1,k).v)./2.*abs(Nodes(i,j-1,k).y-Nodes(i,j-1,k).y));
                % dwdz = ((Node(i,j,k-1).w-Node(i,j,k+1).w)./2.*abs(Node(i,j,k-1).z-Node(i,j,k+1).z));
                Div = dudx+dvdy;
                rNodes(i,j,k).Div = Div;
            end
        end
    end
end

end

