function alfa=alfaSimFC(A,B,epsilon,segByLCM,D) %% A(X,Y)=B, EPSILON(0-1). #SEGMENTO, DECIMALES
%% COLORES Y SIMBOLOS
all_colors = {'y','m','c','r','g','b','k'};
all_marks = {'o','+','*','.','x','s','d','^','v','>','<','p','h'}; 
 %% NUEVO INICIO
p11=A;
p22=B;
%% SCC
vA=anguloContingencia2(p11(:,2),p11(:,1),1);
vB=anguloContingencia2(p22(:,2),p22(:,1),1);
%% MATCH
outN=matchFMinV4(vB,vA); %% (B, A) EL SEGUNDO TERMINO SE ROTA
vA=outN{:,1};
%% PRECIION EN EL CODIO
vA = round(vA,D);
vB = round(vB,D);

%% 
subCA=subChain4(vA,epsilon,p11);
esccASC=subCA{:,1};
vASC=subCA{:,2};
%% VISTA
cont1C=1;
cont1M=1;
for u=1:1:length(vASC)    
    poA=vASC{:,u};
    figure(3)
    if cont1C>7
        cont1C=1;
    end
    if cont1M>13
        cont1M=1;
    end
    plot(poA(:,1),poA(:,2),'',poA(:,1),poA(:,2),strcat(all_colors{:,cont1C}),'LineWidth',1)
    hold on
    
    cont1C=cont1C+1;
    cont1M=cont1M+1;
end

%%
subCB=subChain4(vB,epsilon,p22);
esccBSC=subCB{:,1};
vBSC=subCB{:,2};
%% VISTA
cont1C=1;
cont1M=1;
for u=1:1:length(vBSC)
    poB=vBSC{:,u};
    figure(4)
    if cont1C>7
        cont1C=1;
    end
    if cont1M>13
        cont1M=1;
    end
    plot(poB(:,1),poB(:,2),'',poB(:,1),poB(:,2),strcat(all_colors{:,cont1C}),'LineWidth',1)
    hold on
    
    cont1C=cont1C+1;
    cont1M=cont1M+1;
end
%% IGUALAR LA DIVIISON DE SUB CADENA DE B->A
%%
equalSUB_BA=equalSubChain(vB,p22,esccASC);
%% IGUALAR LA DIVIISON DE SUB CADENA DE A->B
%%
equalSUB_AB=equalSubChain(vA,p11,esccBSC);
%% VISTA
cont1C=1;
cont1M=1;
for u=1:1:length(equalSUB_BA)
 
    poA=equalSUB_BA{:,u};
    figure(5)
    if cont1C>7
        cont1C=1;
    end
    if cont1M>13
        cont1M=1;
    end
    plot(poA(:,1),poA(:,2),'',poA(:,1),poA(:,2),strcat(all_colors{:,cont1C}),'LineWidth',1)
    hold on
    
    cont1C=cont1C+1;
    cont1M=cont1M+1;
end
%% VISTA
cont1C=1;
cont1M=1;
for u=1:1:length(equalSUB_AB)
    
    poB=equalSUB_AB{:,u};   
    figure(6)
    if cont1C>7
        cont1C=1;
    end
    if cont1M>13
        cont1M=1;
    end
    plot(poB(:,1),poB(:,2),'',poB(:,1),poB(:,2),strcat(all_colors{:,cont1C}),'LineWidth',1)
    hold on
    
    cont1C=cont1C+1;
    cont1M=cont1M+1;
end

%% IGUALAR SEG EN SUB SUB CADENAS DE A->B->A PARA VISUALIZAR
maxFullS=segByLCM;
%% APICAR SEG EN SUB SUB CADENAS DE A->B
subAN={};
subBN={};
for i=1:1:length(vASC)
    temp=vASC{:,i}; %% A CON COVEXA 
    subAN={subAN{:,:} optimazeCurve(maxFullS,temp)}; %% PUNTOS A
    temp2=equalSUB_BA{:,i};
    subBN={subBN{:,:} optimazeCurve(maxFullS,temp2)};
end
%% VISTA SUB SUB A
cont3C=1;
cont3M=1;
for u=1:1:length(subAN)
    poAA=subAN{:,u};   
    figure(7)
    if cont3C>7
        cont3C=1;
    end
    if cont3M>13
        cont3M=1;
    end
    plot(poAA(:,1),poAA(:,2),'',poAA(:,1),poAA(:,2),strcat(all_colors{:,cont3C}),'LineWidth',1)
    hold on
    
    cont3C=cont3C+1;
    cont3M=cont3M+1;
