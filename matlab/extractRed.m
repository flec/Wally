function [ red, green, blue ] = extractRed( r, g, b )
% This function retuens the red channel with only the values that are red.
% This means that red is at least twice as large as blue or green
gb = greatestArray(g, b); % get greatest of green and blue
bool = [r>gb*2];
z = zeros(size(r));
red = z;
green = z;
blue = z;

red(bool) = r(bool);
green(bool) = g(bool);
blue(bool) = b(bool);
end

