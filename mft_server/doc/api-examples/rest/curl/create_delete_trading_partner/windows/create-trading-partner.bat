@echo off
SETLOCAL EnableDelayedExpansion
echo.
:: Title to describe the bat script
echo ######################################################################################
echo This example demonstrates how to create a trading partner (FTP) using the server API.
echo ######################################################################################

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
set /p tpName="Enter trading partner name:"
set /p tpHost="Enter trading partner host (FTP):"
set /p tpPort="Enter trading partner port (FTP):"
set /p tpUsername="Enter trading partner username (FTP):"
set /p tpPassword="Enter trading partner password (FTP):"

:: Set time in millseconds
set mls=%time:~9,2%

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
echo Login success. Proceeding to create the partner ...
echo.

:: Get CSRF token again
for /F %%x in ('curl.exe -s -k -b cookie1.txt -H "Content-type:application/json" %proto%://%jscapehost%:%jscapemanagmentport%/rest/management/csrf-token') do set csrftoken1=%%x

:: Create trading partner -- FTP
curl.exe -s -k -b cookie1.txt -w "%%{http_code}\n" -o NUL -H "x-js-at: !csrftoken1!" -H "X-Requested-With: XMLHttpRequest" -H "accept: application/json" -H "Content-type:application/json" -X POST -d "{\"name\":\"%tpName%\",\"company\":null,\"email\":\"\",\"proxyData\":null,\"protocol\":\"FTP\",\"url\":\"\",\"host\":\"%tpHost%\",\"port\":%tpPort%,\"tcpNoDelayEnabled\":true,\"connectionType\":null,\"username\":\"%tpUsername%\",\"password\":\"%tpPassword%\",\"domain\":null,\"keyProvider\":null,\"hostKeyProvider\":null,\"encryptionRequired\":false,\"aftpData\":null,\"agentData\":null,\"amazonS3Data\":null,\"amazonAwsData\":null,\"as2Data\":null,\"ftpData\":{\"postLoginCommand\":\"\",\"passiveTransferModeRequired\":false,\"epsvCommandAllowed\":false},\"imapData\":null,\"oftpData\":null,\"pop3Data\":null,\"sftpData\":null,\"smtpData\":null,\"splunkHttpData\":null,\"s3CompatibleData\":{\"endPoint\":\"\",\"region\":null},\"tags\":[],\"creationDate\":%mls%,\"version\":1,\"timeout\":30000,\"boxData\":null,\"dropboxData\":null,\"googleStorageData\":null,\"googleCloudData\":null,\"googleDriveData\":null,\"ibmCloudData\":null,\"microsoftAzureFileStorageData\":null,\"microsoftAzureBlobStorageData\":null,\"microsoftAzureDataLakeData\":null,\"microsoftAzureDataLake2Data\":null,\"microsoftOneDriveData\":null}" %proto%://%jscapehost%:%jscapemanagmentport%/rest/management/trading-partners/%domain% > response.txt

set /p addTpResponse=<response.txt 
if !addTpResponse! EQU %server409% (echo Trading Partner already exists .. Try other name..)
if !addTpResponse! EQU %server201% (echo Trading partner created successfully..)
if !addTpResponse! EQU %server404% (echo Response Code : 404 Trading partner creation failed, Recheck the parameters..)
if !addTpResponse! EQU %server400% (echo Response Code : 400 Trading partner creation failed, Invalid parameters or trading partner name already exists..)
) else (echo. 
echo Login failed. Re-check rest username and password)
)

:: Logout from the server
curl.exe -s -k -b cookie1.txt -X POST %proto%://%jscapehost%:%jscapemanagmentport%/rest/management/logout

:: delete cookie
DEL cookie.txt cookie1.txt
IF exist response.txt DEL response.txt



