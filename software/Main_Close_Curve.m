clear all
close all;
clc
  
%% CHANGE TO YOUR LOCAL PATH
%% PATH = LOCAL PATH+ \Demo\MPEG7CS\MPEG7CS_C\
path='...\Demo\MPEG7CS\MPEG7CS_C\'; 
dirListing = dir(path);
for i=1:length(dirListing) 
Data{i}=dirListing(i,1).name; 
f{i} = fullfile(path, Data{i});%----
end

f(:,1:2)=[];
close_curve={};
ID={};
SCC={};
TAU={};
ACC={};

%% GENERATE TEST DATA 60 IMAGE, 3 CLASSES
f=f(:,1:60);
%% GENERATE TEST DATA 40 IMAGE, 2 CLASSES
%f=f(:,1:40);
%% LOAD IMAGE, TEST ACC =2 OR -2, TORTUOSITY
for i=1:1:length(f)
    s=load(f{:,i});
    pointlist= s.a; 
    %pointlist= s.pointlist; 
    pointlist(end,:)=[];    
    scc=SCCF(pointlist(:,2),pointlist(:,1),0);  
    tau=sum(abs(scc));
    acc=sum(scc);
    TAU={TAU{:,:} tau};
    ACC={ACC{:,:} acc};
    SCC={SCC{:,:} scc};
    close_curve={close_curve{:,:} pointlist};
    %% SHOW CONTOURS WITH EQUAL SEGMNETS
%     figure(1)
%     plot(pointlist(:,1),pointlist(:,2),'',pointlist(:,1),pointlist(:,2),'b*')
%     pause(1)
%% ID NAME   
     id = strsplit(f{:,i},'\');
     ID={ID{:,:} id(1,end)}; %      
end
puntosT=close_curve; 
maxS=81;
%% NORMALIZAR SEG
%  vec=puntosT;
% for u=1:1:length(puntosT)
%    vec{:,u}=optimazeCurve(maxS,puntosT{:,u}); %
% end
% %% SALVAR CONTORNOS = SEGMENTOS
% for u=1:1:length(vec)
%    a= vec{:,u};   
%    save(string(ID{:,u}), 'a');
% end

%% DISSIMILARITY 
%% ALPHA VALUE
alpha=.5;
J=dissimilarityFC(close_curve,alpha,maxS,3); 
%% (VECTOR OF CURVES, ALPHA, SEGMENTS, ACCURACY ON CHAIN CODE)
h = heatmap(J);
h.Title = 'Dissimilarity';
h.XLabel = 'Dissimilarity Values';
h.YLabel = strcat('Alpha=',string(alpha));


