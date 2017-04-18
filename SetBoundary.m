function Nodes = SetBoundary( Nodes )
% Задание граничных условий
 [Nx, Ny, Nz] = size(Nodes);
 for j = 1:Ny
     for k = 1:Nz
         Nodes(1, j, k).u = 0.5;
         Nodes(1, j, k).boundary = 1;
         Nodes(Nx, j, k).u = 0.5;
         Nodes(Nx, j, k).boundary = 1;
     end
 end;

%  for i = 1:Nx
%      for k = 1:Nz
%          Nodes(i, 1, k).u = 1;
%          Nodes(i, 1, k).boundary = 'vel';
%          Nodes(i, Ny, k).u = 1;
%          Nodes(i, Ny, k).boundary = 'vel';
%      end
%  end; 
 
end

