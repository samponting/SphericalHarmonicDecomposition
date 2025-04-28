function Ylm = getSphericalHarmonic(l,m,theta,phi)
    % if of even degree
    if (mod(m, 2)==1)
      PM = -1;
    else
      PM = 1;
    end
    
    % compute associated legendre function
    leg = legendre(l, cos(theta), 'norm');

    % select curve, invert if degree negative
    if (m >= 0)
      legM = leg(m+1, :)';
    else
      legM = PM * leg(-m+1, :)';
    end

    % generate map
    Ylm = PM * sqrt(1/2/pi) * repmat(legM, [1 length(phi)]) .* ...
      repmat(exp(1i*m*phi), [length(theta) 1]);

end