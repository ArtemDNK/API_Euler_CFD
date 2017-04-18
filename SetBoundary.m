function Nodes = SetBoundary( Nodes )
% ������� ��������� �������
 [Nx, Ny, Nz] = size(Nodes);
 for j = 1:Ny
     for k = 1:Nz
         Nodes(1, j, k).u = 0.5;
         Nodes(1, j, k).boundary = 'vel';
         Nodes(Nx, j, k).u = 0.5;
         Nodes(Nx, j, k).boundary = 'vel';
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

