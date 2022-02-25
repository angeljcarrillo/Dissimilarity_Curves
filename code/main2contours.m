clear all
close all;
clc
 
%% CHANGE TO YOUR LOCAL PATH
%% PATH = LOCAL PATH+ \Demo\MPEG7CS\MPEG7CS_C\
path='D:\Matlab\MATLAB\Doctorado\SIMILARITY\Demo\Demo\MPEG7CS\MPEG7CS_C'; 
%% SELEC VALUE OF m AND epsilon 
m=19;
epsilon=0.67;
%%
dirListing = dir(path);
for i=1:length(dirListing) 
Data{i}=dirListing(i,1).name; 
f{i} = fullfile(path, Data{i});%----
end
%%
f(:,1:2)=[];
close_curve={};
%% LOAD IMAGE, TEST ACC =2 0R -2 CONTOURS
for i=1:1:length(f)
    s=load(f{:,i});
    pointlist= s.a; 
    pointlist(end,:)=[];
    close_curve={close_curve{:,:} pointlist};
end
%% DISCRETIZE
puntosT=close_curve; 
 vec=puntosT;
for u=1:1:length(puntosT)
   vec{:,u}=optimazeCurve(m,puntosT{:,u}); %
end
%% DISSIMILARITY BETWEEN TWO CONTOURS 
omega=dissimilarityMeasureF2(vec{:,1},vec{:,2},epsilon);

%%


