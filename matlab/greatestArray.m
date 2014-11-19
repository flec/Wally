function [ z ] = greatestArray( a, b )
% Returns for each index the greatest value of both arrays
d = [b>a];
z = a;
z(d) = b(d);

end

