function [ red ] = extractRed( r, g, b )
% This function retuens the red channel with only the values that are red.
% This means that red is at least twice as large as blue or green
gb = greatestArray(g, b); % get greatest of green and blue
red = greaterThan(r, gb, 2); % get real red values
end

