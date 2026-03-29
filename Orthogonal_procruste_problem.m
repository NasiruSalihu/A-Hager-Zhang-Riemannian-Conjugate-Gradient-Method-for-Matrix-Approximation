


% Example 2.1: Orthogonal Procrustes Problem
% function [Xsol, Ssol, T] = Orthogonal_procruste_problem

% Problem dimensions
p = 5;          % Number of columns in X
n = 1000;       % Number of rows in X
l = n;          % Not used, kept for reference

% Data matrices
B = ones(n,p)/sqrt(n);    % Target matrix B
A = eye(n);               % Matrix A (can also be random: randn(n))
% A = randn(n);

% Create Stiefel manifold factory (orthogonal matrices of size n x p)
gGr = stiefelfactory(n, p);

% Precompute products for efficiency
AB = A'*B;
AA = A'*A;

% Define the problem structure for Manopt
problem.M = gGr;                          % Manifold
problem.cost = @(X) norm(A*X-B, 'fro')^2; % Cost function
problem.egrad = @(X) 2*AA*X - 2*AB;      % Euclidean gradient

fprintf('Try it again without the linesearch helper.\n');

% List of Conjugate Gradient methods to run
BETAS = {'F-R','P-R', 'H-S', 'L-S', 'D-Y', 'H-Z', ...
         'R-RMIL+', 'R-NHS', 'H-FP', 'H-FP2', ...
         'DLRMIL', 'DLDY', 'DLLS+', 'DLCD'};

% Output Excel file
table1 = 'RCGmulti.xlsx';

% Number of trials
MaxTrial = 100;

% Loop over trials
for i = 1:MaxTrial
    % Generate a random starting point on the Stiefel manifold
    x = problem.M.rand();
    
    % Loop over all CG methods
    for k = 1:length(BETAS)
        options.beta_type = BETAS{k};  % Choose CG method
        % Call the modified conjugate gradient solver
        [Xsol, costXsol, info, options, finalout] = ...
            conjugategradientDL(problem, x, options, k); %#ok<ASGLU>
        
        % Save iteration count and time to Excel
        T = {BETAS{k}, num2str(finalout.iter), num2str(finalout.time)};
        sheet = 3;                   % Sheet number (can be changed)
        XRange = xlRange(3*k, i);    % Excel range (custom function)
        xlswrite(table1, T, sheet, XRange);
    end
end

% Compute eigenvalues of X'*A*X
[Vsol, Dsol] = eig(Xsol'*(A*Xsol));
Ssol = diag(Dsol);

% Store solver info
T = info;