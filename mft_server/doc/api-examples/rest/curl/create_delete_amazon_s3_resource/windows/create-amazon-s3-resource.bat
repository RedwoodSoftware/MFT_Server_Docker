@echo off
SETLOCAL EnableDelayedExpansion
echo.
:: Title to describe the bat script
echo ########################################################################################
echo This example demonstrates how to create a Amazon S3 network storage using the server API.
echo ########################################################################################

:: set response code to check

set server000=000
set server201=201
set server204=204
set server404=404
set server409=409
set server400=400

:: Read from the user

ECHO.
ECHO ################
ECHO Basic Parameters
ECHO ################
ECHO.

set /p proto="Enter protocol:"
set /p jscapehost="Enter server REST host:"
set /p jscapemanagmentport="Enter server REST port:"
set /p uname="Enter REST username:"
set /p passwd="Enter REST password:"
set /p domain="Enter domain name:"
set /p nsName="Enter network storage name:"

ECHO.
ECHO ###########################
ECHO Select Authentication Type
ECHO ###########################
ECHO.

:: Choose authentication type
:start
echo 1:CREDENTIALS
echo 2:IAM_ROLE 
set choice=
set /p choice=Choose the type.
if not '%choice%'=='' set choice=%choice:~0,1%
if '%choice%'=='1' goto credentials
if '%choice%'=='2' goto iam_role
ECHO "%choice%" is not valid, try again
ECHO.
goto start
:credentials
set aType=Credentials
goto end
:iam_role
set aType=IAM_Role
goto end
:end
echo Selected type is: %aType%
if '%aType%' == 'Credentials' (
set /p s3Key="Enter S3 Key:"
set /p s3Password="Enter S3 Password:")

ECHO.
ECHO #############
ECHO Choose Region
ECHO #############
ECHO.

:: Choose region
:chooseregion
echo 1:AWS GovCloud (US)
echo 2:US East (Ohio)
echo 3:US East (N. Virginia)
echo 4:US West (N. California)
echo 5:US West (Oregon)
echo 6:Asia Pacific (Mumbai)
echo 7:Asia Pacific (Seoul)
echo 8:Asia Pacific (Singapore)
echo 9:Asia Pacific (Sydney)
echo 10:Asia Pacific (Tokyo)
echo 11:Canada (Central)
echo 12:Europe (Frankfurt)
echo 13:Europe (Ireland)
echo 14:Europe (London)
echo 15:Europe (Paris)
echo 16:South America (São Paulo)
echo 17:China (Beijing)
echo 18:China (Ningxia)
set /p choice=Choose the type.
if not '%choice%'=='' set choice=%choice:~0,17%
if '%choice%'=='1' goto aws-gov-cloud-us
if '%choice%'=='2' goto us-east-ohio
if '%choice%'=='3' goto us-east-n-virginia
if '%choice%'=='4' goto us-west-n-california
if '%choice%'=='5' goto us-west-orgeon
if '%choice%'=='6' goto asia-pacific-mumbai
if '%choice%'=='7' goto asia-pacific-seoul
if '%choice%'=='8' goto asia-pacific-singapore
if '%choice%'=='9' goto asia-pacific-sydney
if '%choice%'=='10' goto asia-pacific-tokyo
if '%choice%'=='11' goto canada-central
if '%choice%'=='12' goto europe-frankfurt
if '%choice%'=='13' goto europe-ireland
if '%choice%'=='14' goto europe-london
if '%choice%'=='15' goto europe-paris
if '%choice%'=='16' goto sa-sao-paulo
if '%choice%'=='17' goto cn-beijing
if '%choice%'=='18' goto cn-ningxia
ECHO "%choice%" is not valid, try again
ECHO.
goto chooseregion
:aws-gov-cloud-us
set Cregion=us-gov-west-1
goto end
:us-east-ohio
set Cregion=us-east-2
goto end
:us-east-n-virginia
set Cregion=us-east-1
goto end
:us-west-n-california
set Cregion=us-west-1
goto end
:us-west-orgeon
set Cregion=us-west-2
goto end
:asia-pacific-mumbai
set Cregion=ap-south-1
goto end
:asia-pacific-seoul
set Cregion=ap-northeast-2
goto end
:asia-pacific-singapore
set Cregion=ap-southeast-1
goto end
:asia-pacific-sydney
set Cregion=ap-southeast-2
goto end
:asia-pacific-tokyo
set Cregion=ap-northeast-1
goto end
:canada-central
set Cregion=ca-central-1
goto end
:europe-frankfurt
set Cregion=eu-central-1
goto end
:europe-ireland
set Cregion=eu-west-1
goto end
:europe-london
set Cregion=eu-west-2
goto end
:europe-paris
set Cregion=eu-west-3
goto end
:sa-sao-paulo
set Cregion=sa-east-1
goto end
:cn-beijing
set Cregion=cn-north-1
goto end
:cn-ningxia
set Cregion=cn-northwest-1
goto end
:end
echo Selected region is: %cRegion%

ECHO.
ECHO #################
ECHO Remote Directory
ECHO #################
ECHO.

set /p remoteDir="Enter Remote Directory:"


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
echo Login success. Proceeding to create the amazon s3 resource ...
echo.

:: Get CSRF token again
for /F %%x in ('curl.exe -s -k -b cookie1.txt -H "Content-type:application/json" %proto%://%jscapehost%:%jscapemanagmentport%/rest/management/csrf-token') do set csrftoken1=%%x

:: Create amazon s3 netowork storage
for /F %%G in ('curl.exe -s -k -b cookie1.txt -o NUL -w "%%{http_code}\n" -H "x-js-at: !csrftoken1!" -H "X-Requested-With: XMLHttpRequest" -H "accept: application/json" -H "Content-type:application/json" -X POST -d "{\"protocol\":\"AmazonS3\",\"name\":\"%nsName%\",\"encryptionType\":\"NONE\",\"kmsKeyId\":null,\"username\":\"%s3Key%\",\"password\":\"%s3Password%\",\"authenticationType\":\"%aType%\",\"region\":\"%Cregion%\",\"requesterPaymentRequired\":false,\"remoteDirectory\":{\"@type\":\"REMOTE_PATH\",\"path\":\"%remoteDir%\"},\"logDirectory\":null,\"tags\":[],\"usingCredentials\":false,\"timeToLive\":null,\"host\":\"\"}}" %proto%://%jscapehost%:%jscapemanagmentport%/rest/management/reverse-proxies/%domain%') do set addResourceResponse=%%G

if !addResourceResponse! EQU %server409% (echo Amazon S3 Resource already exists.. Try other name ..)
if !addResourceResponse! EQU %server201% (echo Amazon S3 Resource created successfully..)
if !addResourceResponse! EQU %server404% (echo Response Code : 404 Amazon S3 Resource creation failed, Recheck the parameters..)
if !addResourceResponse! EQU %server400% (echo Response Code : 400 Amazon S3 Resource creation failed, Invalid parameters..)
) else (echo. 
echo Login failed. Re-check rest username and password)
)

:: Logout from the server
curl.exe -s -k -b cookie1.txt -H "x-js-at: !csrftoken1!" -X POST %proto%://%jscapehost%:%jscapemanagmentport%/rest/management/logout

:: delete cookie
DEL cookie.txt cookie1.txt



