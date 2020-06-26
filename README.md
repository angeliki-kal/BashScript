# BashScript

Systems' Programming, 
Departement of Informatics and Telecommunications, 
National & Kapodistrian Uneversity of Athens

############################################################ RUN #################################################################
./create_infiles.sh  diseasesFile  countriesFile  input_dir  numFilesPerDirectory numRecordsPerFile 

diseasesFile: file with virus names (one per line).
countriesFile: file with country names (one per line).
input_dir: the name of a directory where subdirectories and input files will be placed.

####################################################### IMPLEMENTATION ############################################################
There is an examnation of the input that user gave. If that input is not correct, it prints a fitting message.
It checks if the right amount of arguments has been given and if the last two arguments are unsigned integers.

If no error has occured, it creates the directory input_dir. 

In the input_dir it creates subdirectories, one for every line of the countriesFile.

In every subdirectory it creates numFilesPerDirectory files with the name of a random date DD-MM-YYYY. In each file it places numRecordsPerFile following the form presented bellow:
 
                                889 ENTER Mary Smith COVID-2019 23 
                                776 ENTER Larry Jones SARS-1 87          
                                125 EXIT Jon Dupont H1N1 62

                   
