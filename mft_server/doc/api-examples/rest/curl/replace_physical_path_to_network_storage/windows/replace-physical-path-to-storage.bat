@echo off
SETLOCAL EnableDelayedExpansion
echo.
:: Title to describe the bat script
echo ##########################################################################################################
echo This example demonstrates how to replace a physical path with network storage for user accounts and groups.
echo ##########################################################################################################

:: set response code to check

set server000=000
set server200=200
set server201=201
set server204=204
set server404=404
set server409=409
set successcode=0
set failurecode=1

:: Read from the user
echo #######################
echo Enter Basic Parameters
echo ######################
set /p proto="Enter protocol:"
set /p jscapehost="Enter server REST host:"
set /p jscapemanagmentport="Enter server REST port:"
set /p uname="Enter REST username:"
set /p passwd="Enter REST password:"
:start
echo Select the OS where physical path exists, To modify default path press 1 for other select the OS.
echo.
echo 1.Default path -- %%installdir%%/users/%%domain%%/%%username%% 
echo 2.Windows
echo 3.Linux
set choice=
set /p choice=Choose the OS.
if not '%choice%'=='' set choice=%choice:~0,1%
if '%choice%'=='1' goto defaultpath
if '%choice%'=='2' goto windows
if '%choice%'=='3' goto linux
ECHO "%choice%" is not valid, try again
ECHO.
goto start
:defaultpath
set "dpath=%%installdir%%/users/%%domain%%/%%username%%"
set isdefault=0
goto end
:windows
set OS=Windows
set isdefault=1
set /p ppath="Enter the physical path to replace: eg 1; c:\test\test2 eg 2: c:\test\test3\ :"
echo %ppath% | findstr /R "^[A-Z]:\\.*$" > nul
if %errorlevel% equ 1 (
echo "Invalid path .. "
goto windows
) else goto end
:linux
set OS=Linux
set isdefault=1
set /p ppath="Enter the physical path to replace: eg 1; /Users/test eg 2; /Users/test1/test2/ :"
echo %ppath% | findstr /R "^\/.*$" > nul
if %errorlevel% equ 1 (
echo "Invalid path .. "
goto linux
) else goto end
:end

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
echo Login success. Proceeding to domain and storage data input ...
echo.

:: Get CSRF token again
for /F %%x in ('curl.exe -s -k -b cookie1.txt -H "Content-type:application/json" %proto%://%jscapehost%:%jscapemanagmentport%/rest/management/csrf-token') do set csrftoken1=%%x


:domain
set /p domain="Enter domain name:"
echo.

:: Check if domain exists 
for /F %%g in ('curl.exe -s -k -b cookie1.txt -w "%%{http_code}\n" -o NUL -H "x-js-at: !csrftoken1!" -H "X-Requested-With: XMLHttpRequest" -H "accept: application/json" -H "Content-type:application/json" -X GET %proto%://%jscapehost%:%jscapemanagmentport%/rest/management/domains/!domain!') do set domainStatsResponse=%%g

if !domainStatsResponse! EQU %server404% (
echo Domain does not exist, enter valid name ..
echo. 
goto domain)

:storage
set /p nsname="Enter network storage name:"
echo.

:: Check if storage exists 
for /F %%g in ('curl.exe -s -k -b cookie1.txt -w "%%{http_code}\n" -o NUL -H "x-js-at: !csrftoken1!" -H "X-Requested-With: XMLHttpRequest" -H "accept: application/json" -H "Content-type:application/json" -X GET %proto%://%jscapehost%:%jscapemanagmentport%/rest/management/reverse-proxies/!domain!/!nsname!') do set nsStatsResponse=%%g

if !nsStatsResponse! EQU %server404% (
echo Network storage does not exist, enter valid name ..
echo. 
goto storage)

