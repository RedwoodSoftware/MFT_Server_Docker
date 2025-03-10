@echo off
SETLOCAL EnableDelayedExpansion
echo.
:: Title to describe the bat script
echo #############################################################################
echo This example demonstrates how to get domain statistics using the server API.
echo #############################################################################

:: set response code to check

set server000=000
set server200=200
set server204=204
set server404=404

:: Read from the user
set /p proto="Enter protocol:"
set /p jscapehost="Enter server REST host:"
set /p jscapemanagmentport="Enter server REST port:"
set /p uname="Enter username:"
set /p passwd="Enter password:"


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
echo Login success. Proceeding to add domain ...
echo.

:: Get CSRF token again
for /F %%x in ('curl.exe -s -k -b cookie1.txt -H "Content-type:application/json" %proto%://%jscapehost%:%jscapemanagmentport%/rest/management/csrf-token') do set csrftoken1=%%x

:: Get Domain Stats
curl.exe -s -k -b cookie1.txt -w "%%{http_code}\n" -o domainstats.txt -H "x-js-at: !csrftoken1!" -H "X-Requested-With: XMLHttpRequest" -H "accept: application/json" -H "Content-type:application/json" -X GET %proto%://%jscapehost%:%jscapemanagmentport%/rest/management/server/statistics/domains > response.txt

set /p domainStatsResponse=<response.txt 
if !domainStatsResponse! EQU %server200% (
echo See the statistics below .. 
echo.
echo.
echo.
type domainstats.txt
echo.
echo.
echo.
echo.
echo Response is saved to file domainstats.txt
echo.)
if !domainStatsResponse! EQU %server404% (echo Response Code : 404 unable to get the statistics..)
) else (echo. 
echo Login failed. Re-check rest username and password)
)

:: Logout from the server
curl.exe -s -k -b cookie1.txt -X POST %proto%://%jscapehost%:%jscapemanagmentport%/rest/management/logout

:: delete cookie
DEL cookie.txt cookie1.txt
IF exist response.txt DEL response.txt



