% which harmonic degrees to calculate
maxHarmOrder = 2;

%Load image. 'im' should ultimately be a a m*n*1 image - whether this is a
%luminance image, rgb2gray, or by selecting one channel.
im = exrread('jovi-19-03-06_s03.exr');im = im2double(im);%im = im./max(im(:));
im = 0.2126*im(:,:,1) + 0.7152*im(:,:,2) + 0.0722*im(:,:,3);

%Decompose spherical harmonics. c - coefficients, l-degrees, m-orders.
[cComplex,l,m] = decomposeSphericalHarmonics(im,maxHarmOrders);

%Convert complex SH coefficients to real SH coefficients.
cReal = complex2realSH(cComplex,l,m);

%Calculate theta and phi (elevation and phi) of the first degree. Convert
%angles to image positions.
[elev,phi,imE,imP] = SHcoordinates2imageLocation(cReal,im);

%Get power of each degree component.
amps = getDegreeAmplitudes(cReal,l);

%Calculate D(Xia) diffuseness metric.
dXia = calculateDiffuseness(amps);

