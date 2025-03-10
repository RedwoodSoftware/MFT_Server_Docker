@echo off
SETLOCAL EnableDelayedExpansion
echo.
:: Title to describe the bat script
echo ##################################################################
echo This example demonstrates how to delete a monitor the server API.
echo ##################################################################

:: set response code to check

set server000=000
set server204=204
set server404=404

:: Read from the user
set /p proto="Enter protocol:"
set /p jscapehost="Enter server REST host:"
set /p jscapemanagmentport="Enter server REST port:"
set /p uname="Enter username:"
set /p passwd="Enter password:"
set /p domain="Enter domain name:"
set /p dirMonName="Enter directory monitor name:"


:: Get CSRF token
for /F %%x in ('curl.exe -s -k -c cookie.txt -L -H "Content-type:application/json" %proto%://%jscapehost%:%jscapemanagmentport%/rest/management/csrf-token') do set csrftoken=%%x

:: Login into the server
for /F %%I in ('curl.exe -k -b cookie.txt -c cookie1.txt -w "%%{http_code}\n" -o NUL -s -H "x-js-at:%csrftoken%" -H "X-Requested-With: XMLHttpRequest" -H "Content-type:application/json" -X POST -d "{\"username\":\"%uname%\", \"password\":\"%passwd%\"}" %proto%://%jscapehost%:%jscapemanagmentport%/rest/management/login') do set loginResponse=%%I


:: Check server reachable
if %loginResponse% EQU %server000% (
echo.
echo Could not connect to the server..) else (
:: Login Success execution
if %loginResponse% EQU %server204% (
echo.
echo Login success. Proceeding to delete the monitor ...
echo.

:: Get CSRF token again
for /F %%x in ('curl.exe -s -k -b cookie1.txt -H "Content-type:application/json" %proto%://%jscapehost%:%jscapemanagmentport%/rest/management/csrf-token') do set csrftoken1=%%x

:: Check if monitor exists
for /F %%h in ('curl.exe -s -k -b cookie1.txt -w "%%{http_code}\n" -o NUL -H "x-js-at: !csrftoken1!" -H "X-Requested-With: XMLHttpRequest" -H "accept: application/json" -H "Content-type:application/json" %proto%://%jscapehost%:%jscapemanagmentport%/rest/management/directory-monitors/%domain%/%dirMonName%
') do set isDirMonAvailableResponse=%%h

if !isDirMonAvailableResponse! EQU %server404% (echo Response code 404. Monitor deletion failed .. Invalid Monitor or domain name..)else (
:: Remove directory monitor
for /F %%G in ('curl.exe -s -k -b cookie1.txt -w "%%{http_code}\n" -o NUL -H "x-js-at: !csrftoken1!" -H "X-Requested-With: XMLHttpRequest" -H "accept: application/json" -H "Content-type:application/json" -X DELETE %proto%://%jscapehost%:%jscapemanagmentport%/rest/management/directory-monitors/%domain%/%dirMonName%
') do set delDirMonResponse=%%G

if !delDirMonResponse! EQU %server204% (echo Monitor deleted successfully..)
if !delDirMonResponse! EQU %server404% (echo Monitor deletion failed..)
)
)else (
echo. 
echo Login failed. Re-check rest username and password
)
)

:: Logout from the server
curl.exe -s -k -b cookie1.txt -X POST %proto%://%jscapehost%:%jscapemanagmentport%/rest/management/logout

:: delete cookie
DEL cookie.txt cookie1.txt



