@echo off
SETLOCAL EnableDelayedExpansion
echo.
:: Title to describe the bat script
echo #####################################################################
echo This example demonstrates how to add a domain using the server API.
echo #####################################################################

:: set response code to check

set server000=000
set server204=204
set server404=404
set server409=409

:: Read from the user
set /p proto="Enter protocol:"
set /p jscapehost="Enter server REST host:"
set /p jscapemanagmentport="Enter server REST port:"
set /p uname="Enter username:"
set /p passwd="Enter password:"
set /p domain="Enter domain name to add:"
set /p description="Enter description for the domain:"

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

:: Add domain
for /F %%G in ('curl.exe -s -k -b cookie1.txt -w "%%{http_code}\n" -o NUL -H "x-js-at: !csrftoken1!" -H "X-Requested-With: XMLHttpRequest" -H "accept: application/json" -H "Content-type:application/json" -X PUT -d "{\"name\":\"%domain%\",\"description\":\"%description%\",\"services\":[{\"version\":0}]}" %proto%://%jscapehost%:%jscapemanagmentport%/rest/management/domains
') do set addDomainResponse=%%G
if !addDomainResponse! EQU %server409% (echo Domain already exists.. Try other name....)
if !addDomainResponse! EQU %server204% (echo Domain added successfully..)
if !addDomainResponse! EQU %server404% (echo Response Code : 404 add domain failed, Recheck the parameters..)
) else (echo. 
echo Login failed. Re-check rest username and password)
)

:: Logout from the server
curl.exe -s -k -b cookie1.txt -X POST %proto%://%jscapehost%:%jscapemanagmentport%/rest/management/logout

:: delete cookie
DEL cookie.txt cookie1.txt