end
%% VISTA SUB SUB B
cont4C=1;
cont4M=1;
for u=1:1:length(subBN)
    poBB=subBN{:,u};   
    figure(8)
    if cont4C>7
        cont4C=1;
    end
    if cont4M>13
        cont4M=1;
    end
    plot(poBB(:,1),poBB(:,2),'',poBB(:,1),poBB(:,2),strcat(all_colors{:,cont4C}),'LineWidth',1)
    hold on
    
    cont4C=cont4C+1;
    cont4M=cont4M+1;
end

%% APICAR SEG EN SUB SUB CADENAS DE A->B
subBN2={};
subAN2={};    
for i=1:1:length(vBSC)
    temp3=vBSC{:,i}; %% B CON COVEXA 
    subBN2={subBN2{:,:} optimazeCurve(maxFullS,temp3)}; %% PUNTOS A
    temp4=equalSUB_AB{:,i};
     %% A RESPETA CONVEXA B
    subAN2={subAN2{:,:} optimazeCurve(maxFullS,temp4)};
end
%% VISTA SUB SUB B
cont5C=1;
cont5M=1;
for u=1:1:length(subBN2)
    poBB2=subBN2{:,u};   
    figure(9)
    if cont5C>7
        cont5C=1;
    end
    if cont5M>13
        cont5M=1;
    end
    plot(poBB2(:,1),poBB2(:,2),'',poBB2(:,1),poBB2(:,2),strcat(all_colors{:,cont5C}),'LineWidth',1)
    hold on
    
    cont5C=cont5C+1;
    cont5M=cont5M+1;
end
%% VISTA SUB SUB A
cont6C=1;
cont6M=1;
for u=1:1:length(subAN2)
    poAA2=subAN2{:,u};   
    figure(10)
    if cont6C>7
        cont6C=1;
    end
    if cont6M>13
        cont6M=1;
    end
    plot(poAA2(:,1),poAA2(:,2),'',poAA2(:,1),poAA2(:,2),strcat(all_colors{:,cont6C}),'LineWidth',1)
    hold on
    
    cont6C=cont6C+1;
    cont6M=cont6M+1;
end
%% CALCULO SCC A->B
subANSCC={};
subBNSCC={};
for i=1:1:length(subAN)
    temp5=subAN{:,i};
    subANSCC={subANSCC{:,:} anguloContingencia2(temp5(:,2),temp5(:,1),1);}; %%
    temp6=subBN{:,i};   
    subBNSCC={subBNSCC{:,:} anguloContingencia2(temp6(:,2),temp6(:,1),1);};%     
%     dlmwrite(strcat( '1','.txt'),[length(subANSCC{:,:}) subANSCC{:,:}],'delimiter','\t','precision','%.6f')
%     dlmwrite(strcat( '2','.txt'),[length(subBNSCC{:,:}) subBNSCC{:,:}],'delimiter','\t','precision','%.6f')
end
%% CALCULO SCC B->A
subBN2SCC={};
subAN2SCC={};

for i=1:1:length(subBN2)
    temp7=subBN2{:,i};
    subBN2SCC={subBN2SCC{:,:} anguloContingencia2(temp7(:,2),temp7(:,1),1);}; %%
    temp8=subAN2{:,i};   
    subAN2SCC={subAN2SCC{:,:} anguloContingencia2(temp8(:,2),temp8(:,1),1);};
end

%% CALCULO DE DISIMILITUD
muAB=[];
muAB2=[];
for u=1:1:length(subANSCC)
    %% A->B
    AChain=subANSCC{:,u};    
    BChain=subBNSCC{:,u};   
    dif=sum(AChain)-sum(BChain);
    dif2=sum(abs(AChain-BChain));
    muAB=[muAB(:,:) dif];
    muAB2=[muAB2(:,:) dif2];
end
muABN=sum(abs(muAB))/length(muAB);
muABN2=sum(abs(muAB2))/length(muAB2);

muBA=[];
muBA2=[];
for u=1:1:length(subAN2SCC)
    %% B->A
    AChain2=subAN2SCC{:,u};    
    BChain2=subBN2SCC{:,u};   
    dif=sum(AChain2)-sum(BChain2);
    dif2=sum(abs(AChain2-BChain2));
    muBA=[muBA(:,:) dif];
    muBA2=[muBA2(:,:) dif2];
end
muBAN=sum(abs(muBA))/length(muBA);
muBAN2=sum(abs(muBA2))/length(muBA2);

alfa=min([muABN2 muBAN2]);


end