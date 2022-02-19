function data=subChainFF(vA,EPSILON)
subC={};
chain=[];
T=0;
for i=1:1:length(vA)
    
    T=T+sum(abs(vA(:,i)));
    
    if T<=EPSILON
        chain=[chain vA(:,i)];
    else
        subC={subC{:,:} chain};
        T=0;
        chain=[];
        chain=[chain vA(:,i)];
        T=sum(abs(vA(:,i)));
    end   
    
    
end
subC={subC{:,:} chain};
data=subC;
