# BashScript

Systems' Programming, 
Departement of Informatics and Telecommunications, 
National & Kapodistrian Uneversity of Athens

##################### RUN ######################
./create_infiles.sh  diseasesFile  countriesFile  input_dir  numFilesPerDirectory numRecordsPerFile 

diseasesFile: file with virus names (one per line).
countriesFile: file with country names (one per line).
input_dir: the name of a directory where subdirectories and input files will be placed.

################# IMPLEMENTATION ###############
Firstly, we check if the user gave correct input, if not then retry.
If no error has occured, it creates the directory input_dir. This is implemented by a while loop,
for all the lines of the file, untill its' end.
In order to implement numFilesPerDirectory, we implement a for loop, in which the files in which dates 
