
%%


load stdyn_diffAN_sim1
load stdyn_diffAN_sim2
load stdyn_diffAN_sim3
load stdyn100_diffAN
load target_diffAN_100
load target_normdiff.mat
load basis
targetparameters=load('targetparameters.dat');

%load ifrga25_diffAN
load ifrga25_diffAN_sim1
load ifrga25_diffAN_sim2
load ifrga25_diffAN_sim3
load ifr100_diffAN

%load ivga25_diffAN
load ivga25_diffAN_sim1
load ivga25_diffAN_sim2
load ivga25_diffAN_sim3
load iv100_diffAN

gen=[1:201];
LABELSIZE=30;
CFLABELSIZE=30;
AXISFONTSIZE=16;
LINEWIDTH=2;
STPOSITION=1; 
STCOSTFACTOR=1;
STPOSITION100=1;
STCOSTFACTOR100=1;
ST_YMAX=50;
ST_YLIM=[0 ST_YMAX];

IFRPOSITION=4;
IFRCOSTFACTOR=1/0.25;
IFRPOSITION100=3;
IFRCOSTFACTOR100=1/0.2;
IFR_YMAX=0.3;
IFR_YLIM=[0 IFR_YMAX];

IVPOSITION=6;
IVCOSTFACTOR=1;
IVPOSITION100=5;
IVCOSTFACTOR100=1;
AIV_YMAX=0.4;
AIV_YLIM=[0 AIV_YMAX];

stdyn_target_diffAN_stats = statistics(target_diffAN(:,STPOSITION)*STCOSTFACTOR);
stdyn_target_diffAN_100_stats = statistics(target_diffAN_100(:,STPOSITION100)*STCOSTFACTOR100);

ivga_target_diffAN_stats = statistics(target_diffAN(:,IVPOSITION)*IVCOSTFACTOR);
ivga_target_diffAN_100_stats = statistics(target_diffAN_100(:,IVPOSITION100)*IVCOSTFACTOR100);

ifrga_target_diffAN_stats = statistics(target_diffAN(:,IFRPOSITION)*IFRCOSTFACTOR);
ifrga_target_diffAN_100_stats = statistics(target_diffAN_100(:,IFRPOSITION100)*IFRCOSTFACTOR100);


# 
# GA performance plots
#

figure;
subplot(1,3,1);
hold on;


stairs(gen,stdyn_diffAN_sim1_bog(:,4)*STCOSTFACTOR,'k--');
stairs(gen,stdyn_diffAN_sim2_bog(:,4)*STCOSTFACTOR,'k--');
stairs(gen,stdyn_diffAN_sim3_bog(:,4)*STCOSTFACTOR,'k--');
%errorbar(207.5,stdyn_target_diffAN_stats(6),stdyn_target_diffAN_stats(7)*2);
%errorbar(207.5,stdyn_target_diffAN_100_stats(6),stdyn_target_diffAN_100_stats(7)*2);
%set(get(gca,'children')(1),'markersize',10)
ylabel('Cost Function Score','fontsize',LABELSIZE,'fontname','Helvetica');
xlabel('Generation','fontsize',LABELSIZE,'fontname','Helvetica');
for i=1:3
 set(get(gca,'children')(i),'linewidth',LINEWIDTH);
end
plot([205:215], ones(1,11)*(stdyn_target_diffAN_stats(6)-stdyn_target_diffAN_stats(7)*2),'k-','linewidth',2);
plot([205:215], ones(1,11)*(stdyn_target_diffAN_stats(6)+stdyn_target_diffAN_stats(7)*2),'k-','linewidth',2);
plot(ones(1,3)*210,[stdyn_target_diffAN_stats(6)-stdyn_target_diffAN_stats(7)*2  stdyn_target_diffAN_stats(6) stdyn_target_diffAN_stats(6)+stdyn_target_diffAN_stats(7)*2],'k-','linewidth',2);
text(105,ST_YMAX,"ST (ms)",'fontsize',LABELSIZE,'verticalalignment','top','horizontalalignment','center');

