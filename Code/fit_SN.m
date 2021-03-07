function func = fit_SN( x)
x =  real(x);
%%%%%%%%%%%% weight vectors for Modes : 
%%% BER : w1 = 0.50; w2 = 0.10; w3 = 0.10; w4 = 0.10; w5 = 0.20;
%%% Power : w1 = 0.10; w2 = 0.15; w3 = 0.45; w4 = 0.20; w5 = 0.10;
%%% D�bit : w1 = 0.15; w2 = 0.15; w3 = 0.10; w4 = 0.50; w5 = 0.10;
%%% Interf�rences : w1 = 0.10; w2 = 0.50; w3 = 0.10; w4 = 0.20; w5 = 0.10;
%%% Efficacit� : w1 = 0.15; w2 = 0.10; w3 = 0.10; w4 = 0.15; w5 = 0.50;

%%weight vectors for emergency mode operation (minimizing BER)
w1 = 0.15; %BER
w2 = 0.1; %interferences
w3 = 0.1; %power
w4 = 0.15; %Debit
w5 = 0.5; %Eff

%Pbe
Pbe_max = 0.5768;
Pbe_min = 0.2065;
Pbe_mean =0.2452;

%%Maximum and minimum values for transmission parameters

power_max = 251; %maximum power in dB  251  in mW 24
power_min =  0.158; %minimum power in dB 0.158   in -8
bandwidth_max = 32; %maximum bandwidth in Hz
bandwidth_min = 2;  %minimum bandwidth in Hz
tdd_min = 25;   %minimum time for transmitting
tdd_max = 100;  %maximum time for transmitting
Mmax = 256; %maximum of modulation index
Mmin = 2; %minimum of modulation index
Rs_max = 125000; % Maximum symbol rate (Symbols / second)
Rs_min = 125;
P_Noise_max = 3.9810717055e-11;%dBm      -104        en 3.9810717055e-11mW
P_Noise_min = 3.9810717055e-12; %dBm       - 114          en 3.9810717055e-12mW



o = [0, 0, 0, 0, 0];
var = x;
%var = [p,band, M, tdd, N, Rs];

o(1) = w1*f_ber(var(2),var(1));
o(2) = w2*f_int(var(1), var(3), var(4), power_min,power_max,bandwidth_min, bandwidth_max, Rs_max);
o(3) = w3*f_power(var(1),power_max);
o(4) = w4*f_throughput(var(3), Mmax);
o(5) = w5*f_eff( var(3), bandwidth_min, var(2), Mmax, var(5), Rs_max);
a = (o(1)+o(2)+o(3)+ o(4)+o(5));


func = a;
