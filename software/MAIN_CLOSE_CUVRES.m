clear all
close all;
clc
  
%% OPEN MPEG7CS_PL AND COPY THE FULL PATH
path='E:\Matlab\MATLAB\Doctorado\SIMILARITY\Dataset\MPEG7CS\MPEG7CS_PL';

dirListing = dir(path);
for i=1:length(dirListing) 
Data{i}=dirListing(i,1).name; 
f{i} = fullfile(path, Data{i});%----
end

f(:,1:2)=[];
close_curve={};
ID={};
SCC={};
TAU=[];
ACC={};
S=[];

%% LOAD IMAGE, TEST ACC =2 OR -2, TORTUOSITY
for i=1:1:length(f)
    s=load(f{:,i});    
    pointlist= s.pointlist;    
    scc=SCCF(pointlist(:,2),pointlist(:,1),0);  
    tau=sum(abs(scc));
    acc=sum(scc);
    TAU=[TAU tau];
    ACC={ACC{:,:} acc};
    SCC={SCC{:,:} scc};
    S=[S length(pointlist)];
    if ~mod(i,2) 
        pointlist=pointlist/2;
    else
        pointlist=pointlist*2;
    end
    close_curve={close_curve{:,:} pointlist};
   
    
%% ID NAME   
     id = strsplit(f{:,i},'\');
     ID={ID{:,:} id(1,end)}; %  
%     
end


[min1,indx1] = min(TAU);
[max1,indx2] = max(TAU);
media1=median(TAU);
index3 = find(TAU==media1) ;
%% %%%%%%%%%%%%%%%%%%%%%%%
puntosT=close_curve; 

maxS=41;
%% NORMALIZAR SEG
 vec=puntosT; 
for u=1:1:length(puntosT)
   vec{:,u}=optimazeCurve(maxS,puntosT{:,u}); %
end


%% FULL CLASSES
Classes={};
cont=0;
IDC={};
for i=1:1:58    
    Classes={Classes{:,:} vec(:,1+cont:20+cont)};
    IDC={IDC{:,:} ID(:,1+cont:20+cont)};
    cont=cont+20;
end
 vec={Classes{:,1}  Classes{:,2} };
 vec2={};
 for i=1:1:length(vec)
     vec1=vec{:,i};
     for j=1:1:length(vec1)
         vec2={vec2{:,:} vec1{:,j}};
     end     
 end
%% CLASSES
IDSC={IDC{:,1}{1,1} IDC{:,2}{1,1}} ;
vec=vec2;
%% OUR METHOD
alpha=0.30;
J=dissimilarityF(vec,alpha,maxS,8);
        
%% DISSIMILARITY FRETCHET
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



