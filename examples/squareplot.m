function squareplot(A, color)
	AA = [A A(:,1)];
	plot(AA(1,:),AA(2,:),color);
end