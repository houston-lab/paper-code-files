function stats = circ_statsmod(alpha, w, d)
%
% stats = circ_stats(alpha, w)
%   Computes descriptive statistics for circular data.
%
%   Input:
%     alpha   sample of angles in radians
%     [w      weightings in case of binned angle data]
%     [d    spacing of bin centers for binned data, if supplied 
%           correction factor is used to correct for bias in 
%           estimation of r]
%
%   Output:
%     stats   structure containing descriptive statistics
%
% References:
%   Statistical analysis of circular data, N. I. Fisher
%   Topics in circular statistics, S. R. Jammalamadaka et al. 
%   Biostatistical Analysis, J. H. Zar
%
% Circular Statistics Toolbox for Matlab

% By Philipp Berens, 2009
% berens@tuebingen.mpg.de 

alpha = alpha(:);
if nargin<2
  w = ones(size(alpha));
end

if nargin < 3
  d = 0;
end

% mean --convert to pos value, dwh Oct2013
stats.mean = circ_mean(alpha,w); 
if stats.mean < 0
    stats.mean = stats.mean + 2*pi;
end

% added mean angle in degrees and conf limits --dwh Oct 2013
stats.meandeg = circ_rad2ang(stats.mean);

% confidence limits
stats.conf = circ_confmean(alpha, 0.05);

% median
if sum(w)==length(alpha)
  if numel(alpha) > 1000
    idx = randperm(numel(alpha));
    idx = idx(1:1000);
  else
    idx = 1:numel(alpha);
  end
  stats.median = circ_median(alpha(idx));
else
  stats.median = NaN;
end

% variance
stats.var = circ_var(alpha,w,d);

% standard deviation
[stats.std stats.std0] = circ_std(alpha,w,d);

% skewness
[stats.skewness stats.skewness0] = circ_skewness(alpha,w);

% kurtosis
[stats.kurtosis stats.kurtosis0] = circ_kurtosis(alpha,w);

% added  --dwh Oct 2013
% vector length
stats.R = circ_r(alpha,w);

% Rayleigh test
stats.Rayleigh = circ_rtest(alpha,w);

% Omnibus test
stats.Omni = circ_otest(alpha,w);






