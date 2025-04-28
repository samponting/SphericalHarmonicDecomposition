function amps = getDegreeAmplitudes(c,l)

amps = zeros(max(l)+1,1);

for thisL = 0:max(l)
    thisM = -thisL:thisL;
    amps(thisL+1) = sqrt(sum(c(thisL.^2+thisL+thisM+1).^2));

end
