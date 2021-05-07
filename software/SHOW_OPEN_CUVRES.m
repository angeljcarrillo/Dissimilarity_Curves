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

%% SHOW
puntosT=open_curve;
 vec=puntosT; 
for u=1:1:length(puntosT)
    ptD=puntosT{:,u}; % 
    figure(1)
    plot(ptD(:,1),ptD(:,2),'',ptD(:,1),ptD(:,2),'k-')
    pause(1)
end