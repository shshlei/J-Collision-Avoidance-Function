%% J2 function
function [v,x,y,z,pa,pb]=J2(A, B)
    %% Initialization
    m1 = size(A,1);
    n1 = size(A,2);
	
	m2 = size(B,1);
    n2 = size(B,2);
	
	if m1~=m2
		fprintf('error: the point dimension of A and B are mismatch\n');
		return;
	end
	
	m = m1;
	beq = [zeros(m,1); 1; 1];
	c=[zeros(1,n1) zeros(1,n2) ones(1,m+2)];
	AA=[A -B eye(m) zeros(m,2)];
	AA=[AA;
		ones(1,n1) zeros(1,n2) zeros(1,m) 1 0;
		zeros(1,n1) ones(1,n2) zeros(1,m) 0 1];
	
	vlb=zeros(1, n1+n2+m+2);
	options = optimoptions('linprog','Algorithm','dual-simplex', 'OptimalityTolerance', 1e-10, 'ConstraintTolerance', 1e-9, 'MaxIterations', 5000);
	[y, v, exitflag]=linprog(c, [], [], AA, beq, vlb, []);
	if abs(v) < 1e-8
       v = 0;
    end
	
	x = round(y(1:n1), 4);
    z = round(y(n1+n2+1:n1+n2+m+2), 4);
	y = round(y(n1+1:n1+n2), 4);
	pa = A*x/sum(x);
	pb = B*y/sum(y);
end
