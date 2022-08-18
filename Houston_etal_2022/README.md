 # Circular statistical analysis of microtubule plus end dynamics
 
This page details the steps necessary to add circular statistical analysis to the u-track package (v2.3; https://github.com/DanuserLab/u-track) as used in our manuscript (link TBA). 

## 1. CircStat

a. We used the CircStat package for MATLAB for analyzing directional data (Berens, 2009). Download the package from Github (https://github.com/circstat/circstat-matlab.git) and place the 'circ-stat-master' folder into the 'software' folder of u-track. This is not strictly necessary but will make sure it stays on the correct path. 

b. Copy the 'circ_statsmod.m' file into the 'circ-stat-master' folder. Code has been added to output mean angle in degrees as well as the results of cicrular uniformity tests. 

## 2. u-track

a. Place the other modified files (postProcessMovieComets.m, postProcessMTTracks.m, and utrackPlotAngles.m) into the u-track 'software' folder (replace, save originals). This code will call circ_statsmod.m, add the data to the projData object of the u-track data. This data will then be used to output the mean directon (degree), resultant vector (r), Rayleigh p-value, and other values per movie, as well as plot and save the angle histograms. 

## Bibliography/References

E. Batschelet, Circular Statistics in Biology, Academic Press, 1981

P. Berens, CircStat: A Matlab Toolbox for Circular Statistics, Journal of Statistical Software, Volume 31, Issue 10, 2009 http://www.jstatsoft.org/v31/i10


