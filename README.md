# Saccadogram Template

## This repository is a blank template for analysis of eye movements from the Sun/Goldberg Lab. Here are the instructions on how to use it:

1. Download zip file from https://github.com/linussun/saccadogram_notebook and unpack into your data directory
1. It is assumed you have a new subjects data already in either .bhv2 files from monkeylogic (which need to be converted to .mat and combined) or .mat files already. Since there usually very few data files for single person data analysis, we should just leave the data files in the same main folder as the jupyter notebook which is: 1.0_Saccadogram.ipynb
1. The reports/figures should be stored in the reports folder, as is any template report document. 

Note: data files may have been collected with different methods/devices. The data types and machines/methods are summarized below:

| Device 	    | Software 	    | Datafile 	        | Helper Files 	|
|--------	    |----------	    |----------	        |--------------	|
| Eyelink 1000  | MonkeyLogic   |  .bhv2            | mlread      	|
| HighSpeed SMI | PEECS         |  .pedat        	| see notebook  |
| Pupil-Labs    | Psychopy      |  .hdf5 or .csv    | see notebook  |







