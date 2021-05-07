function data=subChain5(vA,epsilon,A)

subC={};
subV={};
tempV=vA;
tempVA=A;
cont=1; 
data={};
while 1~=isempty(tempV) %&& cont ~= length(tempV)
       
        temp=tempV(:,1:cont);        
        if  (sum(abs(temp)) > epsilon && cont~=1)%  abs(sum(temp))%%CONCAV 1-0                       
            subC={subC{:,:} temp(:,1:end-1)}; %% ESCC
            subV={subV{:,:} tempVA(1:cont+1,:)}; %% PUNTOS
            tempV(:,1:cont-1)=[]; %% LIMPIAR ELEMENTOS DE ESCC
             tempVA(1:cont-1,:)=[]; %% LIMPIAR ELEMENTOS DE ESCC
            cont=0; 
        elseif  (sum(abs(temp)) == epsilon)
            subC={subC{:,:} temp(:,1:end)}; %% ESCC
            subV={subV{:,:} tempVA(1:cont+2,:)}; %% PUNTOS
            tempV(:,1:cont)=[]; %% LIMPIAR ELEMENTOS DE ESCC
             tempVA(1:cont,:)=[]; %% LIMPIAR ELEMENTOS DE ESCC
            cont=0; 
         elseif  (sum(abs(temp)) > epsilon && cont==1) 
             subC={subC{:,:} temp(:,1:end)}; %% ESCC
            subV={subV{:,:} tempVA(1:cont+2,:)}; %% PUNTOS
            tempV(:,1:cont)=[]; %% LIMPIAR ELEMENTOS DE ESCC
             tempVA(1:cont,:)=[]; %% LIMPIAR ELEMENTOS DE ESCC
            cont=0; 
         elseif  (sum(abs(temp)) < epsilon && cont == length(tempV)) 
             subC={subC{:,:} temp(:,1:end)}; %% ESCC
            subV={subV{:,:} tempVA(1:cont+2,:)}; %% PUNTOS
            tempV(:,1:cont)=[]; %% LIMPIAR ELEMENTOS DE ESCC
             tempVA(1:cont+2,:)=[]; %% LIMPIAR ELEMENTOS DE ESCC
            cont=0; 
        end
        
        
        cont=cont+1;    
end
% subC={subC{:,:} temp};
% subV={subV{:,:} tempVA};

data={subC subV};
