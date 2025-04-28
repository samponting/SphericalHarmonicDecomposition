function cReal = complex2realSH(cComplex,l,m)

%initialise cReal
cReal = zeros(size(cComplex));

%loop through coefficients, calculate real harmonics
for thisL = 0:max(l)
    for thisM = -thisL:thisL
        if thisM == 0
            cReal((thisL+1).^2-thisL+thisM) = real(cComplex((thisL+1).^2-thisL+thisM));
        elseif thisM <0
            cReal((thisL+1).^2-thisL+thisM) = 1i/sqrt(2) .* (cComplex((thisL+1).^2-thisL+thisM) - ((-1).^(m((thisL+1).^2-thisL+thisM)))*cComplex((thisL+1).^2-thisL-thisM));
        elseif thisM >0
            cReal((thisL+1).^2-thisL+thisM) = 1/sqrt(2) .* (cComplex((thisL+1).^2-thisL-thisM) + ((-1).^(m((thisL+1).^2-thisL+thisM)))*cComplex((thisL+1).^2-thisL+thisM));
        end
    end
end



