%% distance between convex polytopes
function [v, x, y, pa, pb]=Distance(A, B)
    %% Initialization
    m1 = size(A,1);
    n1 = size(A,2);
	
	m2 = size(B,1);
    n2 = size(B,2);
	
	if m1~=m2
		fprintf('error: the point dimension of A and B are mismatch\n');
		return;
	end
	
	beq = [1; 1];
	Aeq = [ones(1,n1)  zeros(1,n2);
		   zeros(1,n1) ones(1,n2)];
	
	x0 = [ones(1, n1)/n1, ones(1, n2)/n2];
	xlb=zeros(1, n1+n2);
	xub=ones(1, n1+n2);
	%options = optimoptions('fmincon','Algorithm','interior-point', 'OptimalityTolerance', 1e-12, 'ConstraintTolerance', 1e-12, 'StepTolerance', 1e-12, 'MaxIterations', 5000);
	[x, v] = fmincon(@(x) Objective(x, A, B), x0, [], [], Aeq, beq, xlb, xub, []);
	if abs(v) < 1e-6
       v = 0;
    end
	
	y = round(x(n1+1:n1+n2),4);
	x = round(x(1:n1),4);
	pa = A*x';
	pb = B*y';
end

function obj = Objective(x, A, B)
	%% Initialization
    n1 = size(A,2);
    n2 = size(B,2);
	obj = norm(A * x(1:n1)' - B * x(n1+1:n1+n2)');
end








































