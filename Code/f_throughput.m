function func = f_throughput(M, Mmax )
%nnn =1-(log2(M)/log2(Mmax))
%   returns the normalized value for throughput
func =1-(log2(M)./log2(Mmax));
end
