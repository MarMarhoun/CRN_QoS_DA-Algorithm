function func = f_ber(M, pow)
%func = f_ber(Pbe)
x = sqrt(((3*log2(M)*pow)./(M-1)));
%x= abs(x);

Gauss = exp(-(x^2)/2)./((1.64)*x+ sqrt(((0.7)*(x^2))+4));
Pbe = ((4*Gauss)*(1-(1./sqrt(M))))./log2(M);

%nnn =log10(0.5)/log10(Pbe)
%   This function returns the normalized value for p_ber
func =log10(0.5)./log10(Pbe);
end

