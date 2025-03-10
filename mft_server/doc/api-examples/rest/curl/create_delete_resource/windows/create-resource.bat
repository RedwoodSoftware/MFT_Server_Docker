@echo off
SETLOCAL EnableDelayedExpansion
echo.
:: Title to describe the bat script
echo ##################################################################################
echo This example demonstrates how to create a FTP network storage using the server API.
echo ##################################################################################

:: set response code to check

set server000=000
set server201=201
set server204=204
set server404=404
set server409=409
set server400=400

:: Read from the user
set /p proto="Enter protocol:"
set /p jscapehost="Enter server REST host:"
set /p jscapemanagmentport="Enter server REST port:"
set /p uname="Enter username:"
set /p passwd="Enter password:"
set /p domain="Enter domain name:"
set /p nsName="Enter network storage name:"
set /p nsHost="Enter network storage hostname:"
set /p nsPort="Enter network storage port:"
:start
echo "Select the network storage type:"
echo "1:regular" 
echo "2:explicit SSL" 
echo "3:implicit SSL"
set choice=
set /p choice=Choose the type.
if not '%choice%'=='' set choice=%choice:~0,1%
if '%choice%'=='1' goto regular
if '%choice%'=='2' goto explicit SSL
if '%choice%'=='3' goto implicit SSL
ECHO "%choice%" is not valid, try again
ECHO.
goto start
:regular
set type=regular
goto end
:explicit SSL
set type=explicit SSL
goto end
:implicit SSL
set type=implicit SSL
goto end
:end
echo Selected type is: %type%
set /p nsUsername="Enter network storage username:"
set /p nsPassword="Enter network storage password:"


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
echo Login success. Proceeding to create the resource ...
echo.

:: Get CSRF token again
for /F %%x in ('curl.exe -s -k -b cookie1.txt -H "Content-type:application/json" %proto%://%jscapehost%:%jscapemanagmentport%/rest/management/csrf-token') do set csrftoken1=%%x

:: Create ftp netowork storage
for /F %%G in ('curl.exe -s -k -b cookie1.txt -w "%%{http_code}\n" -o NUL -H "x-js-at: !csrftoken1!" -H "X-Requested-With: XMLHttpRequest" -H "accept: application/json" -H "Content-type:application/json" -X POST -d "{\"protocol\":\"FTP\",\"name\":\"%nsName%\",\"host\":\"%nsHost%\",\"port\":\"%nsPort%\",\"connectionType\":\"%type%\",\"username\":\"%nsUsername%\",\"password\":\"%nsPassword%\",\"passive\":true,\"usingCredentials\":false,\"timeout\":30,\"keyProvider\":null,\"logDirectory\":null,\"timeToLive\":null,\"remoteDirectory\":{\"@type\":\"REMOTE\"}}" %proto%://%jscapehost%:%jscapemanagmentport%/rest/management/network-storage/%domain%
') do set addResourceResponse=%%G
if !addResourceResponse! EQU %server409% (echo Resource already exists.. Try other name ..)
if !addResourceResponse! EQU %server201% (echo Resource created successfully..)
if !addResourceResponse! EQU %server404% (echo Response Code : 404 Resource creation failed, Recheck the parameters..)
if !addResourceResponse! EQU %server400% (echo Response Code : 400 Resource creation failed, Invalid parameters..)
) else (echo. 
echo Login failed. Re-check rest username and password)
)

:: Logout from the server
curl.exe -s -k -b cookie1.txt -X POST %proto%://%jscapehost%:%jscapemanagmentport%/rest/management/logout

:: delete cookie
DEL cookie.txt cookie1.txt



