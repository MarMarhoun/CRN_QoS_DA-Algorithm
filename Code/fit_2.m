function func = fit_2( x )
x =  real(x);
%%weight vectors for emergency mode operation (minimizing BER)
%%%%%%%%%%%% Modes : 
%%% BER : w1 = 0.50; w2 = 0.10; w3 = 0.10; w4 = 0.10; w5 = 0.20;
%%% Power : w1 = 0.10; w2 = 0.15; w3 = 0.45; w4 = 0.20; w5 = 0.10;
%%% Débit : w1 = 0.15; w2 = 0.15; w3 = 0.10; w4 = 0.50; w5 = 0.10;
%%% Interférences : w1 = 0.10; w2 = 0.50; w3 = 0.10; w4 = 0.20; w5 = 0.10;
%%% Efficacité : w1 = 0.15; w2 = 0.10; w3 = 0.10; w4 = 0.15; w5 = 0.50;

w1 = 0.5; %BER
w2 = 0.1; %interferences
w3 = 0.10; %power
w4 = 0.10; %Debit
w5 = 0.20; %Eff

% Pbe : 
Pbe = 0.0175;
%%Maximum and minimum values for transmission parameters

power_max = 23.9967; %maximum power in dB  251
power_min = -8.0134; %minimum power in dB 0.158
bandwidth_max = 32; %maximum bandwidth in Hz
bandwidth_min = 2;  %minimum bandwidth in Hz
tdd_min = 25;   %minimum time for transmitting
tdd_max = 100;  %maximum time for transmitting
Mmax = 256; %maximum of modulation index
Mmin = 2; %minimum of modulation index
Rs_max = 1000000; % Maximum symbol rate (Symbols / second)
Rs_min = 125000;
P_Noise_max = -104;
P_Noise_min = - 114;

M_list = [2,4, 16, 64, 256];
M= M_list;
Rs = [125000 250000 500000 625000 750000 1000000];
N = (P_Noise_min:1:P_Noise_max);

o = [0, 0, 0, 0, 0];
var = x;
%var = [p,band, M, tdd, N, Rs];

o(1) = w1*f_ber(Pbe);
o(2) = w2*f_int(var(1),var(3), var(4), power_min,power_max,bandwidth_min, bandwidth_max, Rs_max);
o(3) = w3*f_power(var(1),power_max);
o(4) = w4*f_throughput(M, Mmax);
o(5) = w5*f_eff( var(3), bandwidth_min, M, Mmax, var(5), Rs_max);
a = (o(1)+o(2)+o(3)+ o(4)+o(5)) ;

func =  a;
