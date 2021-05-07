%%%%
function data=equalSubChain(esccB,pB,esccA) %% MENOR ESCC, MENOR PUNTOS, MAYOR SUB C ESCC
    subC={};
    subV={};
    esccBTemp=esccB;
    pointsTemp=pB;   
   %%
   %%
for i=1:1:length(esccA)  
     %%
    L=length(esccA{:,i});  
    temp=pointsTemp(1:L+2,:);
    subV={subV{:,:} temp(:,1:end)}; %% ESCC    
    %%
      %% LIMPIAR ELEMENTOS DE PUNTOS
      pointsTemp(1:L,:)=[]; %% LIMPIAR ELEMENTOS DE B
    
end

data=subV;