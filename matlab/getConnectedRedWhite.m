function [ resultingRed, green, blue ] = getConnectedRedWhite( r, g, b )
% 
addpath(strcat(pwd, filesep, 'datastructure'));
imageDimesion = size(r);
z = zeros(imageDimesion);

resultingRed = z;
tmpRed = z;

nbStack = CStack;

green = z;
blue = z;

% Neighbor locations (footprint)
nbLocations=[-1 0; 1 0; 0 -1;0 1];

for x=1:size(r,1)
    for y=1:size(r,2)
        if r(x,y) == 1
            %reset vars
            redFound = 0;
            whiteFound = 0;
            
            %set current
            nbStack.push([x, y]);
            tmpRed(x, y) = 1;
            r(x,y) = 0;
            if g(x, y) == 1 && b(x, y) == 1
                whiteFound = 1;
            else
                redFound = 1;
            end
            
            %loop throgh neighbors
            while ~nbStack.isempty()
                % Get new neighbors pixels
                foundNeighbor = 0;
                for i=1:4,
                    % Calculate the neighbour coordinate
                    xn = x + nbLocations(i,1);
                    yn = y + nbLocations(i,2);

                    % Check if neighbour is inside image
                    isInside = (xn>=1) && (yn>=1) && (xn<=imageDimesion(1)) && (yn<=imageDimesion(2));

                    % Add neighbor if inside and max in red channel
                    if(isInside && r(xn, yn) == 1) 
                        nbStack.push([xn, yn]);
                        tmpRed(xn, yn) = 1;
                        r(xn, yn) = 0;
                        foundNeighbor = 1;
                        if g(xn, yn) == 1 && b(xn, yn) == 1
                            whiteFound = 1;
                        else
                            redFound = 1;
                        end
                    end
                end
                             
                % if no neighbor was found remove it from list
                if foundNeighbor == 0
                    nbStack.pop();
                end
                
                % set the next node as current
                if ~nbStack.isempty()
                    node = nbStack.pop();
                    x = node(1);
                    y = node(2);
                end
            end
            
            % if red and white was found merge tmp with result
            if redFound == 1 && whiteFound == 1
                resultingRed = greatestArray(resultingRed, tmpRed);
                % reset tmpRed
            end
            tmpRed = zeros(imageDimesion);
        end
    end
end

bool = [resultingRed == 1];
green(bool) = g(bool);
blue(bool) = b(bool);

end

