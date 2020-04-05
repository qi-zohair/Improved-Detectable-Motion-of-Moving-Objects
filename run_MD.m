%% Title: Improved Detectable Motion of Moving Objects

%% Created by Zohair Al-Ameen.
% Department of Computer Science, 
% College of Computer Science and Mathematics,
% University of Mosul, 
% Mosul, Nineveh, Iraq

%% Please report bugs and/or send comments to Zohair Al-Ameen.
% Email: qizohair@uomosul.edu.iq

%% When you use this code or any part of it, please cite the following article:  
% Zohair Al-Ameen, Shamil Al-Ameen, Roua Al-Taie, and Ghazali Sulong. 
% "Low-Complexity Technique to Improve Detectable Motion of Moving Objects in a Sequence of Images." 
% TechArt: Journal of Arts and Imaging Science, vol. 2, no. 4, (2015): pp. 48-52. DOI: 10.15323/techart.2015.11.2.4.48
%% Note %%%%%%%%%%%%%%%Please Read Carefully%%%%%%%%%%%%%%%%%%%%
% IMPORTANT NOTE: this code was developed using MATLAB 2008.   %
%                 It may not work with new MATALB versions.    %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Starting implementation %%
clc; clear all; close all

avi = aviread('ira_walk.avi'); %% read original vieo
video = {avi.cdata};
for b = 1:length(video)
    imagesc(video{b}); title('Original Video'); %% display original video
    axis image off
    drawnow;
end

for a = 1:2:length(video) %% number of frames the video have
     if (a == length(video)-1) %% matrix dont exceed the limit
        break
    end
    a1=video{a}; %% save current frame to a var
    a2=video{a+1}; %% save next frame to a var
    aaa=abs(a1-a2).^2; %% absolute difference
    aaa1=(aaa(:,:,1)+aaa(:,:,2)+aaa(:,:,3));
    aaa2=ordfilt2(aaa1,30,true(6));
    aaa3=im2double(aaa2);
    zeta=5;
    aaa3=(aaa3.^zeta);
    imshow(aaa3); title('Motion Video');
    drawnow;
end