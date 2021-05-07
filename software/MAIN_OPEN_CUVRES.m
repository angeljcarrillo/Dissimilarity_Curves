clear all
close all;
clc
%% OPEN BerkeleyCS_PL AND COPY THE FULL PATH
path='E:\Matlab\MATLAB\Doctorado\SIMILARITY\Dataset\BerkeleyCS\BerkeleyCS_PL'; 
dirListing = dir(path);
for i=1:length(dirListing) 
Data{i}=dirListing(i,1).name; 
f{i} = fullfile(path, Data{i});%----
end

f(:,1:2)=[];
open_curve={};
ID={};
SCC={};
TAU={};
ACC={};
S=[];
%% C1
C1=f(:,1:44);
%% C2
C2=f(:,45:99);
%% C3
C3=f(:,100:191);
%% C4
C4=f(:,192:239);
%% C5
C5=f(:,240:271);
%% %% TEST
Data={C1{:,:} C2{:,:} };

for i=1:1:length(Data)
    s=load(Data{:,i});    
    pointlist= s.pointlist;       
    scc=SCCF(pointlist(:,2),pointlist(:,1),1);  
    tau=sum(abs(scc));
    acc=sum(scc);
    TAU={TAU{:,:} tau};
    ACC={ACC{:,:} acc};
    SCC={SCC{:,:} scc};
   %% SIZE VARIATION
    S=[S length(pointlist)];
    if ~mod(i,2) 
        pointlist=pointlist/2;
    else
        pointlist=pointlist*2;
    end
     open_curve={open_curve{:,:} pointlist};
    %% SHOW CONTOURS WITH EQUAL SEGMNETS
%% ID NAME   
     id = strsplit(Data{:,i},'\');
     ID={ID{:,:} id(1,end)}; %      
end

maxS=41;
%% NORMALIZAR SEG
puntosT=open_curve;
 vec=puntosT; 
for u=1:1:length(puntosT)
   vec{:,u}=optimazeCurve(maxS,puntosT{:,u}); %
end

%% OUR METHOD
alpha=0.30;
J=dissimilarityF(vec,alpha,maxS,8);

% %         
        
%%        DISSIMILARITY  FRETCHET
         matF=[];
            for u=1:1:length(vec)
                value=[];
               for h=1:1:length(vec)                  
                   [cm, cSq] = DiscreteFrechetDist(vec{:,u},vec{:,h});
                   value=[value cm];
               end
                matF=[matF; value];
            end
%%
%%
%% (VECTOR OF CURVES, ALPHA, SEGMENTS, ACCURACY ON CHAIN CODE)
%%%%%%%%%%%%%%%%%%%%%%%%%
figure(1)
h = heatmap(J);
h.Colormap = hot(64);
fig = gcf;    %or one particular figure whose handle you already know, or 0 to affect all figures
set( findall(fig, '-property', 'fontsize'), 'fontsize', 24)
grid off
Ax = gca;
Ax.XDisplayLabels = nan(size(Ax.XDisplayData));
Ax.YDisplayLabels = nan(size(Ax.YDisplayData));
title('Our Method')


MaxV=max(max(matF));
matF=matF/MaxV;
figure(2)
h = heatmap(matF);
h.Colormap = hot(64);
fig = gcf;    %or one particular figure whose handle you already know, or 0 to affect all figures
set( findall(fig, '-property', 'fontsize'), 'fontsize', 24)
grid off
Ax = gca;
Ax.XDisplayLabels = nan(size(Ax.XDisplayData));
Ax.YDisplayLabels = nan(size(Ax.YDisplayData));
title('Frechet distance')


