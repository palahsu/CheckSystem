@echo off
echo Checking your system info, Please waiting...
systeminfo | findstr /c:"Host Name"
systeminfo | findstr /c:"Domain"
systeminfo | findstr /c:"OS Name"
systeminfo | findstr /c:"OS Version"
systeminfo | findstr /c:"System Manufacturer"
systeminfo | findstr /c:"System Model"
systeminfo | findstr /c:"System type"
systeminfo | findstr /c:"Total Physical Memory"
ipconfig | findstr IPv4

echo.

echo Hard Drive Space:
wmic diskdrive get size

echo.
echo Check Full Diagnostic Tool:
dxdiag /t dxdiag.txt
if exist dxdiag.txt (echo File exists & type dxdiag.txt >> fullreport.txt) else echo File Does Not Exist & goto end
if exist fullreport.txt echo File Safely appended to fullreport.txt
:end

echo Service Tag:
wmic bios get serialnumber
echo.
echo CPU:
wmic cpu get name

echo Task Completed!

pause