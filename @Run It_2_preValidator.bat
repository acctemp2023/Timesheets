REM #START
@echo off

REM #create & map temp drive to U:\
net use U: \\public.playoff.com\Public /persistent:no
IF ERRORLEVEL 1 (
    ECHO Failed to map drive. Drive may already be in use.
    EXIT /B 1
)

REM #change the working dir to the script's dir
cd /d U:\Dept-Accounting\z_scriptBeta\2.5_Timesheets\_py_scripts
IF ERRORLEVEL 1 (
    ECHO Failed to change directory. Ensure the path exists.
    net use I: /delete
    EXIT /B 1
)

REM #run it
python pre_VALIDATOR.py
IF ERRORLEVEL 1 (
    ECHO Script execution failed.
    ECHO Press any key to continue...
    pause >nul
)

REM #disconnect & remove temp drive U:\
net use U: /delete
IF ERRORLEVEL 1 (
    ECHO Failed to disconnect drive. Please check manually.
)

REM #END
ECHO Script completed. Press any key to close...
pause >nul