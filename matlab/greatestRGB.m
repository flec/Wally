function [ r, g, b ] = greatestRGB( r1, g1 , b1, r2, g2, b2 )
% Returns the greatest rgb of each array
r = greatestArray(r1, r2);
g = greatestArray(g1, g2);
b = greatestArray(b1, b2);
end

