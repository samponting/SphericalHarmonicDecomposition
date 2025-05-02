% which harmonic degrees to calculate
maxHarmOrders = 2;

%Load image. 'im' should ultimately be a a m*n*1 image - whether this is a
%luminance image, rgb2gray, or by selecting one channel.
files = dir([pwd,'/*.hdr']);

for imageNum = 1:length(files)
    
    %Load Image. Must be Normalised for diffuseness to be correct.
    im = HDRRead(files(imageNum).name);im = im./max(im(:));
    im = rgb2gray(im);

    
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
    
    subplot(2,3,imageNum)
    imshow(im);hold on
    scatter(imP,imE,200,'+','Color',[0 0 0]);
    title(sprintf('dXia: %s',num2str(dXia)));
end