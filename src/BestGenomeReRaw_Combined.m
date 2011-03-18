

load stdyn_diffAN_sim1
load stdyn_diffAN_sim2
load stdyn_diffAN_sim3
load ivga25_diffAN_sim1
load ivga25_diffAN_sim2
load ivga25_diffAN_sim3
load ifrga25_diffAN_sim1
load ifrga25_diffAN_sim2
load ifrga25_diffAN_sim3

load target_normdiff;
load basis;
targetparameters=load('targetparameters.dat');
gen=[1:201];
STPOSITION=1;
STCOSTFACTOR=1;
STPOSITION100=1;
STCOSTFACTOR100=1;
LABELSIZE=30;

XLABELSIZE=18;
AXISFONTSIZE=20;
LINEWIDTH=2;
ROT=45; % ROTATE ANGLE OF THE PARAMETERS

IVPOSITION=6;
IVCOSTFACTOR=1;
IFRPOSITION=4;
IFRCOSTFACTOR=1/0.25;

IVPOSITION100=5;
IVCOSTFACTOR100=1;
IFRPOSITION100=3;
IFRCOSTFACTOR100=1/0.2;

MINVAL=0.004;


%  Calculate IFR best genomes
ifrga25_diffAN_sim1_min_ga_indx = find (ifrga25_diffAN_sim1(:,IFRPOSITION) == min(ifrga25_diffAN_sim1(:,IFRPOSITION)));
ifrga25_diffAN_sim1_best_genome = ifrga25_diffAN_sim1_values(ifrga25_diffAN_sim1_min_ga_indx(1),:);
ifrga25_diffAN_sim1_diffx = targetparameters -ifrga25_diffAN_sim1_best_genome';
ifrga25_diffAN_sim1_min_ga = -ifrga25_diffAN_sim1_diffx./targetparameters;
ifrga25_diffAN_sim2_min_ga_indx = find (ifrga25_diffAN_sim2(:,IFRPOSITION) == min(ifrga25_diffAN_sim2(:,IFRPOSITION)));
ifrga25_diffAN_sim2_best_genome = ifrga25_diffAN_sim2_values(ifrga25_diffAN_sim2_min_ga_indx(1),:);
ifrga25_diffAN_sim2_diffx = targetparameters -ifrga25_diffAN_sim2_best_genome';
ifrga25_diffAN_sim2_min_ga = -ifrga25_diffAN_sim2_diffx./targetparameters ;
ifrga25_diffAN_sim3_min_ga_indx = find (ifrga25_diffAN_sim3(:,IFRPOSITION) == min(ifrga25_diffAN_sim3(:,IFRPOSITION)));
ifrga25_diffAN_sim3_best_genome = ifrga25_diffAN_sim3_values(ifrga25_diffAN_sim3_min_ga_indx(1),:);
ifrga25_diffAN_sim3_diffx = targetparameters -ifrga25_diffAN_sim3_best_genome';
ifrga25_diffAN_sim3_min_ga = -ifrga25_diffAN_sim3_diffx./targetparameters ;

% calulate IV best genomes
ivga25_diffAN_sim1_min_ga_indx = find (ivga25_diffAN_sim1(:,IVPOSITION) == min(ivga25_diffAN_sim1(:,IVPOSITION)));
ivga25_diffAN_sim1_best_genome = ivga25_diffAN_sim1_values(ivga25_diffAN_sim1_min_ga_indx(1),:);
ivga25_diffAN_sim1_diffx = targetparameters -ivga25_diffAN_sim1_best_genome';
ivga25_diffAN_sim1_min_ga = -ivga25_diffAN_sim1_diffx./targetparameters;
ivga25_diffAN_sim2_min_ga_indx = find (ivga25_diffAN_sim2(:,IVPOSITION) == min(ivga25_diffAN_sim2(:,IVPOSITION)));
ivga25_diffAN_sim2_best_genome = ivga25_diffAN_sim2_values(ivga25_diffAN_sim2_min_ga_indx(1),:);
ivga25_diffAN_sim2_diffx = targetparameters -ivga25_diffAN_sim2_best_genome';
ivga25_diffAN_sim2_min_ga = -ivga25_diffAN_sim2_diffx./targetparameters ;
ivga25_diffAN_sim3_min_ga_indx = find (ivga25_diffAN_sim3(:,IVPOSITION) == min(ivga25_diffAN_sim3(:,IVPOSITION)));
ivga25_diffAN_sim3_best_genome = ivga25_diffAN_sim3_values(ivga25_diffAN_sim3_min_ga_indx(1),:);
ivga25_diffAN_sim3_diffx = targetparameters -ivga25_diffAN_sim3_best_genome';
ivga25_diffAN_sim3_min_ga = -ivga25_diffAN_sim3_diffx./targetparameters ;

