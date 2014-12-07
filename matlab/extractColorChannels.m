function [ r, g, b ] = extractColorChannels( img )
% This function extracts the color channels from an image array img
r = im2double(img(:,:,1));
g = im2double(img(:,:,2));
b = im2double(img(:,:,3));
end

