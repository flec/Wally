function [ red, green, blue ] = extractWhite( r, g, b )
% This function returns the white values
minVal = 200;
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

