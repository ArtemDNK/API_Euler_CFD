clear, clc;
Nodes = CreateNodes(10, 10, 2, 1, 1, 1);
Nodes = SetBoundary(Nodes);



dt = 0.02;
T = 3;
t = 0;
while t <= T
    Nodes = Divergence(Nodes);
    
    Nodes = A_Poisson(dt ,Nodes);
    watch1 = Nodes(:,:,2);
    
%     mas = zeros(2,10);
    for i=1:10
        Nodes = Pressure(Nodes);
        watch2 = Nodes(:,:,2);
%         mas(1,i) = i;
%         mas(2,i) = watch2(2,2).p;
    end
    % plot(mas(1,:),mas(2,:))
    
    Nodes = Velocity(dt, Nodes);
    watch3 = Nodes(:,:,2);
    t = t+dt;
end
watch(:,:) = Nodes(:,:,2);
[Nx,Ny] = size(watch);
C = repmat(double(inf), Nx, Ny);
for i=1:Nx
    for j=1:Ny
        C(i,j) = watch(i,j).u;
    end
end

contourf(C);


