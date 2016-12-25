function P = Pressure( A, Node )
% Давление
hxL = (abs(Node(i,j).x-Node(i-1,j).x));
hxR = (abs(Node(i+1,j).x-Node(i,j).x));
hyL = (abs(Node(i,j).y-Node(i,j-1).y));
hyR = (abs(Node(i,j+1).y-Node(i,j).y));
B1 = P(i-1,j)./hxR;
B2 = P(i+1,j)./hxL;
C1 = P(i,j-1)./hyR;
C2 = P(i,j+1)./hyL;
D1 = 1./hxL;
D2 = 1./hxR;
E1 = 1./hyL;
E2 = 1./hyR;
B = (B1+B2)/(hxR./2+hxL./2);
C = (C1+C2)/(hyR./2+hyL./2);
D = (D1+D2)/(hxR./2+hxL./2);
E = (E1+E2)/(hyR./2+hyL./2);
P(i,j)= (B-A+C)./D+E;
end

