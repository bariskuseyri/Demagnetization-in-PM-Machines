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

%% dq axis

figure(1)
axis equal
axis([-1.5 1.5 -1.5 1.5])
set(gca,'visible','off')
set(gca,'xtick',[])

for i = 1:6
    t = linspace((i-1)*(2*pi/6)-(2*pi/12), i*(2*pi/6)-(2*pi/12));
    sector = patch([0 1.2*cos(t) 0], [0 1.2*sin(t) 0], [1 0 1]);
    edgea = sector.EdgeAlpha;
    facea = sector.FaceAlpha;
    sector.EdgeAlpha = 0.0;
    sector.FaceAlpha = 0.2;    
end

dq_label = ["d", "q", "-d", "-q"];

for i = 0:7
    x = [0 cos((pi/4)+(pi/4)*i)];
    y = [0 sin((pi/4)+(pi/4)*i)];
    v(i+1)=line(x,y,'Color','k','LineStyle','-');
    text(1.1*cos((pi/4)+(pi/4)*i),1.1*sin((pi/4)+(pi/4)*i),dq_label(mod(i,4)+1),'HorizontalAlignment','center','VerticalAlignment','middle')
end




