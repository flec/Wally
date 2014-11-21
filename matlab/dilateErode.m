function [ red,green,blue ] = dilateErode( r,g,b )
%DILATEERODE Summary of this function goes here
%   Detailed explanation goes here

red = bwmorph(r, 'dilate');
red = bwmorph(red, 'erode');
green = bwmorph(g, 'dilate');
green = bwmorph(green, 'erode');
blue = bwmorph(b, 'dilate');
blue = bwmorph(blue, 'erode');

end

