%% Growth3 function
function [v,x,y,pa,pb]=Growth3(A, B)
    %% Initialization
    m1 = size(A,1);
    n1 = size(A,2);
	
	m2 = size(B,1);
    n2 = size(B,2);
	
	if m1~=m2
		fprintf('error: the point dimension of A and B are mismatch\n');
		return;
	end
	if n1~=n2
		fprintf('error: the point dimension of A and B are mismatch\n');
		return;
	end
	m = m1;	
	n = n1;
	
	b = mean(B, 2);
	BB = B - b;
	
	beq = b;
	c=ones(1,n);
	AA=A-BB;
	
	vlb=zeros(1, n);
	vub=[];
	[y, v, exitflag]=linprog(c,[],[],AA,beq,vlb,vub);
	if abs(v) < 1e-8
       v = 0;
    end
	
	pa = A*y;
	pb = BB*y + b;
end
