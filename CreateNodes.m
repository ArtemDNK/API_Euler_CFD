function Nodes = CreateNodes( Nx, Ny, Nz, Lx, Ly, Lz )
% Создание структуры узлов
hx = Lx / (Nx-1);
hy = Ly / (Ny-1);
hz = Lz / (Nz-1);
Node = struct('i', 0, 'j' ,0, 'k', 0, 'x', 0, 'y', 0, 'z', 0, 'u', 0, 'v', 0, 'w', 0, 'p', 0, 'boundary', 'none', 'Div', 0, 'A', 0);
Nodes = repmat(Node, Nx, Ny, Nz);
for i = 1:Nx
    for j = 1:Ny
        for k= 1:Nz
            x = (i-1) * hx;
            y = (j-1) * hy;
            z = (k-1) * hz;
            Nodes(i,j,k) = struct('i', i, 'j' , j, 'k', k, 'x', x, 'y', y, 'z', z , 'u', 0, 'v', 0, 'w', 0, 'p', 0, 'boundary', 'none', 'Div', 0, 'A', 0);
           
        end
    end
end

end

