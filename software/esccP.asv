function pointsFF=esccP(px,yf)
ptD=[px,yf];
pointsF=[];
j=3;
%%%%%%%%%%%% ALGORITMO NUEVO
for i=1:1:length(ptD)-2    
     ptT=ptD(i:j,:);
      ys=ptT(:,2);
     alphaN=SCCF(ys,ptT(:,1),1);    
     path=[ptT(1:3,1) ys(1:3,1)];
    total_length = arclength(path(:,1)',path(:,2)','spline');
    l=(1-abs(alphaN));
    %disp(round((total_length/l)))
    points=interparc(round((total_length/l)),path(:,1),path(:,2),'spline');
    pointsF=[pointsF; points(1:2,:)];   
    j=j+1;
end
pointsF=[pointsF; ptD(end-1:end,:)];
 %% APLICAR A LA COLA
pointsF2=[];
ptD2=pointsF(end-2:end,:);
j=3;
for i=1:1:length(ptD2)-2    
     ptT=ptD2(i:j,:);
      ys=ptT(:,2);
     alphaN=SCCF(ys,ptT(:,1),1);
     path=[ptT(1:end,1) ys(1:end,1)];    
     total_length = arclength(path(:,1)',path(:,2)','spline');     
     l=(1-abs(alphaN));
     %disp(round((total_length/l)))
     points=interparc(round((total_length/l)),path(:,1),path(:,2),'spline');     
     pointsF2=[pointsF2; points(end-1:end,:)];     
    j=j+1;
end
 pointsFF=[pointsF(1:end-1,:); pointsF2];

