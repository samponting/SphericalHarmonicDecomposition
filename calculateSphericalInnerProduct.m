function c = calculateSphericalInnerProduct(im,Ylm,theta,phi)

    %integrate over product of both images, both across x and across y
    c = trapz(phi, trapz(theta, im.*conj(Ylm).*repmat(sin(theta'), [1 size(im,2)])));

end