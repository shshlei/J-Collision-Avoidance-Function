function [c, ceq] = ConstraintTest(x, A, B)
	%% Initialization
    n1 = size(A,2);
    n2 = size(B,2);
	
	AtA = A * A';
	BtB = B * B';
	Ainv = inv(AtA);
	Binv = inv(BtB);
	
	temp1 = Ainv * (A * x(1:n1)' - x(n1+n2+1)* sum(A, 2));
	temp2 = Binv * (B * x(n1+1:n1+n2)' - x(n1+n2+2)* sum(B, 2));
	ceq = temp1 + temp2;
	c = norm(temp1) - 1;
end
