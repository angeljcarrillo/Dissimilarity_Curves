function data=ESCCF(ptD,E)
% figure(1)
% plot(ptD(:,1),ptD(:,2),'',ptD(:,1),ptD(:,2),'b*')
% % plot(C(:,2),C(:,1),'r*',C(:,2),C(:,1),'b-o')
% %axis([0 300 0 300])
% axis equal
% grid on
% xlabel X
% ylabel Y
ptD=esccP(ptD(:,1),ptD(:,2));
% figure(2)
% plot(ptD(:,1),ptD(:,2),'',ptD(:,1),ptD(:,2),'b')
% title('Representation ESCC')
% axis equal
% grid on
% xlabel X
% ylabel Y
alphaN=SCCF(ptD(:,2),ptD(:,1),E);
data={alphaN,ptD};