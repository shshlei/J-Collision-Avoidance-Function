%% MJ function between a polyhedron and a point 
function [v, x, y, p]=Ab_MJ2(A, b)
    m = size(A,1);
    n = size(A,2);
	
	if m~=size(b, 1) || size(b, 2)~=1
		fprintf('error: the point dimension of A and b are mismatch\n');
		return;
	end
		
	beq = [zeros(m,1); 1; 1];
	c=[zeros(1,n) 0 1];
	AA=[A -b zeros(m,1)];
	AA=[AA;
		ones(1,n)  0 0;
		zeros(1,n) 1 1];
	
	vlb = zeros(1, n+2);
	vub=ones(1, n+2);
	[y, v, exitflag]=linprog(c,[],[],AA,beq,vlb,vub);
	if abs(v) < 1e-8
       v = 0;
    end
	
	x = round(y(1:n),4);
	y = round(y(n+1),4);
	p = A*x;
end
