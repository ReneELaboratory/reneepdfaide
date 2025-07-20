@echo off
setlocal enabledelayedexpansion

REM Define the new password
set NEW_PASSWORD=123456@123

REM Specify the file containing usernames (e.g., userlist.txt)
set USER_FILE=userlist.txt

REM Check if the file exists
if not exist "%USER_FILE%" (
echo User file not found: %USER_FILE%
exit /b
)

REM Read each line (username) and update the password
for /f "delims=" %%u in (%USER_FILE%) do (
echo Updating password for user %%u...
net user "%%u" "%NEW_PASSWORD%" >nul 2>&1
if !errorlevel! EQU 0 (
echo Password updated successfully for %%u
) else (
echo Failed to update password for %%u (user may not exist or insufficient privileges)
)
)

echo All operations completed.
pause