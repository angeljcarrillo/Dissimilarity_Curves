function j = dissimilarityFF(vec, EPSILON)% vector de curvas, alpha, segmentos
%% CALCULAR MAXIMO DE DISIMILITUD
 alfa=[];
 for i=1:1:length(vec)
     alfaM=[];
     for u=1:1:length(vec)
         alfaM=[alfaM dissimilarityMeasureF(vec{:,i},vec{:,u},EPSILON)];        
     end
      alfa=[alfa; alfaM];     
 end
 j=alfa;