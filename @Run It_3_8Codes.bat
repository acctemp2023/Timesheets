REM #START
@echo off

REM #create & map temp drive to V:\
net use V: \\public.playoff.com\Public /persistent:no
IF ERRORLEVEL 1 (
    ECHO Failed to map drive. Drive may already be in use.
    EXIT /B 1
)

REM #change the working dir to the script's dir
cd /d V:\Dept-Accounting\z_scriptBeta\2.5_Timesheets\_py_scripts
IF ERRORLEVEL 1 (
    ECHO Failed to change directory. Ensure the path exists.
    net use I: /delete
    EXIT /B 1
)

REM #run it
python blockchain_realloactions_just8s.py
IF ERRORLEVEL 1 (
    ECHO Script execution failed.
    ECHO Press any key to continue...
    pause >nul
)

REM #disconnect & remove temp drive V:\
net use V: /delete
IF ERRORLEVEL 1 (
    ECHO Failed to disconnect drive. Please check manually.
)

REM #END
ECHO Script completed. Press any key to close...
pause >nul