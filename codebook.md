==================================================================
Human Activity Recognition Using Smartphones Dataset
Version 1.0
==================================================================
CODEBOOK (codebook.md)

 - INTRODUCTION
 - DATASET description
 - PROCESS EXPLANATION
 - DATASET ENTITY DESCRIPTION

==================================================================
--- INTRODUCTION ---

Instruction on how to read the file Project_GCD_TidyData_HumanActivityReconition.txt
and which steps have been used to get it.




--- DATASET DESCRIPTION ---

The tidy dataset has 70 columns where
first four column are dimentions, while the remaing are measures value only as mean of std

------------------------------------------------------------------------------------------ 	
SESSION : {TRAINING, TEST} identify if row data is Training or Test
SUBJECTID : {1..30} identify the Volunteers by ID
ACTIVITYID : {1..6} identify the Activity by ID
ACTIVITYNAME : {####} Activity by short description i.e. WALKING, SITTING
V[1]_xxxx  : measures where xxxx if the value of the function used	 
...
...
V[n]_xxx : measures where xxxx if the value of the function used
------------------------------------------------------------------------------------------ 	


--- PROCESS EXPLANATION ---

The process used to get the tidy dataset go through 5 steps:

 1. Dataset acquisition from flat files. The soucing files are 8:

    (DS1) = features
    (DS2) = measures for TRAINING session
    (DS3) = measures for TEST session
    (DS4) = subject for TRAINING
    (DS5) = subject for TEST
    (DS6) = activity ID for TRAINING  	 	
    (DS7) = activity ID	for TEST
    (DS8) = activity name by activity ID

2. Merging and Join in 2 separate datase, TRAINING and TEST

3. Selection of the Mean and Std features for TRAING and TEST dataset

4. Join of TRAINING and TEST

5. FIle output generation


--- DATASET ENTITY DESCRIPTION ---

AT the end the final Dataset correspoding to the tidy dataset is based on the following schema:


			DS1 (Features)
   R2 (Training Label -	DS2 (meas. Training) - DS4 (subject TRAINING) - DS7 (Activity TRAINING) - DS8 (Activity Name)	 
   R3 (Test Label)    - DS3 (meas. Test)     - DS5 (subject TEST)     - DS7 (Activity TEST)     - DS8 (Activity Name)



   		 
