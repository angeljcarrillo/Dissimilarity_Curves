function dissimilarityMPEG7CS(path,m, epsilon)
%% PATH = LOCAL PATH+ \Demo\MPEG7CS\MPEG7CS_C\ 
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

%% LOAD IMAGE, TEST ACC =2 0R -2 CONTOURS
for i=1:1:length(f)
    s=load(f{:,i});
    pointlist= s.a; 
    pointlist(end,:)=[];    
    scc=SCCF(pointlist(:,2),pointlist(:,1),0);  
    tau=sum(abs(scc));
    acc=sum(scc);
    TAU={TAU{:,:} tau};
    ACC={ACC{:,:} acc};
    SCC={SCC{:,:} scc};
    close_curve={close_curve{:,:} pointlist};
%% ID NAME   
     id = strsplit(f{:,i},'\');
     ID={ID{:,:} id(1,end)}; %      
end
puntosT=close_curve; 
maxS=m;
%% DISCRETIZE CONTOURS BY m
 vec=puntosT;
for u=1:1:length(puntosT)
   vec{:,u}=optimazeCurve(maxS,puntosT{:,u}); %
end
%% CLASSES
Classes={};
cont=0;
IDClasses={};
LinkClasses={};
LabelClasses=[];
VPT=[];
ACCT=[];
for i=1:1:70    
    Classes={Classes{:,:} vec(:,1+cont:20+cont)};
    IDClasses={IDClasses{:,:} ID(:,1+cont)};
    LinkClasses={LinkClasses{:,:} f(:,1+cont:20+cont)};
    LabelClasses=[LabelClasses i*ones(1, 20)];
    cont=cont+20;
end
%% run 
for i=1:1:length(Classes)
Momega=[];
Z=i;
C1=Classes{:,Z};%Classes{:,U};
%% DISSIMILARITY
    for j=1:1:length(vec)
    omega=dissimilarityMeasureF2(C1{:,2},vec{:,j},epsilon);
    Momega=[Momega omega];
    end
  %% FIND THE FIRST 10 LESS VALUES
[~, idx] = mink(Momega, 10);
    BASE=LinkClasses{:,Z};
    s1=load(BASE{:,1});
    pointlist1= s1.a;
    pointlist1=[pointlist1; pointlist1(1,:)];
%% CONTOUR TO FIND DISSIMILARITY
    figure(1)
    plot(pointlist1(:,1),pointlist1(:,2),'',pointlist1(:,1),pointlist1(:,2),'k*','LineWidth',10.0)
    title('Contour to compare versus 1400 contours')
   
    %%
arrayVald=[];
    for h=1:1:length(idx)
        s=load(f{:,idx(:,h)});
        pointlist2= s.a;
        pointlist2=[pointlist2; pointlist2(1,:)];
        %% RECOVERY IMAGES
        figure(2)
        plot(pointlist2(:,1),pointlist2(:,2),'',pointlist2(:,1),pointlist2(:,2),'k*','LineWidth',10.0)
        title(strcat('The','..',string(h),' retrived contour'))
        pause(1)
        
        %%
        arrayVald=[arrayVald;LabelClasses(idx(:,h))];
    end
    VP=find(arrayVald==i);
    Acc=length(VP)/length(arrayVald);
    VPT=[VPT length(VP)];
    ACCT=[ACCT Acc];
end
ACCFULL=sum(VPT)/700;
MU = reshape(ACCT,[10,7]);
ACCT2= sort(MU,'ascend');



%% PLOT HEATP MAP ACCURACY
figure (3)
 R = heatmap(rot90(ACCT2),'CellLabelColor','none','GridVisible','off');   
 R.Colormap = hot(64);
 R.Title = 'Heatmap of Accuracy';
 %h.XLabel = 'Dissimilarity Values';
 R.YLabel = strcat('Accuracy 70 classes=',string(ACCFULL));





end
