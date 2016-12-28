clear, clc;
Nx = 10;
Ny = 10;
Nz = 2;
Lx = 0.2;
Ly = 0.2;
Lz = 1;
hx = Lx / (Nx-1);
hy = Ly / (Ny-1);
hz = Lz / (Nz-1);
Nodes = CreateNodes(Nx, Ny, Nz, Lx, Ly, Lz, hx, hy ,hz);
Nodes = SetBoundary(Nodes);



dt = 0.005;
T = 0.5;
t = 0;

while t <= T
    
    Nodes = Divergence(Nodes, hx, hy, hz);
    
    Nodes = A_Poisson(dt ,Nodes, hx, hy, hz);
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

contourf(C, 'ShowText', 'on');


