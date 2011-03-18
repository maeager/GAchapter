

load target_diffAN_100
load target_normdiff
load rand5diffAN
load rand1diffAN
load rand1diffAN_100
load rand5diffAN_100

%best genome hoc file index
STIDX=1;
IFRIDX=2;
IVIDX=3;
ST100=4;
IFR100=5;
IV100=6;

LABELSIZE=20;
CFLABELSIZE=30;
AXISFONTSIZE=16;
LINEWIDTH=2;

% rand diffAN index
STPOSITION100=1;
STPOSITION=1;
IFRPOSITION100=3;
IFRPOSITION=4;
IVPOSITION100=5;
IVPOSITION=6;

IFRCOSTFACTOR=1/0.25;
IFRCOSTFACTOR100=1/0.2;
IVCOSTFACTOR=1;
IVCOSTFACTOR100=1;



st_sim1= dlmread('../../../octave/best_genomes/99cd1690fc99964c816461531615457365187033cf11458.dat','#');
st_sim2= dlmread('../../../octave/best_genomes/c1fb563c9942052fb550f528054d508e30a0057b9620468.dat','#'); 
st_sim3 = dlmread('../../../octave/best_genomes/b15c13af74bf0826f050cc3a524118318242031b90cf954.dat','#') ;
st_100= dlmread('../../../octave/best_genomes/6ce77737087df85472397960154acd1164b20c22d76ba50.dat','#');  


ifr_sim1= dlmread('../../../octave/best_genomes/97161aec9c4f3de708f79f133a1888d1f26c461f84b94a4.dat','#'); 
ifr_sim2= dlmread('../../../octave/best_genomes/e14b96c4fce90ba31c11053c421a4610babb2d48fca8c86.dat','#'); 
ifr_sim3= dlmread('../../../octave/best_genomes/77a6d469d8af47754b81a54d042ac4764a4c583cf58ee6a.dat','#'); 
ifr_100= dlmread('../../../octave/best_genomes/963e63c8b2ac06c9328a063987807fb373aa25e0c81a456.dat','#'); 

iv_sim1= dlmread('../../../octave/best_genomes/d16cedc86d1410c0323a9e35c3854db5c25e172671db124.dat','#');  
iv_sim2= dlmread('../../../octave/best_genomes/6fbf206374e8cd457cb9f8af2b41d052737509e3ba29262.dat','#'); 
iv_sim3 = dlmread('../../../octave/best_genomes/acbe2097b06b754a3cdab708bbba4940b445bc1ae0b9b86.dat','#'); 
iv_100= dlmread('../../../octave/best_genomes/a23d5a4fc88b304f6a7b9a08d38095b871306a1e4a97bbe.dat','#');

%% configure cost functions to proper factor and clean up 

st_sim1(:,IVIDX)= st_sim1(:,IVIDX)*IVCOSTFACTOR;
st_sim2(:,IVIDX)= st_sim2(:,IVIDX)*IVCOSTFACTOR;
st_sim3(:,IVIDX)= st_sim3(:,IVIDX)*IVCOSTFACTOR;
st_100(:,IVIDX)= st_100(:,IVIDX)*IVCOSTFACTOR;


ifr_sim1(:,IVIDX)= ifr_sim1(:,IVIDX)*IVCOSTFACTOR;
ifr_sim2(:,IVIDX)= ifr_sim2(:,IVIDX)*IVCOSTFACTOR;
ifr_sim3(:,IVIDX)= ifr_sim3(:,IVIDX)*IVCOSTFACTOR;
ifr_100(:,IVIDX)= ifr_100(:,IVIDX)*IVCOSTFACTOR;

iv_sim1(:,IVIDX)= iv_sim1(:,IVIDX)*IVCOSTFACTOR;
iv_sim2(:,IVIDX)= iv_sim2(:,IVIDX)*IVCOSTFACTOR;
iv_sim3(:,IVIDX)= iv_sim3(:,IVIDX)*IVCOSTFACTOR;
iv_100(:,IVIDX)= iv_100(:,IVIDX)*IVCOSTFACTOR;

