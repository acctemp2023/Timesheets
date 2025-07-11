Overview: The Timesheets application is a Python script designed to streamline the process of consolidating timesheet data from several departments into a single Excel workbook. It automates data aggregation, error detection, and validation to ensure accuracy.

Key Functionality:

Data Consolidation - 
• Scrapes and processes timesheet data from network .csv files without altering the live network files.
• Moves processed "snapshot" files to a new directory

Error Detection - 
• Identifies blank or missing cells in all .csv files
• Displays offending rows for each file to the user via terminal
• Detects duplicate 'Collection Codes' using a local validation module
• Reports duplicates to management for manual correction in source files

Collection Code Validation - 
• Uses Master_Codes_timesheets.csv as the sole source of truth for approved Collection Codes
• Validates all department .csv exports against Master_Codes_timesheets.csv

It also reports unauthorized Collection Codes, including row locations & descriptions to the user in the terminal as well as generate an exception list “approved_codes_result.csv”

Usage Notes:
Users must manually correct the various errors discovered — in the live source files.
The script will continue to prompt corrections until all errors are resolved
Master_Codes_timesheets.csv must be maintained by Upper Management as the authoritative source for valid Collection Codes
This application ensures Timesheet accuracy/data consolidation while minimizing the time involved to manually audit & maintain data integrity across the many departments. It will also be utilized and/or integrated with future script(s) for allocations & redistributions of labor costs



  