if !domainStatsResponse! EQU %server200% (
if !nsStatsResponse! EQU %server200% (

::get all accounts and save it to a file
for /F %%a in ('curl.exe -s -k -b cookie1.txt -w "%%{http_code}\n" -o accounts.txt -H "x-js-at: !csrftoken1!" -H "X-Requested-With: XMLHttpRequest" -H "accept: application/json" -H "Content-type:application/json" -X GET %proto%://%jscapehost%:%jscapemanagmentport%/rest/management/account-service/!domain!/names') do set getAccountsResponse=%%a



if !getAccountsResponse! EQU %server200% (

echo ##########################################################
echo ---- Accounts Module Start ----
echo ##########################################################
echo.


set /p accounts=<accounts.txt
set formatted_accounts=!accounts:[=! 
set formatted_accounts=!formatted_accounts:]=!
set formatted_accounts=!formatted_accounts:"=!

call :parse "!formatted_accounts!"
echo ##########################################################
echo ---- Accounts Module End ----
echo ##########################################################
call :groups
call :logout
goto :eof

:parse
setlocal
set list=%~1
for /F "tokens=1* delims=," %%f in ("%list%") do (
    rem if the item exist
    if not "%%f" == "" call :getAccountLogin %%f
    rem if next item exist
    if not "%%g" == "" call :parse "%%g"
)
endlocal
goto :eof

:getAccountLogin
setlocal enabledelayedexpansion
for /F %%b in ('curl.exe -s -k -b cookie1.txt -w "%%{http_code}\n" -o accountLogin.json -H "x-js-at: !csrftoken1!" -H "X-Requested-With: XMLHttpRequest" -H "accept: application/json" -H "Content-type:application/json" -X GET %proto%://%jscapehost%:%jscapemanagmentport%/rest/management/accounts/!domain!/%1') do set getAccountResponse=%%b

if !getAccountResponse! EQU %server200% (
if %isdefault% EQU 1 (
set FORMATED_PATH=!ppath:\=\\\\!
)
if %isdefault% EQU 0 (
set FORMATED_PATH=!dpath!
)
>NUL findstr /i "realpath\":\"!FORMATED_PATH!\"" accountLogin.json
if !errorlevel! EQU %successcode% (

powershell -Command "(gc accountLogin.json) -replace 'realPath\":\"!FORMATED_PATH!\"','name\":\"%nsname%\"' | Out-File -encoding ASCII updated.json"

for /F %%i in ('curl.exe -s -k -b cookie1.txt -w "%%{http_code}\n" -o NUL -H "x-js-at: !csrftoken1!" -H "X-Requested-With: XMLHttpRequest" -H "accept: application/json" -H "Content-type:application/json" -X PUT -d @updated.json %proto%://%jscapehost%:%jscapemanagmentport%/rest/management/accounts/!domain!/%1') do set getAccountUpdateResponse=%%i

if !getAccountUpdateResponse! EQU %server200% (
echo Account %1 has been updated successfully..
DEL updated.json
)

)
if !errorlevel! EQU %failurecode% (
echo Account %1 is skipped .. as no matching found for the input path..
)
)
IF EXIST accountLogin.json DEL accountLogin.json
goto :eof
)
)

:groups
::get all groups and save it to a file
for /F %%a in ('curl.exe -s -k -b cookie1.txt -w "%%{http_code}\n" -o groups.txt -H "x-js-at: !csrftoken1!" -H "X-Requested-With: XMLHttpRequest" -H "accept: application/json" -H "Content-type:application/json" -X GET %proto%://%jscapehost%:%jscapemanagmentport%/2/rest/management/domains/!domain!/group-names') do set getGroupsResponse=%%a
if !getGroupsResponse! EQU %server200% (

echo ##########################################################
echo ---- Groups Module Start ----
echo ##########################################################
echo.

set /p groups=<groups.txt
set formatted_groups=!groups:[=! 
set formatted_groups=!formatted_groups:]=!
set formatted_groups=!formatted_groups:"=!

call :parsegroup "!formatted_groups!
echo ##########################################################
echo ---- Groups Module End ----
echo ##########################################################
echo.
goto :eof

:parsegroup
setlocal
set list=%~1
for /F "tokens=1* delims=," %%f in ("%list%") do (
    rem if the item exist
    if not "%%f" == "" call :getgroup %%f
    rem if next item exist
    if not "%%g" == "" call :parsegroup "%%g"
)
endlocal
goto :eof

:getgroup
setlocal enabledelayedexpansion
for /F %%b in ('curl.exe -s -k -b cookie1.txt -w "%%{http_code}\n" -o groupinfo.json -H "x-js-at: !csrftoken1!" -H "X-Requested-With: XMLHttpRequest" -H "accept: application/json" -H "Content-type:application/json" -X GET %proto%://%jscapehost%:%jscapemanagmentport%/rest/management/groups/!domain!/%1') do set getGroupResponse=%%b
if !getGroupResponse! EQU %server200% (
if %isdefault% EQU 1 (
set FORMATED_PATH=!ppath:\=\\\\!
)
if %isdefault% EQU 0 (
set FORMATED_PATH=!dpath!
)
>NUL findstr /i "realpath\":\"!FORMATED_PATH!\"" groupinfo.json

if !errorlevel! EQU %successcode% (
powershell -Command "(gc groupinfo.json) -replace 'realPath\":\"!FORMATED_PATH!\"','name\":\"%nsname%\"' | Out-File -encoding ASCII updatedgroupinfo.json"

for /F %%i in ('curl.exe -s -k -b cookie1.txt -w "%%{http_code}\n" -o NUL -H "x-js-at: !csrftoken1!" -H "X-Requested-With: XMLHttpRequest" -H "accept: application/json" -H "Content-type:application/json" -X PUT -d @updatedgroupinfo.json %proto%://%jscapehost%:%jscapemanagmentport%/rest/management/groups/!domain!/%1') do set getGroupUpdateResponse=%%i

if !getGroupUpdateResponse! EQU %server200% (
echo Group %1 has been updated successfully..
DEL updatedgroupinfo.json
)
)
if !errorlevel! EQU %failurecode% (
echo Group %1 is skipped .. as no matching found for the input path..
)
)
IF exist groupinfo.json DEL groupinfo.json
goto :eof
)

goto :eof
)
) else (echo. 
echo Login failed. Re-check rest username and password)
)

:logout
:: Logout from the server
curl.exe -s -k -b cookie1.txt -X POST %proto%://%jscapehost%:%jscapemanagmentport%/rest/management/logout

:: delete cookies and processing files
DEL cookie.txt cookie1.txt
IF exist response.txt DEL response.txt
IF exist accounts.txt DEL accounts.txt
IF exist groups.txt   DEL groups.txt
goto :eof