% Calculate STdyn best genomes
stdyn_diffAN_sim1_min_ga_indx = find (stdyn_diffAN_sim1(:,STPOSITION) == min(stdyn_diffAN_sim1(:,STPOSITION)));
stdyn_diffAN_sim1_best_genome = stdyn_diffAN_sim1_values(stdyn_diffAN_sim1_min_ga_indx(1),:);
stdyn_diffAN_sim1_diffx = targetparameters -stdyn_diffAN_sim1_best_genome';
stdyn_diffAN_sim1_min_ga = -stdyn_diffAN_sim1_diffx./targetparameters;
stdyn_diffAN_sim2_min_ga_indx = find (stdyn_diffAN_sim2(:,STPOSITION) == min(stdyn_diffAN_sim2(:,STPOSITION)));
stdyn_diffAN_sim2_best_genome = stdyn_diffAN_sim2_values(stdyn_diffAN_sim2_min_ga_indx(1),:);
stdyn_diffAN_sim2_diffx = targetparameters -stdyn_diffAN_sim2_best_genome';
stdyn_diffAN_sim2_min_ga = -stdyn_diffAN_sim2_diffx./targetparameters ;
stdyn_diffAN_sim3_min_ga_indx = find (stdyn_diffAN_sim3(:,STPOSITION) == min(stdyn_diffAN_sim3(:,STPOSITION)));
stdyn_diffAN_sim3_best_genome = stdyn_diffAN_sim3_values(stdyn_diffAN_sim3_min_ga_indx(1),:);
stdyn_diffAN_sim3_diffx = targetparameters -stdyn_diffAN_sim3_best_genome';
stdyn_diffAN_sim3_min_ga = -stdyn_diffAN_sim3_diffx./targetparameters ;

% Calculate the sorting index by summing all the GA best genomes parameter error
# [ss idex] = sort(abs(ivga25_diffAN_sim2_min_ga) + \
# 		 abs(ivga25_diffAN_sim1_min_ga) + \
# 		 abs(ivga25_diffAN_sim3_min_ga)) + \
#  abs(ifrga25_diffAN_sim2_min_ga) + abs(ifrga25_diffAN_sim1_min_ga) + abs(ifrga25_diffAN_sim3_min_ga) + \
#  abs(stdyn_diffAN_sim2_min_ga) + abs(stdyn_diffAN_sim1_min_ga) + abs(stdyn_diffAN_sim3_min_ga)  );

%

xx = [abs(ivga25_diffAN_sim2_min_ga)  abs(ivga25_diffAN_sim1_min_ga)  abs(ivga25_diffAN_sim3_min_ga)  \
 abs(ifrga25_diffAN_sim2_min_ga) abs(ifrga25_diffAN_sim1_min_ga) abs(ifrga25_diffAN_sim3_min_ga)  \
 abs(stdyn_diffAN_sim2_min_ga) abs(stdyn_diffAN_sim1_min_ga) abs(stdyn_diffAN_sim3_min_ga)];
