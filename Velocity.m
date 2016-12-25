function U = Velocity( Node, P )
%Нахождение скоростей
dtx = (abs(Node(i-1,j).t-Node(i+1,j).t));
A = (P(i+1,j).x-P(i-1,j).x)./(2.*ro.*(abs(Node(i-1,j).x-Node(i+1,j).x)));
B = Node(i,j).u./dtx;
C = (Node(i,j).x.*(Node(i+1,j).u-Node(i-1,j).u))./(2*Node(abs(Node(i+1,j).x-Node(i-1,j).x)));
D = (Node(i,j).y.*(Node(i,j+1).v-Node(i,j-1).v))./(2*Node(abs(Node(i,j+1).y-Node(i,j-1).y)));
U(i,j).x = -dtx.*(A-B+C+D);

dty = (abs(Node(i,j-1).t-Node(i,j+1).t));
A = (P(i,j+1).y-P(i,j-1).y)./(2.*ro.*(abs(Node(i,j-1).y-Node(i,j+1).y)));
B = Node(i,j).v./dty;
U(i,j).y = -dty.*(A1-B1+C+D);
end

