function Div = Divergence( Node, i, j, k )
% Дивергенция скоростей с помощью аппроксимации
% производной по центральной схеме
dudx = ((Node(i-1,j,k).u-Node(i+1,j,k).u)./2.*abs(Node(i-1,j,k).x-Node(i+1,j,k).x));
dvdy = ((Node(i,j-1,k).v-Node(i,j+1,k).v)./2.*abs(Node(i,j-1,k).y-Node(i,j-1,k).y));
% dwdz = ((Node(i,j,k-1).w-Node(i,j,k+1).w)./2.*abs(Node(i,j,k-1).z-Node(i,j,k+1).z));
Div = dudx+dvdy;

end

