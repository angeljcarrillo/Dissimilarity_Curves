function data=differenceSubChainsFF(U,Z,subChainU)
Ut=U;
Zt=Z;
delta=0;
Delta=[];
for i=1:1:length(subChainU)
    chain=subChainU{:,i};
    for j=1:1:length(chain)
        delta=delta+(abs(Ut(:,j)-Zt(:,j)))/length(chain);
    end
    Delta=[Delta delta];
    delta=0;
    Ut(:,1:j)=[];
    Zt(:,1:j)=[];   
    
end

data=Delta;
