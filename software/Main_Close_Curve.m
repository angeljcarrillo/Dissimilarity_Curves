clear all
close all;
clc
  
%% CHANGE TO YOUR LOCAL PATH
%% PATH = LOCAL PATH+ \Demo\MPEG7CS\MPEG7CS_C\
path='E:\Matlab\MATLAB\Doctorado\SIMILARITY\Demo\MPEG7CS\MPEG7CS_C\'; 
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
    
%     figure(1)
%     plot(pointlist(:,1),pointlist(:,2),'',pointlist(:,1),pointlist(:,2),'b*')
%     pause(1)
%% ID NAME   
     id = strsplit(f{:,i},'\');
     ID={ID{:,:} id(1,end)}; 
%      disp(ID{:,i})
end

%% AVAILABLE TO BE CHOSEN 
% puntosT={};
% esccT={};
% for h=1:1:length(close_curve)
%     ptD=close_curve{:,h};
%     %%
%     ptD(end,:)=[];
%     temp=ESCCFC(ptD,1);   
%     %%
%     NewP=temp{1,2};
%     NewP=[NewP; NewP(1,:)];
%     puntosT={puntosT{:,:} NewP};
%     esccT={puntosT{:,:} temp{1,1}}; 
% end
puntosT=close_curve;
 % BUSCAR MAXIMO DE SEG
%  seg=[];
%  for i=1:1:length(puntosT)     
%       seg=[seg(:,:) length(puntosT{:,i})];    
%  end
% maxS=max(seg);
maxS=81;
%  % NORMALIZAR SEG
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
alpha=1;
J=dissimilarityFC(close_curve,alpha,maxS,3); 
%% (VECTOR OF CURVES, ALPHA, SEGMENTS, ACCURACY ON CHAIN CODE)
h = heatmap(J);
% xvalues = {'(a)','(b)','(c)','(d)','(e)','(f)','(g)','(h)','(i)'};
% yvalues = {'(a)','(b)','(c)','(d)','(e)','(f)','(g)','(h)','(i)'};
% h = heatmap(xvalues,yvalues,J);

h.Title = 'Dissimilarity';
h.XLabel = 'Chi Values';
h.YLabel = strcat('Alpha=',string(alpha));


