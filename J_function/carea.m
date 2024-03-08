% A: rectangle b: point
% return the sum of the area of four triangles 
function carea = carea(A,b)
    e = zeros(4,1);
    for i=1:4
        e(i) = sqrt( (A(1,i)-b(1))*(A(1,i)-b(1)) + (A(2,i)-b(2))*(A(2,i)-b(2)));
    end

    a = zeros(4,1);
    for i=1:4
        a(i) = sqrt( (A(1,i)-A(1,i+1-4*floor(i/4)))*(A(1,i)-A(1,i+1-4*floor(i/4))) + (A(2,i)-A(2,i+1-4*floor(i/4)))*(A(2,i)-A(2,i+1-4*floor(i/4))) );
    end

	% triangle area
    function trarea = tarea(e1, e2, e3)
        te = (e1 + e2 + e3)/2.0;
        trarea = sqrt(te*(te-e1)*(te-e2)*(te-e3));
    end

    temp = 0.0;
    for i=1:4
       temp = temp + tarea(a(i), e(i), e(i+1-4*floor(i/4))); 
    end
    carea = temp;
end