st_sim1(:,IFRIDX)= st_sim1(:,IFRIDX)*IFRCOSTFACTOR;
st_sim2(:,IFRIDX)= st_sim2(:,IFRIDX)*IFRCOSTFACTOR;
st_sim3(:,IFRIDX)= st_sim3(:,IFRIDX)*IFRCOSTFACTOR;
st_100(:,IFRIDX)= st_100(:,IFRIDX)*IFRCOSTFACTOR;

ifr_sim1(:,IFRIDX)= ifr_sim1(:,IFRIDX)*IFRCOSTFACTOR;
ifr_sim2(:,IFRIDX)= ifr_sim2(:,IFRIDX)*IFRCOSTFACTOR;
ifr_sim3(:,IFRIDX)= ifr_sim3(:,IFRIDX)*IFRCOSTFACTOR;
ifr_100(:,IFRIDX)= ifr_100(:,IFRIDX)*IFRCOSTFACTOR;

iv_sim1(:,IFRIDX)= iv_sim1(:,IFRIDX)*IFRCOSTFACTOR;
iv_sim2(:,IFRIDX)= iv_sim2(:,IFRIDX)*IFRCOSTFACTOR;
iv_sim3(:,IFRIDX)= iv_sim3(:,IFRIDX)*IFRCOSTFACTOR;
iv_100(:,IFRIDX)= iv_100(:,IFRIDX)*IFRCOSTFACTOR;


st_sim1(:,IFR100)= st_sim1(:,IFR100)*IFRCOSTFACTOR100;
st_sim2(:,IFR100)= st_sim2(:,IFR100)*IFRCOSTFACTOR100;
st_sim3(:,IFR100)= st_sim3(:,IFR100)*IFRCOSTFACTOR100;
st_100(:,IFR100)= st_100(:,IFR100)*IFRCOSTFACTOR100;

ifr_sim1(:,IFR100)= ifr_sim1(:,IFR100)*IFRCOSTFACTOR100;
ifr_sim2(:,IFR100)= ifr_sim2(:,IFR100)*IFRCOSTFACTOR100;
ifr_sim3(:,IFR100)= ifr_sim3(:,IFR100)*IFRCOSTFACTOR100;
ifr_100(:,IFR100)= ifr_100(:,IFR100)*IFRCOSTFACTOR100;

iv_sim1(:,IFR100)= iv_sim1(:,IFR100)*IFRCOSTFACTOR100;
iv_sim2(:,IFR100)= iv_sim2(:,IFR100)*IFRCOSTFACTOR100;
iv_sim3(:,IFR100)= iv_sim3(:,IFR100)*IFRCOSTFACTOR100;
iv_100(:,IFR100)= iv_100(:,IFR100)*IFRCOSTFACTOR100;

target_diffAN(:,IFRPOSITION)= target_diffAN(:,IFRPOSITION)*IFRCOSTFACTOR;
target_diffAN_100(:,IFRPOSITION100)= target_diffAN_100(:,IFRPOSITION100)*IFRCOSTFACTOR100;

rand1diffAN(:,IFRPOSITION)= rand1diffAN(:,IFRPOSITION)*IFRCOSTFACTOR;
rand1diffAN_100(:,IFRPOSITION100)= rand1diffAN_100(:,IFRPOSITION100)*IFRCOSTFACTOR100;

rand5diffAN(:,IFRPOSITION)= rand5diffAN(:,IFRPOSITION)*IFRCOSTFACTOR;
rand5diffAN_100(:,IFRPOSITION100)= rand5diffAN_100(:,IFRPOSITION100)*IFRCOSTFACTOR100;



%% Correct best genomes by removing original score, calculated during
%% the GA

