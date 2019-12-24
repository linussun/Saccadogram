disp('The Current Directory should be the notebooks directory if in a Jupyter lab, if not running a jupyter notebook, keep everything in same diretory')
pwd

disp('***********************************************************************')
disp('*** LOOK FOR WINDOW IN THE BACK AND RAISE IT (Cmd-back appostrophe) ***')
disp('***********************************************************************')

dlgtxt = sprintf('Would you like to label (and concatenate if more than one) these files into memory (Trials struct)?\n');
% create text for dialog box
for i = 1:length(fnchose)
    dlgtxt = [dlgtxt, sprintf([eyes{i} ': ' fnchose{i} '\n'])];
end

% QUICK PROMPT GUI to interact with Notebook rather than through cells:
answer = questdlg(dlgtxt,'File Concatenation Menu','Yes','No','Yes')
% Handle response
switch answer
    case 'Yes'
        %fnchose
        eyes

        Trials = [];
        for i = 1:length(fnchose)
            dat = load([fnchose{i}])
            %% add eyes to each file
            %% dat.Trials returns the Trials structure
            for i2 = 1:length(dat.Trials)
                dat.Trials(i2).eye = eyes{i};
            end
            Trials = [Trials(:); dat.Trials(:)];
        end
        disp(' ')
        disp('New Trials should appear here (if there is a vertcat error, may have to rerun bhv2matML script and specify OD and OS for eye):')
    case 'No'
        disp('Okay nothing done')
end

% Now print out the Trials and info variables in memory:
whos Trials info
