function output = optimazeCurve(segmentos,X)% X[x,y]
 pt = interparc(segmentos,X(:,1),X(:,2),'spline');
 px=pt(:,1);
 py=pt(:,2);
 B=[px,py];
 ptD=B;
 %ptD2=ptD(1:end-1,:);
figure(1)
plot(ptD(:,1),ptD(:,2),'',ptD(:,1),ptD(:,2),'b*')
% plot(C(:,2),C(:,1),'r*',C(:,2),C(:,1),'b-o')
%axis([0 300 0 300])
axis equal
grid on
xlabel X
ylabel Y
output=ptD;
