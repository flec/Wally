function [ r, g, b ] = dilateRGB( red, green, blue )
% This function dialtes an rgb
r = im2double(bwmorph(im2bw(red), 'dilate'));
g = im2double(bwmorph(im2bw(green), 'dilate'));
b = im2double(bwmorph(im2bw(blue), 'dilate'));

end

