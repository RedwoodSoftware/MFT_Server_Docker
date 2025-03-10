@echo off
SETLOCAL EnableDelayedExpansion
echo.
:: Title to describe the bat script
echo ##########################################################################
echo This example demonstrates how to upload a file using the client REST API.
echo ##########################################################################

:: set response code to check

set server000=000
set server200=200
set server204=204
set server404=404

:: Read from the user
set /p proto="Enter protocol:"
set /p jscapehost="Enter server host:"
set /p jscapeclientport="Enter server port:"
set /p uname="Enter username:"
set /p passwd="Enter password:"
set /p domain="Enter domain name:"
set /p remotePath="Enter remote file path e.g /:"
set /p localpath="Enter local file path e.g c:\test\test1.txt :"

:: Login into the server
for /F %%I in ('curl.exe -s -k -c cookie.txt -w "%%{http_code}\n" -o NUL -H "Content-type:application/json" -X POST -d "{\"domain\":\"%domain%\",\"username\":\"%uname%\",\"password\":\"%passwd%\"}" %proto%://%jscapehost%:%jscapeclientport%/rest/login
') do set loginResponse=%%I

:: Check server reachable
if %loginResponse% EQU %server000% (
echo.
echo Could not connect to the server..) else (
:: Login Success execution
if %loginResponse% EQU %server204% (
echo.
echo Login success. Proceeding to upload the file...
echo.

:: Get CSRF token to a file
for /F %%x in ('curl.exe -s -k -b cookie.txt -H "Content-type:application/json" %proto%://%jscapehost%:%jscapeclientport%/rest/csrf-token') do set csrftokenResponse=%%x

:: File upload
curl.exe -s -k -b cookie.txt -w "%%{http_code}\n" -H "x-js-at: !csrftokenResponse!" -H "X-Requested-With: XMLHttpRequest" -H "accept: */*" -H "Content-Type: multipart/form-data" -X PUT -F "data=@%localpath%" %proto%://%jscapehost%:%jscapeclientport%/rest/files?directory=%remotePath% > response.txt

set /p upLoadFileResponse=<response.txt

if !upLoadFileResponse! EQU %server204% (echo File uploaded successfully..)
if !upLoadFileResponse! EQU %server404% (echo Response Code : 404 file upload failed, Recheck the parameters..)
)else (echo. 
echo Login failed. Re-check username and password)
)

:: Logout from the server
curl.exe -s -k -b cookie.txt -o NUL -X POST %proto%://%jscapehost%:%jscapeclientport%/rest/logout

:: delete cookie and response
DEL cookie.txt
IF exist response.txt DEL response.txt



