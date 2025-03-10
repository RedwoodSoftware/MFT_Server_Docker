@echo off
SETLOCAL EnableDelayedExpansion
echo.
:: Title to describe the bat script
echo ###################################################################
echo This example demonstrates how to add a group using the server API.
echo ###################################################################

:: set response code to check

set server000=000
set server201=201
set server204=204
set server404=404
set server409=409

:: Read from the user
set /p proto="Enter protocol:"
set /p jscapehost="Enter server REST host:"
set /p jscapemanagmentport="Enter server REST port:"
set /p uname="Enter username:"
set /p passwd="Enter password:"
set /p domain="Enter domain name:"
set /p groupName="Enter group name e.g. Accountants:"
set /p virtualPath="Enter virtual path e.g. /group:"
set /p defaultDir="Enter default group directory e.g. C:\\home:"


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
echo Login success. Proceeding to add the group ...
echo.

:: Get CSRF token again
for /F %%x in ('curl.exe -s -k -b cookie1.txt -H "Content-type:application/json" %proto%://%jscapehost%:%jscapemanagmentport%/rest/management/csrf-token') do set csrftoken1=%%x

:: Add group
for /F %%G in ('curl.exe -s -k -b cookie1.txt -w "%%{http_code}\n" -o NUL -H "x-js-at: !csrftoken1!" -H "X-Requested-With: XMLHttpRequest" -H "accept: application/json" -H "Content-type:application/json" -X POST -d "{\"name\":\"%groupName%\",\"resources\":[{\"path\":\"%virtualPath%\",\"realPath\":\"%defaultDir%\",\"accessPermissions\":{\"fileDownloadingAllowed\":true,\"fileUploadingAllowed\":true,\"fileDeletionAllowed\":true,\"fileAppendingAllowed\":true,\"fileListingAllowed\":true,\"fileRenamingAllowed\":true,\"directoriesListingAllowed\":true,\"directoryMakingAllowed\":true,\"directoryDeletionAllowed\":true,\"subdirectoriesBrowsingAllowed\":true},\"secured\":false,\"denied\":false,\"indexable\":true,\"createIfNotExists\":true,\"pgpEncryption\":{\"keyProvider\":{\"file\":\"/.pgp/key.pub\",\"filePassword\":\"\"},\"enabled\":false},\"dataLossPrevention\":{\"rules\":[],\"enabled\":false}}]}" %proto%://%jscapehost%:%jscapemanagmentport%/rest/management/groups/%domain%
') do set addGrpResponse=%%G
if !addGrpResponse! EQU %server409% (echo Group already exists .. Try other name ..)
if !addGrpResponse! EQU %server201% (echo Group created successfully..)
if !addGrpResponse! EQU %server404% (echo Response Code : 404 Group creation failed, Recheck the parameters..)
) else (echo. 
echo Login failed. Re-check rest username and password)
)

:: Logout from the server
curl.exe -s -k -b cookie1.txt -X POST %proto%://%jscapehost%:%jscapemanagmentport%/rest/management/logout

:: delete cookie
DEL cookie.txt cookie1.txt



