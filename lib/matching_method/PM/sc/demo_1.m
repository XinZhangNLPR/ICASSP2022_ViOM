% Shape Context Demo #1
% match two pointsets from Chui & Rangarajan

% uncomment out one of these commands to load in some shape data
%load save_fish_def_3_1.mat
%load save_fish_noise_3_2.mat
%load save_fish_outlier_3_2.mat
%X=x1;
%Y=y2a;

%X = [361,173;351,230; 331,293; 219,328;323,351;416,431; 200,388; 309,410; ];
%Y = [578,687;580,348; 563,407;477,329; 533,544; 669,433; 670,579; 503,676; 620,175;609,233;460,387;585,293; ];



display_flag=1;
mean_dist_global=[]; % use [] to estimate scale from the data
nbins_theta=12;
nbins_r=5;
nsamp1=size(X,1);
nsamp2=size(Y,1);
ndum1=0;
ndum2=0;
if nsamp2>nsamp1
   % (as is the case in the outlier test)
   ndum1=ndum1+(nsamp2-nsamp1);
end
eps_dum=0.15;
r_inner=1/8;
r_outer=2;
n_iter=5;
r=1; % annealing rate
beta_init=1;  % initial regularization parameter (normalized)

if display_flag
   [x,y]=meshgrid(linspace(0,1,18),linspace(0,1,36));
   x=x(:);y=y(:);M=length(x);
end

if display_flag
   figure(1)
   plot(X(:,1),X(:,2),'b+',Y(:,1),Y(:,2),'ro')
   title(['original pointsets (nsamp1=' int2str(nsamp1) ', nsamp2=' ...
       int2str(nsamp2) ')'])
   if 0
      h1=text(X(:,1),X(:,2),int2str((1:nsamp1)'));
      h2=text(Y(:,1),Y(:,2),int2str((1:nsamp2)'));  
      set(h2,'fontangle','italic');
   end
   drawnow
end

tps_iter_match_1
