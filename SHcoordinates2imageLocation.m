function [elev, phi, imE, imP] = SHcoordinates2imageLocation(c,im)
    

    % to calculate elevation, find the point on the image sphere around the
    % x and z axes, then use trig to find angle of point up from the
    % horizontal
    xes = sqrt(c(2).^2 + c(4).^2);
    elev = atan(c(3)./xes);
    % convert to image coordinates
    imE = size(im,1)-round(((elev+pi/2)/pi)*size(im,1));

%     imE = size(im,1)-round((elev./pi).*(1*size(im,1)) + round(size(im,1)/2));

    % to calculate phi, use trig to find angle around the x & z axis.
%     yes = sqrt(real(c(3)).^2 + real(c(4)).^2);
    phi = atan2(c(4),c(2))+pi/2;
    if phi <0
        phi = phi + 2*pi;
    end
    % disambiguate angles
%     phi = -phi;
%     phi(phi<0) = phi(phi<0)+(2*pi);

    % convert to image coordinates
    imP = round(phi./(2*pi).*size(im,2));

end