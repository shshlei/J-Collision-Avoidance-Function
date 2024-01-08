%% MJ1 function
function [v, x, z, pa]=MJ1(A, b)
    %% Initialization
    m = size(A, 1);
    n = size(A, 2);
		
	beq = [b; 1];
	c=[zeros(1, n) -ones(1, m)];
	AA=[A -eye(m);
		ones(1, n) zeros(1, m)];
	
	vlb=zeros(1, n + m);
	vub=[];
	[y, v, exitflag] = linprog(c, [], [], AA, beq, vlb, vub);
	if abs(v) < 1e-8
       v = 0;
    end
	x = round(y(1: n), 4);
    z = round(y(n + 1: n + m), 4);
	pa= A * x;
end
