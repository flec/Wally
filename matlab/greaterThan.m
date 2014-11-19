function [ z ] = greaterThan( a, b, m )
% Returns an array which contains the values that are greater in a than b 
% m is the multiplier e.g. m=2 -> a needs to be twice as large than b
d = [a>b*m];
z = zeros(size(a));
z(d) = b(d);


end

