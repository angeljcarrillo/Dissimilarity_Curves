function j = dissimilarityFF(vec, alpha)% vector de curvas, alpha, segmentos
%% CALCULAR MAXIMO DE DISIMILITUD
 alfa=[];
 for i=1:1:length(vec)
     alfaM=[];
     for u=1:1:length(vec)
         alfaM=[alfaM dissimilarityMeasureF(vec{:,i},vec{:,u},alpha)];        
     end
      alfa=[alfa; alfaM];     
 end
 j=alfa;