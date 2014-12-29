function [ red, green, blue ] = extractWhite( r, g, b, minVal )
% This function returns the white values
if nargin < 4
    minVal = .9;
end
redBool = r >= minVal;
greenBool = g >= minVal;
blueBool = b >= minVal;

bool = redBool & greenBool & blueBool;
z = zeros(size(r));
red = z;
green = z;
blue = z;

red(bool) = r(bool);
green(bool) = g(bool);
blue(bool) = b(bool);

end

