%% Intro
% PM B-H curve interpolation
% Author: Baris Kuseyri <baris.kuseyri@metu.edu.tr>

%% Initialization

clc
clear all
close all

%% VACODYM 633AP 20degC BH Curve

copyfile("VAC633AP20degC_B(T)H(kOe).tab","vacodym.tab")

fileID = fopen('vacodym.tab','r');
formatSpec = '%s';
N = 2;
C_text = textscan(fileID,[repmat('%s',[1,2])],'CollectOutput',1);
C_array = vertcat(C_text{:});

title = C_array(1:2,:);
% s1 = strcat(title(1,1),title(1,2));
s2 = strcat(title(2,1),title(2,2));
s1 = '"H(A/m)"';
% s2 = '"B(T)"';
title = string([s1 s2]);

array_size = size(C_array,1);

HkOe = str2double(C_array(3:array_size,1));
HAm = (1000*(1000/(4*pi)))*HkOe;

BT = str2double(C_array(3:array_size,2));

BH = [HAm';BT'];

fclose(fileID);


fileID1 = fopen('VAC633AP20degC_B(T)H(Am).tab','w');
fprintf(fileID1,'%5s\t%5s\r\n',title);
fprintf(fileID1,'%12.8f\t%5.8f\r\n',BH);
fclose(fileID1);