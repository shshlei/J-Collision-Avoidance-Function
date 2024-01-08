clear all; close all; clc;

A = [1, -1, -1, 1; 1,  1, -1, -1]; % 1
A = [1, 0, -1, 0; 0,  1, 0, -1]; % 2
A = [2, -2, -2, 2; 1,  1, -1, -1];  % 3
A = [2, 0, -2, 0; 0,  1, 0, -1];  % 4

% [b1, b2]=meshgrid(-2:0.05:2);
% 
% len=size(b1,1);
% tic
% for i=1:len
% 	for j=1:len
% 		b=[b1(i,j); b2(i,j)];
% 		v=MJ2(A, b);
% 		z(i,j)=v;
% 	end
% end
% toc
% 
% figure
% contour(b1, b2, z);
% axis equal
% hold on
% squareplot(A, 'k')
% title('Ab-J2');

x = -5:0.05:5;
y = x;
len =  length(x);
for i=1:len
	for j=1:len
		b=[x(i); y(j)];
		v=Ab_MJ2(A, b);
		z(i,j)=v;
	end
end

dlmwrite('x.txt',x,'delimiter',' ');
dlmwrite('y.txt',y,'delimiter',' ');
dlmwrite('z.txt',z,'delimiter',' ');
