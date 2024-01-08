%% Growth function between a polyhedron and a point 
function [v, x, p]=Ab_Growth(A, b)
    m = size(A,1);
    n = size(A,2);
	
	if m~=size(b, 1) || size(b, 2)~=1
		fprintf('error: the point dimension of A and b are mismatch\n');
		return;
	end
		
	beq = b;
	c=[ones(1,n)];
	
	vlb = zeros(1, n);
	[y, v, exitflag]=linprog(c,[],[],A,beq,vlb,vub);
	if abs(v) < 1e-8
       v = 0;
    end
	
	x = round(y(1:n),4);
	p = A*x;
end
