function func = f_eff( band,bandwidth_min,M, Mmax,Rs ,Rs_max)
nnn = 1-(M*bandwidth_min*Rs)/(Mmax*band*Rs_max)
%   returns the  value for f_int
func = 1-((M*bandwidth_min*Rs)./(Mmax*band*Rs_max));
end

