
%% DEMO DISSIMILARITY WITH OTOLITHS SARDINILLA YUCATECA VERSUS PEZ LEON
clear all
close;
clc

%% PATH FOR OTOLITHS FOLDER
path='C:\Users\Igniter\Documents\Repos\Dissimilarity_Curves\software\otoliths'; %% CHANGE PATH
% THE FOLDER CAN BE CHANGE FOR NEW IMAGES
%% VARIABLES
m=100;
epsilon=0.7;
mainDissimilarity(path,m,epsilon) %% ADD THE PATH OF IMAGES, m= Number of segments for contours, epsilon= threshold of subchains