[ss idex] = sort(log10(mean(xx')));
idex


%% Correct the perfect matches
stdyn_diffAN_sim1_min_ga(find(stdyn_diffAN_sim1_min_ga==0))=MINVAL;
stdyn_diffAN_sim2_min_ga(find(stdyn_diffAN_sim2_min_ga==0))=MINVAL;
stdyn_diffAN_sim3_min_ga(find(stdyn_diffAN_sim3_min_ga==0))=MINVAL;
ifrga25_diffAN_sim1_min_ga(find(ifrga25_diffAN_sim1_min_ga==0))=MINVAL;
ifrga25_diffAN_sim2_min_ga(find(ifrga25_diffAN_sim2_min_ga==0))=MINVAL;
ifrga25_diffAN_sim3_min_ga(find(ifrga25_diffAN_sim3_min_ga==0))=MINVAL;
ivga25_diffAN_sim1_min_ga(find(ivga25_diffAN_sim1_min_ga==0))=MINVAL;
ivga25_diffAN_sim2_min_ga(find(ivga25_diffAN_sim2_min_ga==0))=MINVAL;
ivga25_diffAN_sim3_min_ga(find(ivga25_diffAN_sim3_min_ga==0))=MINVAL;



figure;
clf;
hold on;
YLIMVEC= [2e-3 1e2];

%h1=subplot(3,1,1);
%semilogy(abs([stdyn_diffAN_sim1_min_ga(idex) stdyn_diffAN_sim2_min_ga(idex) stdyn_diffAN_sim3_min_ga(idex)]),{'ko','ko','ko'},'markerfacecolor',[0.75 0.75 0.75]);

semilogy([1:30]-0.1,abs(stdyn_diffAN_sim1_min_ga(idex)),'d','color',[0.5 0.5 0.5],'markeredgecolor',[0.5 0.5 0.5],'markerfacecolor',[0.5 0.5 0.5],"markersize",15,"keylabel","ST\n");
semilogy([1:30],abs(ifrga25_diffAN_sim1_min_ga(idex)),'d','color',[0 0 0],'markeredgecolor',[0 0 0],'markerfacecolor',[0 0 0],"markersize",15,"keylabel","IFR\n");
semilogy([1:30]+0.1,abs(ivga25_diffAN_sim1_min_ga(idex)),'ko',"markersize",12,"keylabel","AIV\n");
semilogy([1:30]-0.1,abs(stdyn_diffAN_sim2_min_ga(idex)),'d','color',[0.5 0.5 0.5],'markeredgecolor',[0.5 0.5 0.5],'markerfacecolor',[0.5 0.5 0.5],"markersize",15);
semilogy([1:30],abs(ifrga25_diffAN_sim2_min_ga(idex)),'d','color',[0 0 0],'markeredgecolor',[0 0 0],'markerfacecolor',[0 0 0],"markersize",15);
semilogy([1:30]+0.1,abs(ivga25_diffAN_sim2_min_ga(idex)),'ko',"markersize",12);
semilogy([1:30]-0.1,abs(stdyn_diffAN_sim3_min_ga(idex)),'d','color',[0.5 0.5 0.5],'markeredgecolor',[0.5 0.5 0.5],'markerfacecolor',[0.5 0.5 0.5],"markersize",15);
semilogy([1:30],abs(ifrga25_diffAN_sim3_min_ga(idex)),'d','color',[0 0 0],'markeredgecolor',[0 0 0],'markerfacecolor',[0 0 0],"markersize",15);
semilogy([1:30]+0.1,abs(ivga25_diffAN_sim3_min_ga(idex)),'ko',"markersize",12);

%semilogy(abs([ifrga25_diffAN_sim1_min_ga(idex) ifrga25_diffAN_sim2_min_ga(idex) \
%      ifrga25_diffAN_sim3_min_ga(idex) ]),{'ko','ko','ko'},'markerfacecolor',[0 0 0],"keylabel","IFR");



%h3=subplot(3,1,3);
%semilogy(abs([ivga25_diffAN_sim1_min_ga(idex) ivga25_diffAN_sim2_min_ga(idex) \
%      ivga25_diffAN_sim3_min_ga(idex)]),{'ko','ko','ko'},"keylabel","AIV");

%legend("right")
%legend("boxoff")
%legend("ST\n","IFR\n","AIV\n","location","northwest")
set(gca,'fontname','Helvetica', \
    'xlim',[0 31], 'xtick', [1:30], \
    'xticklabel',phen(idex), 'ylim',YLIMVEC, \ 
    'fontsize',AXISFONTSIZE,'linewidth',2); 

h=gca;
b=get(h,'xtick');
c=get(h,'ytick');
a = get(h,'xticklabel');
set(gca,'xticklabel',[]);

text(b,repmat(YLIMVEC(1)*0.9,length(b),1),a,'horizontalalignment','right','rotation',ROT,'fontsize',XLABELSIZE);

%legend("right")
%legend("boxoff")
%legend("ST\n","IFR\n","AIV\n","location","northwest")
set(gca,"ytick", [1.0000e-02   1.0000e-01 1.0000e+00 1.0000e+01]);

plot(2,40,'d','color',[0.5 0.5 0.5],'markeredgecolor',[0.5 0.5 0.5], \
     'markerfacecolor',[0.5 0.5 0.5],"markersize",15);
text(3, 40, "ST",'horizontalalignment','left','fontsize',LABELSIZE)
plot(2,20,'d','color',[0 0 0],'markeredgecolor',[0 0 0], \
     'markerfacecolor',[0 0 0],"markersize",15);
text(3, 20, "IFR",'horizontalalignment','left','fontsize',LABELSIZE)
plot(2,10,'ko',"markersize",15);
text(3, 10, "AIV",'horizontalalignment','left','fontsize',LABELSIZE);


plot([1:30], MINVAL/2 + MINVAL*ones(1,length([1:30])),'k.-.');

%A = get(gca,"yticklabel");
%A(1)="Exact";
%set(gca,"yticklabel",A);

ylabel("Relative Parameter Error\n","fontsize",LABELSIZE);

print -depsc2 -r600 ../gfx/BestGenomesReRaw_CombinedLog.eps;
system('fixbb ../gfx/BestGenomesReRaw_CombinedLog.eps');



# TODO  remove first GA genome, FIGR2

# statistics(abs(ivga25_diffAN_sim2_min_ga)) 
# statistics(abs(ivga25_diffAN_sim1_min_ga)) 
# statistics(abs(ivga25_diffAN_sim3_min_ga)) 
# statistics(abs(ifrga25_diffAN_sim2_min_ga)) 
# statistics(abs(ifrga25_diffAN_sim1_min_ga)) 
# statistics(abs(ifrga25_diffAN_sim3_min_ga)) 
# statistics(abs(stdyn_diffAN_sim2_min_ga)) 
# statistics(abs(stdyn_diffAN_sim1_min_ga)) 
# statistics(abs(stdyn_diffAN_sim3_min_ga)) 