st_sim1(1:end-1,STIDX) = st_sim1(2:end,STIDX); st_sim1 = st_sim1(1:end-1,:);
st_sim2(1:end-1,STIDX) = st_sim2(2:end,STIDX); st_sim2 = st_sim2(1:end-1,:);
st_sim3(1:end-1,STIDX) = st_sim3(2:end,STIDX); st_sim3 = st_sim3(1:end-1,:);
st_100(1:end-1,ST100) = st_100(2:end,ST100); st_100 = st_100(1:end-1,:);

ifr_sim1(1:end-1,IFRIDX) = ifr_sim1(2:end,IFRIDX); ifr_sim1 = ifr_sim1(1:end-1,:);
ifr_sim2(1:end-1,IFRIDX) = ifr_sim2(2:end,IFRIDX); ifr_sim2 = ifr_sim2(1:end-1,:);
ifr_sim3(1:end-1,IFRIDX) = ifr_sim3(2:end,IFRIDX); ifr_sim3 = ifr_sim3(1:end-1,:);
ifr_100(1:end-1,IFR100) = ifr_100(2:end,IFR100); ifr_100 = ifr_100(1:end-1,:);

iv_sim1(1:end-1,IVIDX) = iv_sim1(2:end,IVIDX); iv_sim1 = iv_sim1(1:end-1,:);
iv_sim2(1:end-1,IVIDX) = iv_sim2(2:end,IVIDX); iv_sim2 = iv_sim2(1:end-1,:);
iv_sim3(1:end-1,IVIDX) = iv_sim3(2:end,IVIDX); iv_sim3 = iv_sim3(1:end-1,:);
iv_100(1:end-1,IV100) = iv_100(2:end,IV100); iv_100 = iv_100(1:end-1,:);






# # stats

# # statistics(st_sim1(1:end-1,:)) 
# # statistics(st_sim2(1:end-1,:)) 
# # statistics(st_sim3(1:end-1,:)) 
# # statistics(st_100(1:end-1,:))  

# # statistics(ifr_sim1(1:end-1,:)) 
# # statistics(ifr_sim2(1:end-1,:)) 
# # statistics(ifr_sim3(1:end-1,:)) 
# # statistics(ifr_100 (1:end-1,:)) 

# # statistics(iv_sim1(1:end-1,:))  
# # statistics(iv_sim2(1:end-1,:)) 
# # statistics(iv_sim3(1:end-1,:)) 
# # statistics(iv_100(1:end-1,:))  

# # mean(st_sim1(1:end-1,:)) 
# # mean(st_sim2(1:end-1,:)) 
# # mean(st_sim3(1:end-1,:)) 
# # mean(st_100(1:end-1,:))  

# # mean(ifr_sim1(1:end-1,:)) 
# # mean(ifr_sim2(1:end-1,:)) 
# # mean(ifr_sim3(1:end-1,:)) 
# # mean(ifr_100 (1:end-1,:)) 

# # mean(iv_sim1(1:end-1,:))  
# # mean(iv_sim2(1:end-1,:)) 
# # mean(iv_sim3(1:end-1,:)) 
# # mean(iv_100(1:end-1,:))  

# # set(gca,'box','off','xlim', [0 13],'xtick',[2:2:12],'xticklabel',{})


# %% Table

# mean_target_diffAN = mean(target_diffAN);
#  std_target_diffAN=std(target_diffAN);

# mean_target_diffAN_100 = mean(target_diffAN_100);
#  std_target_diffAN_100=std(target_diffAN_100);


# mean_st_sim1=mean(st_sim1) ;
#  std_st_sim1=std(st_sim1) ;
# mean_st_sim2=mean(st_sim2) ;
#  std_st_sim2=std(st_sim2) ;
# mean_st_sim3=mean(st_sim3) ;
#  std_st_sim3=std(st_sim3) ;
# mean_st_sim=mean([ st_sim1;st_sim2;st_sim3]) ;
#  std_st_sim=std([ st_sim1;st_sim2;st_sim3]) ;
# mean_st_100=mean(st_100)  ;
#  std_st_100=std(st_100)  ;
        
