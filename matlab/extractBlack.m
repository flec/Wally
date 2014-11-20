function [ red, green, blue ] = extractBlack( r, g, b )
% This function extracts the black values
maxVal = 50;
redBool = r < maxVal;
greenBool = g < maxVal;
blueBool = b < maxVal;

bool = redBool & greenBool & blueBool;
z = 255 * ones(size(r));
red = z;
green = z;
blue = z;

red(bool) = r(bool);
green(bool) = g(bool);
blue(bool) = b(bool);

end

