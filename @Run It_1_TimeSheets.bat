REM #START
@echo off

REM #create & map temp drive to T:\
net use T: \\public.playoff.com\Public /persistent:no
IF ERRORLEVEL 1 (
    ECHO Failed to map drive. Drive may already be in use.
    EXIT /B 1
)

REM #change the working dir to the script's dir
cd /d T:\Dept-Accounting\z_scriptBeta\2.5_Timesheets\_py_scripts
IF ERRORLEVEL 1 (
    ECHO Failed to change directory. Ensure the path exists.
    net use I: /delete
    EXIT /B 1
)

REM #run it
python main.py
IF ERRORLEVEL 1 (
    ECHO Script execution failed.
    ECHO Press any key to continue...
    pause >nul
)

REM #disconnect & remove temp drive T:\
net use T: /delete
IF ERRORLEVEL 1 (
    ECHO Failed to disconnect drive. Please check manually.
)

REM #END
ECHO Script completed. Press any key to close...
pause >nul