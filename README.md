
# LinuxMonitoring-v1.0
School 21 | Linux basic bash scripting and system research

 - **For each task, a folder must be created with a name like: 0x, where x
   is the task number.** 
  - **All scripts must be decomposed and divided into
   several files.**
   - **The main script file for each job should be called
   main.sh.**
   - **All scripts must have checks for incorrect input (not all
   parameters are specified, incorrectly formatted parameters, etc.).**
  - **All written scripts must be run on an Ubuntu Server 20.04 LTS virtual
   machine.**

**The first task in folder 01**: Bash script that runs with one string argument and outputs it. Otherwise an error will be displayed.

**Second task in folder 02**: The script displays information about the system. After output, it offers to save the information to a .status file.

**Third task in folder 03**: The script is launched with four number arguments (from 1 to 6) and displays information from the second task with a new visual design. This assignment uses the code written in assignment two.

- *Color designations: (1 - white, 2 - red, 3 - green, 4 - blue, 5 - purple, 6 - black)*
- *Parameter 1 is the background of the value names (HOSTNAME, TIMEZONE, USER, etc.)*
- *Parameter 2 is the font color of the value names (HOSTNAME, TIMEZONE, USER, etc.)*
- *Parameter 3 is the background of the values (after the '=' sign)*
- *Parameter 4 is the font color of the values (after the '= sign)*

**Job four in folder 04**: The script does the same thing as job three, but uses the values in the .conf file to change the output visual. If there are no values in it, the default values are used. This assignment uses the code written in assignment three.

**Fifth task in folder 05**: The script is launched with an argument - the path to the folder (relative or absolute), after which information about this folder is displayed:

- *Total number of folders, including subfolders*
- *Top 5 folders with the largest weight in descending order (path and size)*
- *Total number of files*
- *Number of configuration files (with .conf extension)*
- *Text files*
- *Executable files*
- *Logs (files with .log extension)*
- *Archives*
- *Symbolic links*
- *Top 10 files with the largest weight in descending order (path, size and type)*
- *Top 10 executable files with the largest weight in descending order (path, size and hash)*
- *Script execution time*