# mean_ifr_sim1=mean(ifr_sim1) ;
#  std_ifr_sim1=std(ifr_sim1) ;
# mean_ifr_sim2=mean(ifr_sim2) ;
#  std_ifr_sim2=std(ifr_sim2) ;
# mean_ifr_sim3=mean(ifr_sim3) ;
#  std_ifr_sim3=std(ifr_sim3) ;
# mean_ifr_sim=mean([ ifr_sim1;ifr_sim2;ifr_sim3]) ;
#  std_ifr_sim=std([ ifr_sim1;ifr_sim2;ifr_sim3]) ;
# mean_ifr_100 =mean(ifr_100 ) ;
#  std_ifr_100 =std(ifr_100 ) ;
        
# mean_iv_sim1=mean(iv_sim1)  ;
#  std_iv_sim1=std(iv_sim1)  ;
# mean_iv_sim2=mean(iv_sim2) ;
#  std_iv_sim2=std(iv_sim2) ;
# mean_iv_sim3=mean(iv_sim3) ;
#  std_iv_sim3=std(iv_sim3) ;
# mean_iv_sim=mean([ iv_sim1;iv_sim2;iv_sim3]) ;
#  std_iv_sim=std([ iv_sim1;iv_sim2;iv_sim3]) ;
# mean_iv_100=mean(iv_100)  ;
#  std_iv_100=std(iv_100)  ;

# %% Table 1: 25 repetitions

# fid = fopen("best_genomes_25.tex","w+")
# fprintf(fid,"\\begin{tabular}{p{1.0in}*{4}{c}} \n")
# fprintf(fid,"& ST & IFR & AIV \\\\\\hline\n")
# fprintf(fid,"Target & %2.2f (%.2f) & %.4g (%.1e) & %.4g (%.1e) \\\\[2pt]\\hline \n", mean_target_diffAN(STPOSITION),  std_target_diffAN(STPOSITION), mean_target_diffAN(IFRPOSITION),  std_target_diffAN(IFRPOSITION), mean_target_diffAN(IVPOSITION),  std_target_diffAN(IVPOSITION))

# fprintf(fid,"  ST 1 & %2.2f (%.2f) & %.4g (%.1e) & %.4g (%.1e) \\\\\n", mean_st_sim1(STIDX),std_st_sim1(STIDX),  mean_st_sim1(IFRIDX),std_st_sim1(IFRIDX), mean_st_sim1(IVIDX),std_st_sim1(IVIDX))
# fprintf(fid,"  ST 2 & %2.2f (%.2f) & %.4g (%.1e) & %.4g (%.1e) \\\\\n", mean_st_sim2(STIDX),std_st_sim2(STIDX),  mean_st_sim2(IFRIDX),std_st_sim2(IFRIDX), mean_st_sim2(IVIDX),std_st_sim2(IVIDX))
# fprintf(fid,"  ST 3 & %2.2f (%.2f) & %.4g (%.1e) & %.4g (%.1e) \\\\\n", mean_st_sim3(STIDX),std_st_sim3(STIDX),  mean_st_sim3(IFRIDX),std_st_sim3(IFRIDX), mean_st_sim3(IVIDX),std_st_sim3(IVIDX))

# fprintf(fid,"ST  Ave.  & %2.2f (%.2f) & %.4g (%.1e) & %.4g (%.1e) \\\\[2pt]\\hline\n", mean_st_sim(STIDX),std_st_sim(STIDX),  mean_st_sim(IFRIDX),std_st_sim(IFRIDX), mean_st_sim(IVIDX),std_st_sim(IVIDX))

