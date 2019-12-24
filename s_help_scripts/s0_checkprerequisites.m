%% Pattern contains names of path we are interested
pattern = ["TE1dev2","TEGsharedlibs","saccadogram"]; 
[pathoutput] = eval('path'); % gets PATH from Matlab kernel (determined in Matlab App)
[pathstrs] = strsplit(pathoutput,{';',':'}); % splits single linestring into multiple strings
fprintf('\nOutput from cell above:\nThe Matlab PATH has the relevant folders below\nIF TE1dev, TEGsharedlibs, or saccadogram are missing must add it to path in Matlab:\n\n');
%pf = contains(pathstrs,pattern); % logical list of pattern found in string list array
pf = endsWith(pathstrs,pattern); % logical list of pattern found in string list array
for i=find(pf) % get indecies of path strings which have found patterns
    disp(pathstrs{i}); % display each path string that was identified in pattern
end
if sum(pf) >= length(pattern)
    fprintf(['\nFound all ' num2str(length(pattern)) ' required paths! You can continue with analysis!'])
else
    fprintf(['\nFound ' num2str(length(pattern)) ' paths'])
    fprintf('\nsome paths are missing, here is a list of the found paths:')
end

% make sure bhv2matML is in saccadogram folder (shared)
disp(' '); disp(' ')
disp('Monkeylogic should already be installed, if not will get error of "file not found:"')
disp('Look for mlread and bhv2matML3 function scripts');
which mlread
which bhv2matML3 % version 2 accounts for .eye = OD and eye2 = OS.

fprintf(['\nThe current notebook fullpath is:  ' ])
pwd

% get the current working directory of the folder containing this notebook
notebookpath = pwd;

% data in this dir should be generally NOT deleted
bhv2files = dir('*.bhv2');
fprintf('\nBHV2 files found:\n')
!ls -l *.bhv2
fprintf('\nMATLAB files found:\n')
!ls -l *.mat
matfiles = dir('*.mat'); if isempty(matfiles); disp('No .mat files found!'); end;