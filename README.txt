# BashScript

Systems' Programming, 
Departement of Informatics and Telecommunications, 
National & Kapodistrian Uneversity of Athens

######################### RUN ##########################
./create_infiles.sh  diseasesFile  countriesFile  input_dir  numFilesPerDirectory numRecordsPerFile 

diseasesFile: file with virus names (one per line).
countriesFile: file with country names (one per line).
input_dir: the name of a directory where subdirectories and input files will be placed.

#################### IMPLEMENTATION ####################
Starting by  checking if the right amount of arguments has been given and if the last two arguments are integers > 0.
If it does not meet the specifications, it prints a fitting message.

If no error has occured, it creates the directory input_dir. 

In the input_dir it creates subdirectories, one for every line of the countriesFile, given by user.

In every subdirectory it creates numFilesPerDirectory files with the name of a random date DD-MM-YYYY. 
In each file it places numRecordsPerFile following the form presented bellow:
 
                                889 ENTER Mary Smith COVID-2019 23 
                                776 ENTER Larry Jones SARS-1 87          
                                125 EXIT Jon Dupont H1N1 62

1) recordID:  random unsigned integer from 0 to 999.
2) ENTER or EXIT: random string indicating admission or discharge from the hospital.
3) patientFirstName: random string consisting letters without spaces.                   
4) patientLastName: random string consisting letters without spaces. 
5) disease: a string consisting letters, numbers, and possibly a dash "-" but without spaces. This is given by 
user's diseasesFile.
6) age: random integer number 1 <= age <= 120.
