%% J2 function between a polyhedron and a point 
function [v, x, y, z, p]=Ab_J2(A, b)
    m = size(A,1);
    n = size(A,2);
	
	if m~=size(b, 1) || size(b, 2)~=1
		fprintf('error: the point dimension of A and b are mismatch\n');
		return;
	end
		
	beq = [zeros(m,1); 1; 1];
	c=[zeros(1,n) 0 ones(1,m+2)];
	AA=[A -b eye(m) zeros(m,2)];
	AA=[AA;
		ones(1,n)  0 zeros(1,m) 1 0;
		zeros(1,n) 1 zeros(1,m) 0 1];
	
	vlb=zeros(1, n+m+3);
	vub=[];
	[y, v, exitflag]=linprog(c,[],[],AA,beq,vlb,vub);
	if abs(v) < 1e-8
       v = 0;
    end
	
	x = round(y(1:n),4);
    z = round(y(n+2:n+m+3),4);
	y = round(y(n+1),4);
	p = A*x/sum(x);
end
