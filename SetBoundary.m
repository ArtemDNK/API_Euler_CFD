function Nodes = SetBoundary( Nodes )
% Задание граничных условий
 [Nx, Ny, Nz] = size(Nodes);
 
 for j = 1:Ny
     for k = 1:Nz
         Nodes(1, j, k).u = 1;
         Nodes(1, j, k).boundary = 'vel';
     end
 end;


end

