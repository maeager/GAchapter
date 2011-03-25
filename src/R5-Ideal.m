

%% Plotting sensitivity v best genome error
clear all
load basis;
labels;

load targetparameters.dat;
load target_normdiff

load stdyn_diffAN_sim1

load stdyn_sens_gradients
POSITION=1;
xlimit = [1e-4 1e2];
%% Calculate minimum genome
stdyn_diffAN_sim1_min_ga_indx=find (stdyn_diffAN_sim1(:,POSITION) == min(stdyn_diffAN_sim1(:,POSITION)));
best_genome = stdyn_diffAN_sim1_values(stdyn_diffAN_sim1_min_ga_indx(1),:);
diffx = targetparameters-best_genome';
stdyn_diffAN_sim1_min_ga=-diffx./targetparameters;

load ifrga25_diffAN_sim1

load ifr25_sens_gradients
POSITION=4;

%% Calculate minimum genome per unit step
ifrga25_diffAN_sim1_min_ga_indx=find (ifrga25_diffAN_sim1(:,POSITION) == min(ifrga25_diffAN_sim1(:,POSITION)));
best_genome = ifrga25_diffAN_sim1_values(ifrga25_diffAN_sim1_min_ga_indx(1),:);
diffx = targetparameters-best_genome';
ifrga25_diffAN_sim1_min_ga=-diffx./targetparameters;


load ivga25_diffAN_sim1

load iv25_sens_gradients
POSITION=6;

%% Calculate minimum genome
ivga25_diffAN_sim1_min_ga_indx=find (ivga25_diffAN_sim1(:,POSITION) == min(ivga25_diffAN_sim1(:,POSITION)));
best_genome = ivga25_diffAN_sim1_values(ivga25_diffAN_sim1_min_ga_indx(1),:);
diffx = targetparameters-best_genome';
ivga25_diffAN_sim1_min_ga=-diffx./targetparameters;


%Plot the Sensitivity Analysis Gradients against Best genome values

figure;
subplot(131);
xlimit = [1e-4 1e2];
SensVBestGenomeErrorCombined(stdyn_diffAN_sens_grad1,stdyn_diffAN_sens_grad2,stdyn_diffAN_sim1_min_ga,[],[],xlimit)
xlabel('Parameter Gradient (\Delta \Psi_{ST}/(\Delta {p}_i/t_{i}))','fontsize',20);
ylabel('Best Genome Error','fontsize',20);
set(gca,'xtick', [1e-3 1e-2 1e-1])

subplot(132);
xlimit=[1e-5 1e-1];
SensVBestGenomeErrorCombined(ifr25_diffAN_sens_grad1,ifr25_diffAN_sens_grad2,ifrga25_diffAN_sim1_min_ga,ifrga25_diffAN_sim2_min_ga,ifrga25_diffAN_sim3_min_ga,xlimit)
xlabel('Parameter Gradient (\Delta \Psi_{IFR}/(\Delta {p}_i/target))','fontsize',20);
%ylabel('Best Relative Genome Error ((b-t)/t) ','fontsize',20);
set(gca,'xtick', [1e-5 1e-4 1e-3 1e-2])


subplot(133);
xlimit=[1e-6 1e0];
SensVBestGenomeErrorCombined(iv25_diffAN_sens_grad1,iv25_diffAN_sens_grad2,ivga25_diffAN_sim1_min_ga,ivga25_diffAN_sim2_min_ga,ivga25_diffAN_sim3_min_ga,xlimit)
xlabel('Parameter Gradient (\Delta \Psi_{AIV}/\Delta {p}_i)','fontsize',20);
%ylabel('Best Genome Error','fontsize',20);
set(gca,'xtick', [1e-5 1e-4 1e-3 1e-2 1e-1])


%Combined

print -depsc2 -r600 '../gfx/CombinedBestGenomeVSens-All.eps' 

