clear, clc;
Nodes = CreateNodes(10, 10, 2, 1, 1, 1);
Nodes = SetBoundary(Nodes);
Nodes2 = Divergence(Nodes, 2, 2, 1);
Nodes2 = Nodes2(:, :, 2);
