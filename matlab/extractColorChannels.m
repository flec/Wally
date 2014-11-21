function [ r, g, b ] = extractColorChannels( img )
% This function extracts the color channels from an image array img
r = double(img(:,:,1)) / 255;
g = double(img(:,:,2)) / 255;
b = double(img(:,:,3)) / 255;
end