set(gca,'fontsize',AXISFONTSIZE,'xlim',[-10 215],'box','off', \
    "linewidth",LINEWIDTH, \
    "yscale","log", "ylim",[7 ST_YMAX], \
    "ytick",[7:10 20:10:50], \
    "yticklabel",cellstr(num2str([7:10 20:10:50]',2)));



#Best genomes per generation
subplot(1,3,2);
hold on;

%stairs(gen,ifrga25_diffAN_bog(:,4)*IFRCOSTFACTOR,'k--');
stairs(gen,ifrga25_diffAN_sim1_bog(:,4)*IFRCOSTFACTOR,'k--');
stairs(gen,ifrga25_diffAN_sim2_bog(:,4)*IFRCOSTFACTOR,'k--');
stairs(gen,ifrga25_diffAN_sim3_bog(:,4)*IFRCOSTFACTOR,'k--');

%errorbar(207.5,ifrga_target_diffAN_stats(6),ifrga_target_diffAN_stats(7)*2);
%errorbar(207.5,ifrga_target_diffAN_100_stats(6),ifrga_target_diffAN_100_stats(7)*2);
for i=1:3
 set(get(gca,'children')(i),'linewidth',LINEWIDTH);
end

plot([205:215], ones(1,11)*(ifrga_target_diffAN_stats(6)-ifrga_target_diffAN_stats(7)*2),'k-','linewidth',2);
plot([205:215], ones(1,11)*(ifrga_target_diffAN_stats(6)+ifrga_target_diffAN_stats(7)*2),'k-','linewidth',2);
plot(ones(1,3)*210,[ifrga_target_diffAN_stats(6)-ifrga_target_diffAN_stats(7)*2  ifrga_target_diffAN_stats(6) ifrga_target_diffAN_stats(6)+ifrga_target_diffAN_stats(7)*2],'k-','linewidth',2);


xlabel('Generation','fontsize',LABELSIZE,'fontname','Helvetica');
text(105,IFR_YMAX,"IFR (spikes/ms)",'fontsize',LABELSIZE,'verticalalignment','top','horizontalalignment','center');

set(gca,'fontsize',AXISFONTSIZE,'xlim',[-10 215], \
    "box","off", \
    "linewidth",LINEWIDTH, \
    "yscale","log", \
    "ylim",[0.2 0.3], \
    "ytick",[0.2:0.01:0.3], \
    "yticklabel",cellstr(num2str([0.2:0.01:0.3]',2)));

#Best genomes per generation
subplot(1,3,3);
hold on;

%stairs(gen,ivga25_diffAN_bog(:,4)*IVCOSTFACTOR,'k--');
stairs(gen,ivga25_diffAN_sim1_bog(:,4)*IVCOSTFACTOR,'k--');
stairs(gen,ivga25_diffAN_sim2_bog(:,4)*IVCOSTFACTOR,'k--');
stairs(gen,ivga25_diffAN_sim3_bog(:,4)*IVCOSTFACTOR,'k--');

%errorbar(207.5,ivga_target_diffAN_stats(6),ivga_target_diffAN_stats(7)*2);
%errorbar(207.5,ivga_target_diffAN_100_stats(6),ivga_target_diffAN_100_stats(7)*2);
for i=1:3
 set(get(gca,'children')(i),'linewidth',LINEWIDTH);
end

plot([205:215], ones(1,11)*(ivga_target_diffAN_stats(6)-ivga_target_diffAN_stats(7)*2),'k-','linewidth',2);
plot([205:215], ones(1,11)*(ivga_target_diffAN_stats(6)+ivga_target_diffAN_stats(7)*2),'k-','linewidth',2);
plot(ones(1,3)*210,[ivga_target_diffAN_stats(6)-ivga_target_diffAN_stats(7)*2  ivga_target_diffAN_stats(6) ivga_target_diffAN_stats(6)+ivga_target_diffAN_stats(7)*2],'k-','linewidth',2);


xlabel('Generation','fontsize',LABELSIZE,'fontname','Helvetica');
%set(gca,'fontsize',AXISFONTSIZE,'xlim',[-10 215],'ylim',AIV_YLIM,'box','off','linewidth',LINEWIDTH);
text(105,AIV_YMAX,"AIV (mV)",'fontsize',LABELSIZE,'verticalalignment','top','horizontalalignment','center');

set(gca,'fontsize',AXISFONTSIZE,'xlim',[-10 215], \
    'box','off','linewidth',LINEWIDTH, \
    "yscale","log","ylim",[0.15 AIV_YMAX], \
    "ytick",[0.15:0.05:0.4],\
    "yticklabel",cellstr(num2str([0.15:0.05:0.4]',2))); 

 print -depsc2 -r600  ../gfx/All25GAPerf-Log.eps;
 system('fixbb ../gfx/All25GAPerf-Log.eps');



set(get(gcf,'children')(3),"yscale","linear","ylim",[0 ST_YMAX],"ytick",[0:10:50],"yticklabel",cellstr(num2str([0:10:50]',2)));
set(get(gcf,'children')(2),"yscale","linear","ylim",[0 IFR_YMAX],  "ytick",[0:0.05:0.3],"yticklabel",cellstr(num2str([0:0.05:0.3]',2)));
set(get(gcf,'children')(1),"yscale","linear","ylim",[0 AIV_YMAX], "ytick",[0:0.05:0.4],"yticklabel",cellstr(num2str([0:0.05:0.4]',2))); 

print -depsc2 -r600  ../gfx/All25GAPerf-Stretch.eps;
system('fixbb ../gfx/All25GAPerf-Stretch.eps');
# for i=1:3
#   axis(get(gcf,'children')(i),"square")
# end
# print -depsc2 -r600  ../gfx/All25GAPerf.eps;
# system('fixbb ../gfx/All25GAPerf.eps');









%% 25+100

figure;
subplot(1,3,1);
hold on;

stairs(gen,stdyn100_diffAN_bog(:,4)*IVCOSTFACTOR100,'k--');
 set(get(gca,'children')(1),'linewidth',LINEWIDTH*2);
stairs(gen,stdyn_diffAN_sim1_bog(:,4)*STCOSTFACTOR,'k');
stairs(gen,stdyn_diffAN_sim2_bog(:,4)*STCOSTFACTOR,'k');
stairs(gen,stdyn_diffAN_sim3_bog(:,4)*STCOSTFACTOR,'k');
%errorbar(207.5,stdyn_target_diffAN_stats(6),stdyn_target_diffAN_stats(7)*2);
%errorbar(207.5,stdyn_target_diffAN_100_stats(6),stdyn_target_diffAN_100_stats(7)*2);
%set(get(gca,'children')(1),'markersize',10)
ylabel('Cost Function Score','fontsize',LABELSIZE,'fontname','Helvetica');
xlabel('Generation','fontsize',LABELSIZE,'fontname','Helvetica');

plot([205:215], ones(1,11)*(stdyn_target_diffAN_stats(6)-stdyn_target_diffAN_stats(7)*2),'k-','linewidth',2);
plot([205:215], ones(1,11)*(stdyn_target_diffAN_stats(6)+stdyn_target_diffAN_stats(7)*2),'k-','linewidth',2);
plot(ones(1,3)*210,[stdyn_target_diffAN_stats(6)-stdyn_target_diffAN_stats(7)*2  stdyn_target_diffAN_stats(6) stdyn_target_diffAN_stats(6)+stdyn_target_diffAN_stats(7)*2],'k-','linewidth',2);
plot([205:215], ones(1,11)*(stdyn_target_diffAN_100_stats(6)-stdyn_target_diffAN_stats(7)*2),'k-','linewidth',2);
plot([205:215], ones(1,11)*(stdyn_target_diffAN_100_stats(6)+stdyn_target_diffAN_100_stats(7)*2),'k-','linewidth',2);
plot(ones(1,3)*210,[stdyn_target_diffAN_100_stats(6)-stdyn_target_diffAN_100_stats(7)*2  stdyn_target_diffAN_100_stats(6) stdyn_target_diffAN_100_stats(6)+stdyn_target_diffAN_100_stats(7)*2],'k-','linewidth',2);


text(105,ST_YMAX,"ST (ms)",'fontsize',LABELSIZE,'verticalalignment','top','horizontalalignment','center');

set(gca,'fontsize',AXISFONTSIZE,'xlim',[-10 215],'box','off', \
    "linewidth",LINEWIDTH, \
    "yscale","log","ylim",[5 ST_YMAX], \
    "ytick",[5:10 20:10:50], \
    "yticklabel",cellstr(num2str([5:10 20:10:50]',2)));


#Best genomes per generation
subplot(1,3,2);
hold on;

stairs(gen,ifr100_diffAN_bog(:,4)*IFRCOSTFACTOR100,'k--');
set(get(gca,'children')(1),'linewidth',LINEWIDTH*2);
stairs(gen,ifrga25_diffAN_sim1_bog(:,4)*IFRCOSTFACTOR,'k');
stairs(gen,ifrga25_diffAN_sim2_bog(:,4)*IFRCOSTFACTOR,'k');
stairs(gen,ifrga25_diffAN_sim3_bog(:,4)*IFRCOSTFACTOR,'k');

%errorbar(207.5,ifrga_target_diffAN_stats(6),ifrga_target_diffAN_stats(7)*2);
%errorbar(207.5,ifrga_target_diffAN_100_stats(6),ifrga_target_diffAN_100_stats(7)*2);
plot([205:215], ones(1,11)*(ifrga_target_diffAN_stats(6)-ifrga_target_diffAN_stats(7)*2),'k-','linewidth',2);
plot([205:215], ones(1,11)*(ifrga_target_diffAN_stats(6)+ifrga_target_diffAN_stats(7)*2),'k-','linewidth',2);
plot(ones(1,3)*210,[ifrga_target_diffAN_stats(6)-ifrga_target_diffAN_stats(7)*2  ifrga_target_diffAN_stats(6) ifrga_target_diffAN_stats(6)+ifrga_target_diffAN_stats(7)*2],'k-','linewidth',2);
plot([205:215], ones(1,11)*(ifrga_target_diffAN_100_stats(6)-ifrga_target_diffAN_100_stats(7)*2),'k-','linewidth',2);
plot([205:215], ones(1,11)*(ifrga_target_diffAN_100_stats(6)+ifrga_target_diffAN_100_stats(7)*2),'k-','linewidth',2);
plot(ones(1,3)*210,[ifrga_target_diffAN_100_stats(6)-ifrga_target_diffAN_100_stats(7)*2  ifrga_target_diffAN_100_stats(6) ifrga_target_diffAN_100_stats(6)+ifrga_target_diffAN_100_stats(7)*2],'k-','linewidth',2);


xlabel('Generation','fontsize',LABELSIZE,'fontname','Helvetica');
text(105,IFR_YMAX,"IFR (spikes/ms)",'fontsize',LABELSIZE,'verticalalignment','top','horizontalalignment','center');

set(gca,'fontsize',AXISFONTSIZE,'xlim',[-10 215],'box','off', \
    "linewidth",LINEWIDTH, \
    "yscale","log","ylim",[0.1 IFR_YMAX], \
    "ytick",[0.1:0.1:0.4], \
    "yticklabel",cellstr(num2str([0.1:0.1:0.4]',2)));

#Best genomes per generation
subplot(1,3,3);
hold on;
stairs(gen,iv100_diffAN_bog(:,4)*IVCOSTFACTOR100,'k--');
 set(get(gca,'children')(1),'linewidth',LINEWIDTH*2);
stairs(gen,ivga25_diffAN_sim1_bog(:,4)*IVCOSTFACTOR,'k');
stairs(gen,ivga25_diffAN_sim2_bog(:,4)*IVCOSTFACTOR,'k');
stairs(gen,ivga25_diffAN_sim3_bog(:,4)*IVCOSTFACTOR,'k');

plot([205:215], ones(1,11)*(ivga_target_diffAN_stats(6)-ivga_target_diffAN_stats(7)*2),'k-','linewidth',2);
plot([205:215], ones(1,11)*(ivga_target_diffAN_stats(6)+ivga_target_diffAN_stats(7)*2),'k-','linewidth',2);
plot(ones(1,3)*210,[ivga_target_diffAN_stats(6)-ivga_target_diffAN_stats(7)*2  ivga_target_diffAN_stats(6) ivga_target_diffAN_stats(6)+ivga_target_diffAN_stats(7)*2],'k-','linewidth',2);
plot([205:215], ones(1,11)*(ivga_target_diffAN_100_stats(6)-ivga_target_diffAN_100_stats(7)*2),'k-','linewidth',2);
plot([205:215], ones(1,11)*(ivga_target_diffAN_100_stats(6)+ivga_target_diffAN_100_stats(7)*2),'k-','linewidth',2);
plot(ones(1,3)*210,[ivga_target_diffAN_100_stats(6)-ivga_target_diffAN_100_stats(7)*2  ivga_target_diffAN_100_stats(6) ivga_target_diffAN_100_stats(6)+ivga_target_diffAN_100_stats(7)*2],'k-','linewidth',2);


xlabel('Generation','fontsize',LABELSIZE,'fontname','Helvetica');
text(105,AIV_YMAX,"AIV (mV)",'fontsize',LABELSIZE,'verticalalignment','top','horizontalalignment','center');

set(gca,'fontsize',AXISFONTSIZE,'xlim',[-10 215], \
    'box','off','linewidth',LINEWIDTH, \
    "yscale","log","ylim",[0.01 AIV_YMAX], \
    "ytick",[0.01:0.01:0.1 0.2:0.1:0.4],\
    "yticklabel",cellstr(num2str([0.01:0.01:0.1 0.2:0.1:0.4]',2))); 


%set(get(gcf,'children')(2),"yscale","log","ylim",[0.1 IFR_YMAX],"ytick",[0.1:0.1:0.4],"yticklabel",cellstr(num2str([0.1:0.1:0.4]',2)));
%set(get(gcf,'children')(3),"yscale","log","ylim",[5 ST_YMAX],"ytick",[5:10 20:10:50],"yticklabel",cellstr(num2str([5:10 20:10:50]',2)));


 print -depsc2 -r600  ../gfx/All100GAPerf-Log.eps;
 system('fixbb ../gfx/All100GAPerf-Log.eps');


set(get(gcf,'children')(3),"yscale","linear","ylim",[0 ST_YMAX],"ytick",[0:10:50],"yticklabel",cellstr(num2str([0:10:50]',2)));
set(get(gcf,'children')(2),"yscale","linear","ylim",[0 IFR_YMAX],  "ytick",[0:0.05:0.3],"yticklabel",cellstr(num2str([0:0.05:0.3]',2)));
set(get(gcf,'children')(1),"yscale","linear","ylim",[0 AIV_YMAX], "ytick",[0:0.05:0.4],"yticklabel",cellstr(num2str([0:0.05:0.4]',2))); 

print -depsc2 -r600  ../gfx/All100GAPerf-Stretch.eps;
system('fixbb ../gfx/All100GAPerf-Stretch.eps');
# for i=1:3
#   axis(get(gcf,'children')(i),"square")
# end
# print -depsc2 -r600  ../gfx/All100GAPerf.eps;
# system('fixbb ../gfx/All100GAPerf.eps');





