function [] = SensVBestGenomeErrorCombined(grad1,grad2,bestgenome1,bestgenome2,bestgenome3,xlimit)

hold on;

which_gradient1 = ([bestgenome1>0].*grad1(1,:)')+  ([bestgenome1<0].*grad2(1,:)')+  ([bestgenome1==0].*mean( [-grad1(1,:)'  grad2(1,:)']')');
passed_ttest1 =     ([bestgenome1>0].*grad1(3,:)')+     ([bestgenome1<0].*grad2(3,:)')+     ([bestgenome1==0].*mean( [-grad1(3,:)'  grad2(3,:)']')');


which_gradient2 = ([bestgenome2>0].*grad1(1,:)')+     ([bestgenome2<0].*grad2(1,:)')+     ([bestgenome2==0].*mean( [-grad1(1,:)'  grad2(1,:)']')');
passed_ttest2 =     ([bestgenome2>0].*grad1(3,:)')+    ([bestgenome2<0].*grad2(3,:)')+   ([bestgenome2==0].*mean( [-grad1(3,:)'  grad2(3,:)']')');


which_gradient3 = ([bestgenome3>0].*grad1(1,:)')+    ([bestgenome3<0].*grad2(1,:)')+   ([bestgenome3==0].*mean( [-grad1(1,:)'  grad2(1,:)']')');
passed_ttest3 =    ([bestgenome3>0].*grad1(3,:)')+     ([bestgenome3<0].*grad2(3,:)')+     ([bestgenome3==0].*mean( [-grad1(3,:)'  grad2(3,:)']')');


%which_gradient4 = ([bestgenome4>0].*grad1(1,:)')+     ([bestgenome4<0].*grad2(1,:)')+     ([bestgenome4==0].*mean( [-grad1(1,:)'  grad2(1,:)']')');
%passed_ttest4 =     ([bestgenome4>0].*grad1(3,:)')+     ([bestgenome4<0].*grad2(3,:)')+     ([bestgenome4==0].*mean( [-grad1(3,:)'  grad2(3,:)']')');

which_gradient= [which_gradient1' which_gradient2' which_gradient3' 	]; %	 which_gradient4'];
passed_ttest = [ passed_ttest1' passed_ttest2' passed_ttest3' 		]; %passed_ttest4']; 
bestgenome =[bestgenome1' bestgenome2' bestgenome3' ]; %bestgenome4'];
%size(which_gradient);
%size(passed_ttest);
%size(bestgenome);

plot(abs(which_gradient(find(passed_ttest))),       abs(bestgenome(find(passed_ttest))),'rs','markersize',7); 
 plot(abs(which_gradient(find(~passed_ttest))),       abs(bestgenome(find(~passed_ttest))),'bd','markersize',10);
 perfect = find(~bestgenome);
 for i=1:length(perfect)
   if passed_ttest(perfect(i)) 
     plot(abs(which_gradient(perfect(i))),0.01,'ro','markersize',10);
   else 
     plot(abs(which_gradient(perfect(i))),0.01,'bo','markersize',10);
   end
 end

 set(gca,'xscale','log','yscale','log');

 % Linear Passed Only
 x=[abs(which_gradient(find(passed_ttest)))'];
y=[abs(bestgenome(find(passed_ttest)))'];    
xtmp=[x(:) ones(length(x),1)]; %input matrix for regress function
ytmp=y(:);
[B,BINT,R,Rint,STATS] = regress(ytmp,xtmp);
[ss ii ] = sort(xtmp(:,1));
xmax = xtmp(ii(find((xtmp(ii,1)*B(1)+B(2))>0)),1);  
%plot([min(xtmp(:,1)) xmax(end)],[min(x) xmax(end)]*B(1)+B(2),'k','linewidth',3);
%text(0,0,'Linear (Pass Only)','fontsize',20,'units','normalized','position', [0.05 0.95 0],'verticalalignment','middle');
%text(0,0,['m=' num2str(B(1),'%0.3g')],'fontsize',20,'units','normalized','position', [0.05 0.9 0]);
%text(0,0,['p-value=' num2str(STATS(3),'%0.3g')],'fontsize',20,'units','normalized','position', [0.05 0.85 0]);
%text(0,0,['R^2=' num2str(STATS(1),'%0.3g')],'fontsize',20,'units','normalized','position', [0.05 0.8 0]);

disp('Linear (Pass Only)');
disp(['m=' num2str(B(1),'%0.3g')]);
disp(['R^2=' num2str(STATS(1),'%0.3g')]);
disp(['F=' num2str(STATS(2),'%0.3g')]);
disp(['p=' num2str(STATS(3),'%0.3g')]);
disp(['est error var=' num2str(STATS(4),'%0.3g')]);



% LogLog Passed Only
xtmp=[log10(x(:)) ones(length(x),1)]; %input matrix for regress function
ytmp=log10(y(:));
ytmp(find(((~y))'))=0.1;
[B,BINT,R,Rint,STATS] = regress(ytmp,xtmp);
%plot([min(x) max(x)],[10^(min(xtmp(:,1))*(B(1))+B(2)) 10^(max(xtmp(:,1))*(B(1))+B(2))],'k--');
%text(0,0,'LOGLOG (Pass Only)','fontsize',20,'units','normalized','position', [0.95 0.95 0],'verticalalignment','middle','horizontalalignment','right');
%text(0,0,['m=' num2str(B(1),'%0.3g')],'fontsize',20,'units','normalized','position', [0.95 0.9 0],'horizontalalignment','right');
				%'(' num2str(10^(abs(B(1))),'%0.3g') ')'
%text(0,0,['p-value=' num2str(STATS(3),'%0.3g')],'fontsize',20,'units','normalized','position', [0.95 0.85 0],'horizontalalignment','right');
%text(0,0,['R^2=' num2str(STATS(1),'%0.3g')],'fontsize',20,'units','normalized','position', [0.95 0.8 0],'horizontalalignment','right');

disp('LogLog (Pass Only)');
disp(['m=' num2str(B(1),'%0.3g')]);
disp(['R^2=' num2str(STATS(1),'%0.3g')]);
disp(['F=' num2str(STATS(2),'%0.3g')]);
disp(['p=' num2str(STATS(3),'%0.3g')]);
disp(['est error var=' num2str(STATS(4),'%0.3g')]);



% Linear All
x=[abs(which_gradient)'];
y=[abs(bestgenome)'];    
xtmp=[x(:) ones(length(x),1)];
ytmp=y(:);
[B,BINT,R,Rint,STATS] = regress(ytmp,xtmp);
% Grab the last point before crossing the x-axis
[ss ii ] = sort(xtmp(:,1));
xmax = xtmp(ii(find((xtmp(ii,1)*B(1)+B(2))>0)),1);  

plot([min(xtmp(:,1)) xmax(end)],[min(x) xmax(end)]*B(1)+B(2),'k','linewidth',4);


%text(0,0,'Linear','fontsize',20,'units','normalized','position', [0.05 0.2  0],'verticalalignment','middle');
%text(0,0,['m=' num2str(B(1),'%0.3g')],'fontsize',20,'units','normalized','position', [0.05 0.15 0],'verticalalignment','middle');
%text(0,0,['p-value=' num2str(STATS(3),'%0.3g')],'fontsize',20,'units','normalized','position', [0.05 0.1 0],'verticalalignment','middle');
%text(0,0,['R^2=' num2str(STATS(1),'%0.3g')], 'fontsize',20,'units','normalized','position',[0.05 0.05 0],'verticalalignment','middle');

disp('Linear (All)');
disp(['m=' num2str(B(1),'%0.3g')]);
disp(['R^2=' num2str(STATS(1),'%0.3g')]);
disp(['F=' num2str(STATS(2),'%0.3g')]);
disp(['p=' num2str(STATS(3),'%0.3g')]);
disp(['est error var=' num2str(STATS(4),'%0.3g')]);




% LogLog All
xtmp=[log10(x(:)) ones(length(x),1)]; %input matrix for regress function
ytmp=log10(y(:));
ytmp(find(((~y))'))=0.1;
[B,BINT,R,Rint,STATS] = regress(ytmp(:),xtmp);
plot([min(x(:,1)) max(x(:,1))],[10^(min(xtmp(:,1))*(B(1))+B(2))      10^(max(xtmp(:,1))*(B(1))+B(2))],'k--');

%text(0,0,'LOGLOG','fontsize',20,'units','normalized','position', [0.95 0.2 0],'verticalalignment','middle','horizontalalignment','right');
%text(0,0,['m=' num2str(B(1),'%0.3g')],'fontsize',20,'units','normalized','position', [0.95 0.15 0],'horizontalalignment','right','verticalalignment','middle');% '(' num2str(10^(abs(B(1))),'%0.3g') ')'
%text(0,0,['p-value=' num2str(STATS(3),'%0.3g')],'fontsize',20,'units','normalized','position', [0.95 0.1 0],'horizontalalignment','right','verticalalignment','middle');
%text(0,0,['R^2=' num2str(STATS(1),'%0.3g')],'fontsize',20,'units','normalized','position', [0.95 0.05 0],'horizontalalignment','right','verticalalignment','middle');

disp('LogLog (All)');
disp(['m=' num2str(B(1),'%0.3g')]);
disp(['R^2=' num2str(STATS(1),'%0.3g')]);
disp(['F=' num2str(STATS(2),'%0.3g')]);
disp(['p=' num2str(STATS(3),'%0.3g')]);
disp(['est error var=' num2str(STATS(4),'%0.3g')]);


set(gca,'fontsize',20,'xlim',xlimit ,'ylim',[0.005 1e2]);%,'ytick', [0.01 0.1 1 10  100] ); %[1e-6 1e-2]
