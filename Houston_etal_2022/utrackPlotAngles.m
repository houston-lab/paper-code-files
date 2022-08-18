function utrackPlotAngles(rawData,saveDir,varargin)
% utrackPlotAngles saves
%
% Input:
% 
%   rawData - A matrix containing the .
%
%   saveDir - a string containing the 
%
%   
% Copyright (C) 2014 LCCB 
%
% This file is part of u-track.
% 
% u-track is free software: you can redistribute it and/or modify
% it under the terms of the GNU General Public License as published by
% the Free Software Foundation, either version 3 of the License, or
% (at your option) any later version.
% 
% u-track is distributed in the hope that it will be useful,
% but WITHOUT ANY WARRANTY; without even the implied warranty of
% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
% GNU General Public License for more details.
% 
% You should have received a copy of the GNU General Public License
% along with u-track.  If not, see <http://www.gnu.org/licenses/>.
% 
% 

% Called by postProcessMovieComets (prev. plusTipPoolGroupData).  See function for input format.
% Kathryn Applegate, Jan 2010
% Sebastien Besson, June 2011
% Douglas Houston, 2016

ip = inputParser;
ip.addRequired('rawData',@(x) iscell(x) || isnumeric(x));
ip.addRequired('saveDir',@ischar);
ip.parse(rawData,saveDir,varargin{:});

% Convert input to generic cell array of size Nx1 where N is the number of
% groups. Each cell contains M(i)x1 cells where M(i) is the number of
% samples for the i-th group. Each sample cell should be a Lx9 matrix.
% 
% if isnumeric(rawData), 
%     rawData={{rawData}}; 
% elseif isnumeric(rawData{1})
%     rawData={rawData};
% end
% 
% nCells = cellfun(@numel,rawData);

if ~isdir(saveDir), mkdir(saveDir); end

% plot angle data
saveFig =figure;
rose(rawData);
% [tout, rout] = rose(rawData);
% polar (tout, rout);
hline = findobj(gca,'Type','line');
set(hline,'LineWidth',2.0)
saveas(gcf,[saveDir filesep 'angles_histogram.fig'])
print(saveFig,'-depsc2',[saveDir filesep 'angles_histogram'])
close(saveFig)

% saveFig = figure;
% polar(tout,rout./max(rout)); 
% print(saveFig,'-depsc',[saveDir filesep 'angles_historgramNormalized']); 
% close(saveFig)

% run circ_statsmod on 'angles' variable transposed
% and save stats.mat file
% stats = circ_statsmod(angles');
% save([saveDir filesep 'stats']);


% new code for printing angle stats from tip tracker;
% Added this part to 'processMTTracks.m' //DWH 2014

%angFile = [saveDir filesep 'angstat.txt'];
%angData= struct2cell(stats);
%angName = fieldnames(stats);
%fid=fopen(angFile,'w+');
%for i=1:numel(angName)
%    fprintf(fid,'%s\t%g\n',angName{i}, angData{i});
%end
%fclose(fid);

end

%function angles = getAngles(track)
%x=track.tracksCoordAmpCG(1:8:end);
%y=track.tracksCoordAmpCG(2:8:end);
%angles=atan2(-(y(2:end)-y(1:end-1)),x(2:end)-x(1:end-1));
%end
