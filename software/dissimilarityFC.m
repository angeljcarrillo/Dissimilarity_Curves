function j = dissimilarityFC(vec, alpha, S,D)% vector de curvas, alpha, segmentos
%% CALCULAR MAXIMO DE DISIMILITUD
 alfa=[];
 for i=1:1:length(vec)
     alfaM=[];
     for u=1:1:length(vec)
         alfaM=[alfaM alfaSimFC(vec{:,i},vec{:,u},alpha,S,D)];         
         close all
     end
      alfa=[alfa; alfaM];
     
 end
 j=alfa;