notebookdir = pwd;
rawdatadir = pwd; fprintf('*** .mat files in subject directory: ***')
matfilenames = dir('*.mat');
dir('*.mat')
eyes={};

disp('***********************************************************************')
disp('*** LOOK FOR WINDOW IN THE BACK AND RAISE IT (Cmd-back appostrophe) ***')
disp('***********************************************************************')

% QUICK PROMPT 1
fn = {matfilenames.name};

% Run Script Hack which will return indx,tf
[indx,tf] = listdlg('PromptString','Select two (or more) files to concatenate:','SelectionMode','multiple','ListString',fn,'ListSize',[300 200]);
%indx %tf
fnchose = fn(indx)

% ID defaults by filename 
for idx = 1:length(fnchose)
    if ~isempty(findstr('OD',fnchose{idx})) & isempty(findstr('OS',fnchose{idx})); defeyeinput{idx} = 'OD';
    elseif isempty(findstr('OD',fnchose{idx})) & ~isempty(findstr('OS',fnchose{idx})); defeyeinput{idx} = 'OS';
    elseif ~isempty(findstr('OU',fnchose{idx})); defeyeinput{idx} = 'OU';
    elseif ~isempty(findstr('OD',fnchose{idx})) & ~isempty(findstr('OS',fnchose{idx})); defeyeinput{idx} = 'ODOS';
    else; defeyeinput{idx} = 'TBD';
    end
end
    
% QUICK PROMPT 2
GUItitle = 'SET EYE for each file (OD, OS, or OU):';
prompt = fnchose; dims = [1 60];
%definput = cell(1,length(fnchose)); % sets up input for number of files
answer = inputdlg(prompt,GUItitle,dims,defeyeinput);
if isempty(answer)
    disp('EXITING EARLY (Clicked Cancel)');
    return;
else
    for eyesi = 1:length(fnchose)
        eyes{eyesi} = answer{eyesi};
    end
end
eyes

disp('Now files and eyes have been labelled in memory, you can concatenate them in Step 3')