# fprintf(fid,"  IFR 1 & %2.2f (%.2f) & %.4g (%.1e) & %.4g (%.1e) \\\\\n", mean_ifr_sim1(STIDX),std_ifr_sim1(STIDX),  mean_ifr_sim1(IFRIDX),std_ifr_sim1(IFRIDX), mean_ifr_sim1(IVIDX),std_ifr_sim1(IVIDX))
# fprintf(fid,"  IFR 2 & %2.2f (%.2f) & %.4g (%.1e) & %.4g (%.1e) \\\\\n", mean_ifr_sim2(STIDX),std_ifr_sim2(STIDX),  mean_ifr_sim2(IFRIDX),std_ifr_sim2(IFRIDX), mean_ifr_sim2(IVIDX),std_ifr_sim2(IVIDX))
# fprintf(fid,"  IFR 3 & %2.2f (%.2f) & %.4g (%.1e) & %.4g (%.1e) \\\\\n", mean_ifr_sim3(STIDX),std_ifr_sim3(STIDX),  mean_ifr_sim3(IFRIDX),std_ifr_sim3(IFRIDX), mean_ifr_sim3(IVIDX),std_ifr_sim3(IVIDX))

# fprintf(fid,"IFR Ave. & %2.2f (%.2f) & %.4g (%.1e) & %.4g (%.1e) \\\\[2pt]\\hline\n", mean_ifr_sim(STIDX),std_ifr_sim(STIDX),  mean_ifr_sim(IFRIDX),std_ifr_sim(IFRIDX), mean_ifr_sim(IVIDX),std_ifr_sim(IVIDX))

# fprintf(fid,"  IV 1 & %2.2f (%.2f) & %.4g (%.1e) & %.4g (%.1e) \\\\\n", mean_iv_sim1(STIDX),std_iv_sim1(STIDX),  mean_iv_sim1(IFRIDX),std_iv_sim1(IFRIDX), mean_iv_sim1(IVIDX),std_iv_sim1(IVIDX))
# fprintf(fid,"  IV 2 & %2.2f (%.2f) & %.4g (%.1e) & %.4g (%.1e) \\\\\n", mean_iv_sim2(STIDX),std_iv_sim2(STIDX),  mean_iv_sim2(IFRIDX),std_iv_sim2(IFRIDX), mean_iv_sim2(IVIDX),std_iv_sim2(IVIDX))
# fprintf(fid,"  IV 3 & %2.2f (%.2f) & %.4g (%.1e) & %.4g (%.1e) \\\\\n", mean_iv_sim3(STIDX),std_iv_sim3(STIDX),  mean_iv_sim3(IFRIDX),std_iv_sim3(IFRIDX), mean_iv_sim3(IVIDX),std_iv_sim3(IVIDX))

# fprintf(fid,"IV Ave. & %2.2f (%.2f) & %.4g (%.1e) & %.4g (%.1e) \\\\[2pt]\\hline\n", mean_iv_sim(STIDX),std_iv_sim(STIDX),  mean_iv_sim(IFRIDX),std_iv_sim(IFRIDX), mean_iv_sim(IVIDX),std_iv_sim(IVIDX))
# fprintf(fid,"\\end{tabular}")
# fclose(fid)


# % Table 2: Cross comparison of 25 + 100 rep best genomes

# fid = fopen("best_genomes_100.tex","w+")
# fprintf(fid,"\\begin{tabular}{p{1.0in}*{7}{c}} \n")
# fprintf(fid," & ST-25 & ST-100 & IFR-25 & IFR-100 & AIV-25 & AIV-100 \\\\[2pt]\\hline\n")
# fprintf(fid,"Target & %2.2f (%.2f) & %2.2f (%.2f) & %.4g (%.1e) &%.4g (%.1e) &%.4g (%.1e) & %.4g (%.1e) \\\\[2pt]\\hline\n", mean_target_diffAN(STPOSITION),  std_target_diffAN(STPOSITION), mean_target_diffAN_100(STPOSITION100),  std_target_diffAN_100(STPOSITION100), mean_target_diffAN(IFRPOSITION),  std_target_diffAN(IFRPOSITION), mean_target_diffAN_100(IFRPOSITION100),  std_target_diffAN_100(IFRPOSITION100), mean_target_diffAN(IVPOSITION),  std_target_diffAN(IVPOSITION), mean_target_diffAN_100(IVPOSITION100),  std_target_diffAN_100(IVPOSITION100))

