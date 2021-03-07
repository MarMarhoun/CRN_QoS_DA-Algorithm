P_Noise_max = -104;%dBm      -104        en 3.9810717055e-11mW
P_Noise_min = -114; %dBm       - 114          en 3.9810717055e-12mW
Mmax = 256; %maximum of modulation index
Mmin = 2;
power_max= 23.996737215; %maximum power in dB  251  23,996737215
power_min = -8.0134291305; %minimum power in dB 0.158  -8,0134291305


N = (P_Noise_min:P_Noise_max);
M = (Mmin:Mmax);
pow = (power_min:power_max);

size_N= length(N);
size_M= length(M);
size_pow = length(pow);
idx = 1;

for itr_N = 1:size_N
    for itr_M = 1:size_M
        for itr_pow = 1:size_pow
            x(idx)= sqrt(((3*log2(M(itr_M)).*pow(itr_pow))./((M(itr_M)-1).*N(itr_N))));
            x(idx)= abs( x(idx));
            Gauss(idx) = exp(-x(idx)^2/2)./(1.64.*x(idx)+ sqrt((0.7*(x(idx)^2))+4));
            Pbe(idx) = (4*Gauss(idx)*(1-(1./sqrt(M(itr_M)))))./log2(M(itr_M));
            idx=idx+1;
        end 
    end
end

Pbe_max = max(Pbe);
Pbe_min = min(Pbe);
Pbe_mean = mean(Pbe);

