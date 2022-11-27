# BashScript

### Systems' Programming course

### Departement of Informatics and Telecommunications

### National & Kapodistrian Uneversity of Athens

## EXECUTION

```bash
./create_infiles.sh  diseasesFile.txt  countriesFile.txt  input_dir  numFilesPerDirectory numRecordsPerFile 
```

* <ins>diseasesFile</ins>: file with virus names (one per line).
* <ins>countriesFile</ins>: file with country names (one per line).
* <ins>input_dir</ins>: the name of a directory where subdirectories and input files will be placed.

## IMPLEMENTATION

Starting by  checking if the right amount of arguments has been given and if the last two arguments are integers > 0.
If it does not meet the specifications, it prints a fitting message.

If no error has occured, it creates the directory input_dir.

In the input_dir it creates subdirectories, one for every line of the countriesFile, given by user.

In every subdirectory it creates numFilesPerDirectory files with the name of a random date DD-MM-YYYY.
In each file it places numRecordsPerFile following the form presented bellow:

```bash
889 ENTER Mary Smith COVID-2019 23 
776 ENTER Larry Jones SARS-1 87          
125 EXIT Jon Dupont H1N1 62
```

1) **recordID**:  random unsigned integer from 0 to 999.
2) **ENTER or EXIT**: random string indicating admission or discharge from the hospital.
3) **patientFirstName**: random string consisting letters without spaces.
4) **patientLastName**: random string consisting letters without spaces.
5) **disease**: a string consisting letters, numbers, and possibly a dash "-" but without spaces. This is given by user's diseasesFile.
6) **age**: random integer number 1 <= age <= 120.