# fprintf(fid,"  ST-25 1 & %2.2f (%.2f) & %2.2f (%.2f) & %.4g (%.1e) &%.4g (%.1e) &%.4g (%.1e) & %.4g (%.1e) \\\\\n", mean_st_sim1(STIDX),std_st_sim1(STIDX),mean_st_sim1(ST100),std_st_sim1(ST100),  mean_st_sim1(IFRIDX),std_st_sim1(IFRIDX),  mean_st_sim1(IFR100),std_st_sim1(IFR100), mean_st_sim1(IVIDX),std_st_sim1(IVIDX), mean_st_sim1(IV100),std_st_sim1(IV100))
# fprintf(fid,"  ST-25 2 & %2.2f (%.2f) & %2.2f (%.2f) & %.4g (%.1e) &%.4g (%.1e) &%.4g (%.1e) & %.4g (%.1e) \\\\\n", mean_st_sim2(STIDX),std_st_sim2(STIDX),mean_st_sim2(ST100),std_st_sim2(ST100),  mean_st_sim2(IFRIDX),std_st_sim2(IFRIDX),  mean_st_sim2(IFR100),std_st_sim2(IFR100), mean_st_sim2(IVIDX),std_st_sim2(IVIDX), mean_st_sim2(IV100),std_st_sim2(IV100))
# fprintf(fid,"  ST-25 3 & %2.2f (%.2f) & %2.2f (%.2f) & %.4g (%.1e) &%.4g (%.1e) &%.4g (%.1e) & %.4g (%.1e) \\\\\n", mean_st_sim3(STIDX),std_st_sim3(STIDX),mean_st_sim3(ST100),std_st_sim3(ST100),  mean_st_sim3(IFRIDX),std_st_sim3(IFRIDX),  mean_st_sim3(IFR100),std_st_sim3(IFR100), mean_st_sim3(IVIDX),std_st_sim3(IVIDX), mean_st_sim3(IV100),std_st_sim3(IV100))

# fprintf(fid,"ST-25 Ave. & %2.2f (%.2f) & %2.2f (%.2f) & %.4g (%.1e) &%.4g (%.1e) &%.4g (%.1e) & %.4g (%.1e) \\\\[2pt]\\hline\n", mean_st_sim(STIDX),std_st_sim(STIDX),mean_st_sim(ST100),std_st_sim(ST100),  mean_st_sim(IFRIDX),std_st_sim(IFRIDX),  mean_st_sim(IFR100),std_st_sim(IFR100), mean_st_sim(IVIDX),std_st_sim(IVIDX), mean_st_sim(IV100),std_st_sim(IV100))


# fprintf(fid,"  IFR-25 1 & %2.2f (%.2f) & %2.2f (%.2f) & %.4g (%.1e) &%.4g (%.1e) &%.4g (%.1e) & %.4g (%.1e) \\\\\n", mean_ifr_sim1(STIDX),std_ifr_sim1(STIDX),mean_ifr_sim1(ST100),std_ifr_sim1(ST100),  mean_ifr_sim1(IFRIDX),std_ifr_sim1(IFRIDX),  mean_ifr_sim1(IFR100),std_ifr_sim1(IFR100), mean_ifr_sim1(IVIDX),std_ifr_sim1(IVIDX), mean_ifr_sim1(IV100),std_ifr_sim1(IV100))
# fprintf(fid,"  IFR-25 2 &%2.2f (%.2f) & %2.2f (%.2f) & %.4g (%.1e) &%.4g (%.1e) &%.4g (%.1e) & %.4g (%.1e) \\\\\n", mean_ifr_sim2(STIDX),std_ifr_sim2(STIDX),mean_ifr_sim2(ST100),std_ifr_sim2(ST100),  mean_ifr_sim2(IFRIDX),std_ifr_sim2(IFRIDX),  mean_ifr_sim2(IFR100),std_ifr_sim2(IFR100), mean_ifr_sim2(IVIDX),std_ifr_sim2(IVIDX), mean_ifr_sim2(IV100),std_ifr_sim2(IV100))
# fprintf(fid,"  IFR-25 3 &%2.2f (%.2f) & %2.2f (%.2f) & %.4g (%.1e) &%.4g (%.1e) &%.4g (%.1e) & %.4g (%.1e) \\\\\n", mean_ifr_sim3(STIDX),std_ifr_sim3(STIDX),mean_ifr_sim3(ST100),std_ifr_sim3(ST100),  mean_ifr_sim3(IFRIDX),std_ifr_sim3(IFRIDX),  mean_ifr_sim3(IFR100),std_ifr_sim3(IFR100), mean_ifr_sim3(IVIDX),std_ifr_sim3(IVIDX), mean_ifr_sim3(IV100),std_ifr_sim3(IV100))

