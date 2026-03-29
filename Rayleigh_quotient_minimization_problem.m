


% Example 2.2: Rayleigh Quotient Minimization Problem
% function [Xsol, Ssol, T] = Rayleigh_quotient_minimization_problem

% Define the matrix A (diagonal in this case)
A = diag(1:1000);
n = size(A, 1);

% Define the manifold
% Sphere factory for 1D unit vectors, or Stiefel for more general
% gGr = spherefactory(n);
gGr = stiefelfactory(n, 1);  % 1-column Stiefel manifold

% Define problem structure for Manopt
problem.M = gGr;                 % Manifold
problem.cost  = @(X) (X' * A * X);  % Cost function (Rayleigh quotient)
problem.egrad = @(X) 2 * (A * X);   % Euclidean gradient

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
    % Generate a random starting point on the manifold
    x = problem.M.rand();
    
    % Loop over all CG methods
    for k = 1:length(BETAS)
        options.beta_type = BETAS{k};  % Choose CG method
        
        % Run modified Riemannian CG solver
        [Xsol, costXsol, info, options, finalout] = ...
            conjugategradientDL(problem, x, options, k); %#ok<ASGLU>
        
        % Save iteration count and time to Excel
        T = {BETAS{k}, num2str(finalout.iter), num2str(finalout.time)};
        sheet = 2;                   % Sheet number (can be adjusted)
        XRange = xlRange(3*k, i);    % Excel range for this entry
        xlswrite(table1, T, sheet, XRange);
    end
end

% Compute eigenvalues of X'*A*X
[Vsol, Dsol] = eig(Xsol' * (A * Xsol));
Ssol = diag(Dsol);

% Store solver info
T = info;