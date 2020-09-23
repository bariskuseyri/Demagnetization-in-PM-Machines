%% Intro
% PM B-H curve interpolation
% Author: Baris Kuseyri <baris.kuseyri@metu.edu.tr>

%% Initialization

clc
clear all
close all

%% Variables & Constants

mu_0 = 4*pi*1e-7;   % vacuum permeability

B_r50 = 1.15;   % remanent magnetic flux density @ 50degC [T]
H_c50 = -836000; % coercivity @ 50degC [A/m]
mu_r50 = abs(B_r50/(H_c50*mu_0));   % relative permeability []

B_r180 = 1.10;   % remanent magnetic flux density @ 180degC [T]
H_c180 = -600000; % coercivity @ 180degC [A/m]
H_c180ic = -800000; % coercivity value without demag [A/m]
mu_r180 = abs(B_r180/(H_c180ic*mu_0));   % relative permeability []

mu_demag = 0.35/(-H_c180 - (1.10-0.35)/(mu_0*mu_r180));


H1_50 = linspace(-1000000,-836000);
B1_50 = mu_demag*H1_50-mu_demag*H_c50;
H2_50 = linspace(-836000,0);
B2_50 = mu_0*mu_r50*H2_50+B_r50;
BH50 = [B1_50 B2_50 ;H1_50 H2_50];
% plot(BH50(2,:),BH50(1,:))

H1_180 = linspace(-1000000,-600000);
B1_180 = mu_demag*H1_180-mu_demag*H_c180;
H2_180 = linspace(-600000,0);
B2_180 = mu_0*mu_r180*H2_180+B_r180-0.35;
BH180 = [B1_180 B2_180 ;H1_180 H2_180];
% plot(BH180(2,:),BH180(1,:))




