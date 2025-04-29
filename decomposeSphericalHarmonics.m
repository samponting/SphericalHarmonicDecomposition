function [c,l,m] = decomposeSphericalHarmonics(im,maxHarmOrders)

if ~exist('harmOrders','var')
    maxHarmOrders = 2;
end
if ~exist('im','var')
    imageName = 'HS_En1.mat';
    image = load(imageName);
    im = image.image;
end

%phi and theta space.
theta = linspace(0, pi, size(im,1));
phi = linspace(-pi, pi, size(im,2));

%initialise c, l and m.
c = zeros((maxHarmOrders+1)^2, 1);
l = zeros((maxHarmOrders+1)^2, 1);
m = zeros((maxHarmOrders+1)^2, 1);

%loop through harmonic degree
for thisL = 0:maxHarmOrders
    l(thisL^2 + (1:2*thisL+1)) = thisL;
    m(thisL^2 + (1:2*thisL+1)) = -thisL:thisL;

    for thisM = -thisL:thisL
        %for each degree and order, get basis functions and then calculate
        %inner product between basis function and image.
        Ylm = getSphericalHarmonic(thisL,thisM,theta,phi);
        c(thisL^2+thisM+thisL+1) = calculateSphericalInnerProduct(im,Ylm,theta,phi);
    end
end

end
