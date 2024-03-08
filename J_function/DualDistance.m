%% dual distance between convex polytopes
function [v, x]=DualDistance(A, B)
    %% Initialization
    m1 = size(A,1);
    n1 = size(A,2);
	
	m2 = size(B,1);
    n2 = size(B,2);
	
	if m1~=m2
		fprintf('error: the point dimension of A and B are mismatch\n');
		return;
	end
	
	x0 = [ones(1, n1), ones(1, n2), zeros(1, 2)];
	xlb=[zeros(1, n1+n2), -Inf(1, 2)];
	xub=[Inf(1, n1+n2), Inf(1, 2)];
	options = optimoptions('fmincon','Algorithm','sqp','OptimalityTolerance', 1e-6, 'ConstraintTolerance', 1e-6, 'StepTolerance', 1e-16);
	options.MaxIterations = 10000;
	options.MaxFunctionEvaluations = 1e12;
	options.EnableFeasibilityMode = true;
	options
	[x, v] = fmincon(@(x) Objective(x, A, B), x0, [], [], [], [], xlb, xub, @(x) Constraint(x, A, B), options);
	v = -v;
	if abs(v) < 1e-6
       v = 0;
    end
end

function obj = Objective(x, A, B)
	%% Initialization
    n1 = size(A,2);
    n2 = size(B,2);
	obj = x(n1+n2+1) + x(n1+n2+2);
end

function [c, ceq] = Constraint(x, A, B)
	%% Initialization
    n1 = size(A,2);
    n2 = size(B,2);
	
	AAt = A * A';
	BBt = B * B';
	Ainv = inv(AAt);
	Binv = inv(BBt);
	
	temp1 = Ainv * (A * x(1:n1)' - x(n1+n2+1) * sum(A, 2));
	temp2 = Binv * (B * x(n1+1:n1+n2)' - x(n1+n2+2) * sum(B, 2));
	ceq = temp1 + temp2;
	c = norm(temp1) - 1;
end








