# fprintf(fid,"IFR-25 Ave. &%2.2f (%.2f) & %2.2f (%.2f) & %.4g (%.1e) &%.4g (%.1e) &%.4g (%.1e) & %.4g (%.1e) \\\\[2pt]\\hline\n", mean_ifr_sim(STIDX),std_ifr_sim(STIDX),mean_ifr_sim(ST100),std_ifr_sim(ST100),  mean_ifr_sim(IFRIDX),std_ifr_sim(IFRIDX),  mean_ifr_sim(IFR100),std_ifr_sim(IFR100), mean_ifr_sim(IVIDX),std_ifr_sim(IVIDX), mean_ifr_sim(IV100),std_ifr_sim(IV100))


# fprintf(fid,"  AIV-25 1 &%2.2f (%.2f) & %2.2f (%.2f) & %.4g (%.1e) &%.4g (%.1e) &%.4g (%.1e) & %.4g (%.1e) \\\\\n", mean_iv_sim1(STIDX),std_iv_sim1(STIDX),mean_iv_sim1(ST100),std_iv_sim1(ST100),  mean_iv_sim1(IFRIDX),std_iv_sim1(IFRIDX),  mean_iv_sim1(IFR100),std_iv_sim1(IFR100), mean_iv_sim1(IVIDX),std_iv_sim1(IVIDX), mean_iv_sim1(IV100),std_iv_sim1(IV100))
# fprintf(fid,"  AIV-25 2 &%2.2f (%.2f) & %2.2f (%.2f) & %.4g (%.1e) &%.4g (%.1e) &%.4g (%.1e) & %.4g (%.1e) \\\\\n", mean_iv_sim2(STIDX),std_iv_sim2(STIDX),mean_iv_sim2(ST100),std_iv_sim2(ST100),  mean_iv_sim2(IFRIDX),std_iv_sim2(IFRIDX),  mean_iv_sim2(IFR100),std_iv_sim2(IFR100), mean_iv_sim2(IVIDX),std_iv_sim2(IVIDX), mean_iv_sim2(IV100),std_iv_sim2(IV100))
# fprintf(fid,"  AIV-25 3 &%2.2f (%.2f) & %2.2f (%.2f) & %.4g (%.1e) &%.4g (%.1e) &%.4g (%.1e) & %.4g (%.1e) \\\\\n", mean_iv_sim3(STIDX),std_iv_sim3(STIDX),mean_iv_sim3(ST100),std_iv_sim3(ST100),  mean_iv_sim3(IFRIDX),std_iv_sim3(IFRIDX),  mean_iv_sim3(IFR100),std_iv_sim3(IFR100), mean_iv_sim3(IVIDX),std_iv_sim3(IVIDX), mean_iv_sim3(IV100),std_iv_sim3(IV100))

