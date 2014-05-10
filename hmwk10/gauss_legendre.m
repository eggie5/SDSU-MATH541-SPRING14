function [nodes, weights] = gauss_legendre(N)

beta = .5./sqrt(1-(2*(1:N)).^(-2)); % 3-term recurrence coeffs
T = diag(beta,1) + diag(beta,-1); % Jacobi matrix
[V,D] = eig(T); % eigenvalue decomposition
nodes = diag(D); [nodes,index] = sort(nodes); % nodes (= Legendre points)
weights = 2*V(1,index).^2; % weights