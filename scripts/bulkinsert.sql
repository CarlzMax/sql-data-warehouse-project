/*
================================
BULK INSERT procedure
================================
This script loads data all at once in bulk instead of row-by-row.  However, 
I got an error message and am no longer able to proceed in the project due to
there being some kind of issue going on with the files that the lecturer used.
I downloaded his files but the ones he's using are CSV but mine appears to be
an Excel file.  As such, my code logic is breaking because when I indicate .csv
at the end of the file path name in the FROM statement, I think this may be what
is causing the issue, but I am not sure exactly.  Will have to review later.

*/


BULK INSERT bronze.crm_cust_info
FROM 'C:\Users\Kai Sutherland\OneDrive\Desktop\Microsoft Learning Materials\MultipleTables\SQL Materials\sql-data-warehouse-project\datasets\source_crm\cust_info'
WITH (
	FIRSTROW = 2,
	FIELDTERMINATOR = ',',
	TABLOCK
);


/*Msg 208, Level 16, State 82, Line 5
Invalid object name 'bronze.crm_cust_info'.

Completion time: 2025-12-12T19:35:41.1238083-05:00

*/
