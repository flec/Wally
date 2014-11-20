function [ r, g, b ] = extractColorChannels( img )
% This function extracts the color channels from an image array img
r = img(:,:,1);
g = img(:,:,2);
b = img(:,:,3);
end

