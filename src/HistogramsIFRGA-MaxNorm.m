%  IFR- Cost Function
%figure;
clear 
%clc

load ../ifrga25_normal
load ../ifrga25_diffAN 
load ../ifrga25_diffAN_sim2 
load ../ReRun13-01/rand1norm
load ../ReRun13-01/rand1diffAN
load ../ReRun13-01/rand5norm
load ../ReRun13-01/rand5diffAN
load ../ReRun13-01/target_normdiff

cf_pos=4;
filter_width=10;
normalisation_factor = 0.25;
xst = linspace(0,0.5,1000);


[ganormhist xst] = hist(ifrga25_normal(:,cf_pos)/(normalisation_factor),xst);%ifrga25hist_s = filter(hanning(filter_width),1,stnormhist);
[gadiffhist xst] = hist(ifrga25_diffAN_sim2(:,cf_pos)/(normalisation_factor),xst);%ivhist_s = filter(hanning(filter_width),1,stdiffhist);
xx1=hist(target_normal(:,cf_pos)/(normalisation_factor),xst);%xf1 = filter(hanning(filter_width),1,xx1);
xx1a=hist(target_diffseed(:,cf_pos)/(normalisation_factor),xst);%xf1a = filter(hanning(filter_width),1,xx1a);
xx1b=hist(target_diffsim(:,cf_pos)/(normalisation_factor),xst);%xf1b = filter(hanning(filter_width),1,xx1b);

xx2=hist(target_diffAN(:,cf_pos)/(normalisation_factor),xst);%xf2 = filter(hanning(filter_width),1,xx2);
xx3=hist(rand1norm(:,cf_pos)/normalisation_factor,xst);%xf3 = filter(hanning(filter_width),1,xx3);
xx4=hist(rand1diffAN(:,cf_pos)/normalisation_factor,xst);%xf4 = filter(hanning(filter_width),1,xx4);

xx7=hist(rand5norm(:,cf_pos)/normalisation_factor,xst);%xf7 = filter(hanning(filter_width),1,xx7);
xx8=hist(rand5diffAN(:,cf_pos)/normalisation_factor,xst);%xf8 = filter(hanning(filter_width),1,xx8);

xx1a/=max(xx1a(2:end-1));
xx1b/=max(xx1b(2:end-1));
xx2/=max(xx2(2:end-1));
xx3/=max(xx3(2:end-1));
xx4/=max(xx4(2:end-1));
xx7/=max(xx7(2:end-1));
xx8/=max(xx8(2:end-1));
ganormhist/=max(ganormhist(2:end-1)); 
gadiffhist/=max(gadiffhist(2:end-1));

outfile = "HistogramIFR-MaxNorm.dat";
fd = fopen(outfile, "wt");
for i=1:length(xst)
    fprintf (fd, "%14.6f %14.6f %14.6f %14.6f %14.6f %14.6f %14.6f %14.6f %14.6f %14.6f %14.6f \n", xst(i), xx1(i), xx1a(i),xx1b(i),xx2(i),xx3(i),xx4(i),xx7(i),xx8(i), ganormhist(i), gadiffhist(i));
end
fclose(fd);
disp("Done!");

% 
% %%
% figure(2)
% clf
% subplot(211);
% 
% 
% 
% hold on;
% area(xst,stnormhist/3,'FaceColor',[0.8 0.8 0.8]);
% area(xst,xx7,'FaceColor',[0.5 0.5 0.5])
% area(xst,xx3,'FaceColor',[0.3 0.3 0.3])
% bar(xst,xx1,'k')
% ylabel('count','FontSize',14)
% %set(gca,'Position',[0.13 0.55 0.775 0.4])
% legend('GA','5-step','1-step', 'Target')
% plot(xst,stnormhist/3,'k')
% plot(xst,xx7,'k')
% plot(xst,xx3,'k')
% axis([-10 45 0 150])
% %title('')
% 
% 
% 
% subplot(212)
% hold on;
% %set(gca,'Position',[0.13 0.1 0.775 0.4])
% %title('IFR-250 Different inputs)')
% %axes3 = axes('Parent',gcf,'Position',[0.444 0.646 0.2661 0.2594]);
% 
% area(xst,stdiffhist/3,'FaceColor',[0.8 0.8 0.8]);
% area(xst,xx8,'FaceColor',[0.5 0.5 0.5])
% %area(xst,xx4,'FaceColor',[0.3 0.3 0.3])
% bar(xst,xx2,'k','Parent',axes3)
% plot(xst,stdiffhist/3,'k',xst,xx8,'k'xst,xx4,'k',xst,xx2,'k')
% xlim([7 12]);
% xlabel('\Psi_{ST} (ms)','FontSize',14);
% ylabel('count','FontSize',14)
% %print -depsc2 -r600 c:/cygwin/home/eagerm/thesis/thesis/newgfx/IFRGA25AreaHistogram_v4.eps