# fprintf(fid,"AIV-25 Ave. &%2.2f (%.2f) & %2.2f (%.2f) & %.4g (%.1e) &%.4g (%.1e) &%.4g (%.1e) & %.4g (%.1e) \\\\[2pt]\\hline\n", mean_iv_sim(STIDX),std_iv_sim(STIDX),mean_iv_sim(ST100),std_iv_sim(ST100),  mean_iv_sim(IFRIDX),std_iv_sim(IFRIDX),  mean_iv_sim(IFR100),std_iv_sim(IFR100), mean_iv_sim(IVIDX),std_iv_sim(IVIDX), mean_iv_sim(IV100),std_iv_sim(IV100))


# fprintf(fid,"ST-100 & %2.2f (%.2f) & %2.2f (%.2f) & %.4g (%.1e) &%.4g (%.1e) &%.4g (%.1e) & %.4g (%.1e) \\\\\n", mean_st_100(STIDX),std_st_100(STIDX),mean_st_100(ST100),std_st_100(ST100),  mean_st_100(IFRIDX),std_st_100(IFRIDX),  mean_st_100(IFR100),std_st_100(IFR100), mean_st_100(IVIDX),std_st_100(IVIDX), mean_st_100(IV100),std_st_100(IV100))
# fprintf(fid,"IFR-100 & %2.2f (%.2f) & %2.2f (%.2f) & %.4g (%.1e) &%.4g (%.1e) &%.4g (%.1e) & %.4g (%.1e) \\\\\n", mean_ifr_100(STIDX),std_ifr_100(STIDX),mean_ifr_100(ST100),std_ifr_100(ST100),  mean_ifr_100(IFRIDX),std_ifr_100(IFRIDX),  mean_ifr_100(IFR100),std_ifr_100(IFR100), mean_ifr_100(IVIDX),std_ifr_100(IVIDX), mean_ifr_100(IV100),std_ifr_100(IV100))
# fprintf(fid,"AIV-100 & %2.2f (%.2f) & %2.2f (%.2f) & %.4g (%.1e) &%.4g (%.1e) &%.4g (%.1e) & %.4g (%.1e) \\\\[2pt]\\hline\n", mean_iv_100(STIDX),std_iv_100(STIDX),mean_iv_100(ST100),std_iv_100(ST100),  mean_iv_100(IFRIDX),std_iv_100(IFRIDX),  mean_iv_100(IFR100),std_iv_100(IFR100), mean_iv_100(IVIDX),std_iv_100(IVIDX), mean_iv_100(IV100),std_iv_100(IV100))
# fprintf(fid,"\\end{tabular}")

# fclose(fid)



x = statistics(rand1diffAN);
save -ascii "stat_rand1_25.dat" x

x = statistics(rand5diffAN);
save -ascii "stat_rand5_25.dat" x

x = statistics(rand1diffAN_100);
save -ascii "stat_rand1_100.dat" x

x = statistics(rand5diffAN_100);
save -ascii "stat_rand5_100.dat" x


save -ascii "target_diffAN.dat" target_diffAN
save -ascii "target_diffAN_100.dat" target_diffAN_100
save -ascii "rand1diffAN.dat" rand1diffAN
save -ascii "rand5diffAN.dat" rand5diffAN 
save -ascii "rand1diffAN_100.dat" rand1diffAN_100 
save -ascii "rand5diffAN_100.dat" rand5diffAN_100 



save -ascii "st_sim1.dat" st_sim1
save -ascii "st_sim2.dat" st_sim2
save -ascii "st_sim3.dat" st_sim3
save -ascii "st_100.dat" st_100
        
save -ascii "ifr_sim1.dat" ifr_sim1
save -ascii "ifr_sim2.dat" ifr_sim2
save -ascii "ifr_sim3.dat" ifr_sim3
save -ascii "ifr_100.dat" ifr_100
        
save -ascii "iv_sim1.dat" iv_sim1
save -ascii "iv_sim2.dat" iv_sim2
save -ascii "iv_sim3.dat" iv_sim3
save -ascii "iv_100.dat" iv_100


