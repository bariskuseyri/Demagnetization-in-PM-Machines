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
H_knee180 = -((B_r180-0.35)/(mu_0*mu_r180));
mu_demag = 0.35/(-H_c180 - (1.10-0.35)/(mu_0*mu_r180));

H1_50 = [-1000000:5000:round(H_c50) H_c50];
B1_50 = mu_demag*H1_50-mu_demag*H_c50;
H2_50 = H1_50(size(H1_50,2)):5000:0;
B2_50 = mu_0*mu_r50*H2_50+B_r50;
BH50_rough = [H1_50 H2_50(2:size(H2_50,2)); B1_50 B2_50(2:size(B2_50,2))];
BH50 = [BH50_rough(1,:); smooth(BH50_rough(2,:),0.1)'];
% plot(BH50(1,:),BH50(2,:))


H1_180 = [-1000000:5000:round(H_knee180) H_knee180];
B1_180 = mu_demag*H1_180-mu_demag*H_c180;
H2_180 = H1_180(size(H1_180,2)):5000:0;
B2_180 = mu_0*mu_r180*H2_180+B_r180;
BH180_rough = [H1_180 H2_180(2:size(H2_180,2)); B1_180 B2_180(2:size(B2_180,2))];
BH180 = [BH180_rough(1,:); smooth(BH180_rough(2,:),0.1)'];
% plot(BH180(1,:),smooth(BH180(2,:)))

%% Max. Energy

E = zeros(1, size(BH180,2));
for i = 1:size(BH180,2)
    E(1,i) = abs(BH180(2,i)*BH180(1,i));
end

plot(BH180(1,:),E/1e6)
hold on
plot(BH180(1,:),smooth(BH180(2,:)))




%% Creating .tab file

str1 = append(char(34),"H(A/m)",char(34));
str2 = append(char(34),"B(teslas)",char(34));
title = [str1,str2];

fileID1 = fopen('ee361mt1q1_PMBHcurve50degC.tab','w');
fprintf(fileID1,'%5s\t%5s\r\n',title);
fprintf(fileID1,'%12.8f\t%5.8f\r\n',fliplr(BH50));
fclose(fileID1);

fileID1 = fopen('ee361mt1q1_PMBHcurve180degC.tab','w');
fprintf(fileID1,'%5s\t%5s\r\n',title);
fprintf(fileID1,'%4.0f \t%5.8f\r\n',BH180);
fclose(fileID1);

