function [ red, green, blue ] = extractBlack( r, g, b )
% This function extracts the black values
maxVal = 50;
redBool = r < maxVal;
greenBool = g < maxVal;
blueBool = b < maxVal;

bool = redBool & greenBool & blueBool;
z = ones(size(r));
red = z;
green = z;
blue = z;

red(bool) = r(bool)/256;
green(bool) = g(bool)/256;
blue(bool) = b(bool)/256;

end

