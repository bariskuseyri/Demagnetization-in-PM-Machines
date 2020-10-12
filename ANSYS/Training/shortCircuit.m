%% Intro
% Phasor diagram
% EM: 27-slot / 22-pole, 3-phase | double layer | coil span: 1 slot
%
% Author: Baris Kuseyri<baris.kuseyri@metu.edu.tr>
%
% version 1.1 | 28/03/2020

%% Initialization

clc
clear all
close all

%% 

t = [0 2 2.75 4.5 5.25 10];
mult = [1 1 10 10 1 1];


I_pk = 50*sqrt(2);
f_e = 50;
ph_e = -105;

I_a = I_pk*cos(2*pi*f_e*t+ph_e);
I_b = I_pk*cos(2*pi*f_e*t+ph_e-120);
I_c = I_pk*cos(2*pi*f_e*t+ph_e-240);

I_al = ;
I_be = ;

I_d = ;
I_q = ;