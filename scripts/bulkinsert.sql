/*
================================
BULK INSERT, TRUNCATE, SELECT COUNT(*) procedure
================================
This script loads data all at once in bulk instead of row-by-row.  However, 
I got an error message and am no longer able to proceed in the project due to
there being some kind of issue going on with the files that the lecturer used.
I downloaded his files but the ones he's using are CSV but mine appears to be
an Excel file.  As such, my code logic is breaking because when I indicate .csv
at the end of the file path name in the FROM statement, I think this may be what
is causing the issue, but I am not sure exactly.  Will have to review later.

The TRUNCATE syntax allows for the entire table to be emptied, however, if BOTH
queries are executed together, the data is "resfreshed."  This means that any 
additional data added in to the source data system (the file pathway) can be added
into the bronze.crm_cust_info without also adding any duplicates.  If you run the 
BULK INSERT query by itself WITHOUT the TRUNCATE function, you will get duplicates 
in your data.  ***Run BOTH queries together to ensure your data is refreshed and up
to date.  

The SELECT COUNT statement serves as a quality check to ensure that there truly are 
no duplicates in your table that you are refreshing. 

*/

TRUNCATE TABLE bronze.crm_cust_info;

BULK INSERT bronze.crm_cust_info
FROM 'C:\Users\Kai Sutherland\OneDrive\Desktop\Microsoft Learning Materials\MultipleTables\SQL Materials\sql-data-warehouse-project\datasets\source_crm\cust_info'
WITH (
	FIRSTROW = 2,
	FIELDTERMINATOR = ',',
	TABLOCK
);

SELECT COUNT(*) * FROM bronze.crm_cust_info

/*Msg 208, Level 16, State 82, Line 5
Invalid object name 'bronze.crm_cust_info'.

Completion time: 2025-12-12T19:35:41.1238083-05:00

*/
