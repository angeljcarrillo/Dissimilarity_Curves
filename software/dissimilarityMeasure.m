function omega=dissimilarityMeasure(U,Z,alfa) %% A(X,Y)=B, EPSILON(0-1). #SEGMENTO, DECIMALES

p11=U;
p22=Z;

%% SCC
vU=SCCF(p11(:,2),p11(:,1),0);
vZ=SCCF(p22(:,2),p22(:,1),0);
%% MATCH
vZ=matchOpt(vU,vZ);
%% Detect Sub-Chains
subChainU=subChainFF(vU,alfa);
subChainZ=subChainFF(vZ,alfa);

%% REST U-U(Z)
deltaU=differenceSubChainsFF(vU,vZ,subChainU);

%% REST Z-Z(U)
deltaZ=differenceSubChainsFF(vZ,vU,subChainZ);

Beta= min([sum(deltaU)/length(subChainU) sum(deltaZ)/length(subChainZ)]);

sigma=abs(length(subChainU)-length(subChainZ))/length(vU);

omega=(Beta+sigma)/2;


