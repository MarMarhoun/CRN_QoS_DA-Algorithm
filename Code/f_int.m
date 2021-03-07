function func = f_int( pow,band,tdd, power_min,power_max,bandwidth_min,bandwidth_max,Rs_max)
%nnn =1- ((pow+band+tdd)-(power_min+bandwidth_min+1))/(power_max+bandwidth_max+Rs_max)
%   returns the normalized value for f_int
func =((pow+band+tdd)-(power_min+bandwidth_min+100))./(power_max+bandwidth_max+Rs_max);
end

