function func = fit_4( x )
x =  real(x);
%%weight vectors for emergency mode operation (minimizing BER)
%%%%%%%%%%%% Modes : 
%%% BER : w1 = 0.50; w2 = 0.10; w3 = 0.10; w4 = 0.10; w5 = 0.20;
%%% Power : w1 = 0.10; w2 = 0.15; w3 = 0.45; w4 = 0.20; w5 = 0.10;
%%% Débit : w1 = 0.15; w2 = 0.15; w3 = 0.10; w4 = 0.50; w5 = 0.10;
%%% Interférences : w1 = 0.10; w2 = 0.50; w3 = 0.10; w4 = 0.20; w5 = 0.10;
%%% Efficacité : w1 = 0.15; w2 = 0.10; w3 = 0.10; w4 = 0.15; w5 = 0.50;

w1 = 0.10; %BER
w2 = 0.5; %interferences
w3 = 0.1; %power
w4 = 0.2; %Debit
w5 = 0.1; %Eff

%Pbe
Pbe_max = 0.5768;
Pbe_min = 0.2065;
Pbe_mean =0.2452;


%%Maximum and minimum values for transmission parameters

power_max =   251; %maximum power in dB  251  23,996737215
power_min = 0.158; %minimum power in dB 0.158  -8,0134291305
bandwidth_max = 32; %maximum bandwidth in Hz
bandwidth_min = 2;  %minimum bandwidth in Hz
tdd_min = 25;   %minimum time for transmitting
tdd_max = 100;  %maximum time for transmitting
Mmax = 256; %maximum of modulation index
Mmin = 2; %minimum of modulation index
Rs_max = 125000; % Maximum symbol rate (Symbols / second)
Rs_min = 125;
P_Noise_max = 6.3095734448e-12;%dBm      -104        en 3.9810717055e-11mW
P_Noise_min = 1.995262315e-12; %dBm       - 114          en 3.9810717055e-12mW

var(1)= (power_min:0.1:power_max);
var(2)= [ 2 4 16 64 256 ];
var(3)= (bandwidth_min:2:bandwidth_max);
var(4)= (25:25:100);
var(5)= (1.995262315e-12:1:6.3095734448e-12);
var(6)= (Rs_min:2:Rs_max);

o = [0, 0, 0, 0, 0];
%var = x;
%var = [p,band, M, tdd, N, Rs];

o(1) = w1*f_ber(var(5));
o(2) = w2*f_int(var(1), var(3), var(4), power_min,power_max,bandwidth_min, bandwidth_max, Rs_max);
o(3) = w3*f_power(var(1),power_max);
o(4) = w4*f_throughput(var(3), Mmax);
o(5) = w5*f_eff( var(3), bandwidth_min, var(2), Mmax, var(6), Rs_max);
a = (o(1)+o(2)+o(3)+ o(4)+o(5)); 


func = a;
