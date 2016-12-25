function A = A_Poisson( Div, ro, Node )
% Правая часть уравнения Пуассона
D = (Node(i,j,k).Div-Node(i,j,k).Div)./abs(Node(i,j,k).t-Node(i,j,k).t);
B1 = 2.*((Node(i,j+1).u-Node(i,j-1).u)./(2.*(abs(Node(i,j-1).y-Node(i,j+1).y))));
B2 = ((Node(i+1,j).v-Node(i-1,j).v)./(2.*(abs(Node(i-1,j).x-Node(i+1,j).x))));
C1 = (((Node(i+1,j).u-Node(i-1,j).u)./(2.*(abs(Node(i-1,j).x-Node(i+1,j).x)))).^2);
C2 = (((Node(i,j+1).v-Node(i,j-1).v)./(2.*(abs(Node(i,j-1).y-Node(i,j-1).y)))).^2);
E1 = Node(i,j).u.*((Node(i+1,j).u-2.*Node(i,j).u+Node(i-1,j).u)./(2.*(abs(Node(i-1,j).x-Node(i+1,j).x))).^2);
E2 = Node(i,j).v.*((Node(i,j+1).v-2.*Node(i,j).v+Node(i,j-1).v)./(2.*(abs(Node(i,j-1).y-Node(i,j-1).y))).^2);
ddx1 = ((Node(i+1,j).u-Node(i-1,j).u)./((abs(Node(i,j-1).y-Node(i,j+1).y)).^2));
ddx2 = ((Node(i,j+1).v-Node(i,j-1).v)./((abs(Node(i-1,j).x-Node(i+1,j).x)).^2));
G1 = Node(i,j).v.*(ddx1./(abs(Node(i-1,j).x-Node(i+1,j).x)));
G2 = Node(i,j).u.*(ddx2./(abs(Node(i-1,j).x-Node(i+1,j).x)));

A = ro.*(D+B1.*B2+C1+C2+E1+E2+G1+G2);


end

