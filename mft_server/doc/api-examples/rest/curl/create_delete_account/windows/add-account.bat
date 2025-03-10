@echo off
SETLOCAL EnableDelayedExpansion
echo.
:: Title to describe the bat script
echo #####################################################################
echo This example demonstrates how to add a account using the server API.
echo #####################################################################

:: set response code to check

set server000=000
set server204=204
set server404=404
set server201=201
set server409=409

:: Read from the user
set /p proto="Enter protocol:"
set /p jscapehost="Enter server REST host:"
set /p jscapemanagmentport="Enter server REST port:"
set /p uname="Enter server username:"
set /p passwd="Enter server password:"
set /p domainName="Enter domain name:"
set /p accName="Enter account name:"
set /p accLogin="Enter account login name:"
set /p aPaswd="Enter account login password:"

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
echo Login success. Proceeding to add the account ...
echo.

:: Get CSRF token again
for /F %%x in ('curl.exe -s -k -b cookie1.txt -H "Content-type:application/json" %proto%://%jscapehost%:%jscapemanagmentport%/rest/management/csrf-token') do set csrftoken1=%%x


:: Add account
curl.exe -s -k -b cookie1.txt -w "%%{http_code}\n" -o NUL -H "x-js-at: !csrftoken1!" -H "X-Requested-With: XMLHttpRequest" -H "accept: application/json" -H "Content-type:application/json" -X POST -d "{\"username\":\"%accName%\",\"login\":\"%accLogin%\",\"password\":\"%aPaswd%\",\"groups\":[],\"emailAddress\":\"\",\"company\":null,\"phone\":{\"code\":\"\",\"number\":\"\",\"extension\":\"\"},\"bindedKeys\":[],\"owner\":null,\"expirationDate\":null,\"uploadsQuota\":null,\"downloadsQuota\":null,\"transfersQuota\":null,\"resources\":[{\"path\":\"\",\"accessPermissions\":{\"fileDownloadingAllowed\":true,\"fileUploadingAllowed\":true,\"fileOverwritingAllowed\":true,\"fileDeletionAllowed\":true,\"fileAppendingAllowed\":true,\"fileListingAllowed\":true,\"fileRenamingAllowed\":true,\"fileSharingAllowed\":true,\"directoriesListingAllowed\":true,\"directoryMakingAllowed\":true,\"directoryDeletionAllowed\":true,\"subdirectoriesBrowsingAllowed\":true},\"secured\":false,\"denied\":false,\"indexable\":true,\"realPath\":\"%%installdir%%/users/%%domain%%/%%username%%\",\"createIfNotExists\":true,\"pgpEncryption\":{\"keyProvider\":{\"file\":\"/.pgp/key.pub\"},\"enabled\":false},\"dataLossPrevention\":{\"icapAccess\":null,\"enabled\":false,\"rules\":[]}}],\"administration\":null,\"secured\":false,\"enabled\":true,\"passwordChangingAllowed\":true,\"emailFileTransferAllowed\":true,\"adHocTransferPermissions\":[\"EXTERNAL\"],\"usePhoneAuthentication\":false,\"ignorePasswordAgingRules\":false,\"uiTheme\":null,\"customUiTheme\":null,\"allowedProtocols\":null,\"loginRedirection\":{\"target\":\"storage\"},\"lastLoginDate\":null,\"ipAccessVerifier\":{},\"maxUploadsPerSession\":null,\"maxDownloadsPerSession\":null,\"webPublicKeyAuthenticationAvailable\":true,\"webOpenPgpEncryptionAvailable\":true,\"webQuotasAvailable\":true,\"webContactsAvailable\":true,\"webAdHocActivityAvailable\":true,\"webDropZonesAvailable\":true,\"webAccountLinkAvailable\":true,\"webPersonalInformationAvailable\":true,\"sftpPublicKeyAuthenticationRequired\":false,\"passwordExpirationNotification\":null,\"notes\":\"\",\"tags\":[],\"creationDate\":1675153478483,\"version\":1,\"passwordDate\":1675153478476,\"maxTransferRate\":null}" %proto%://%jscapehost%:%jscapemanagmentport%/rest/management/accounts/%domainName% > response.txt

set /p addAccntResponse=<response.txt

if !addaccntResponse! EQU %server409% (echo Login already exists .. Try other value..)
if !addaccntResponse! EQU %server201% (echo Account created successfully..)
if !addAccntResponse! EQU %server404% (echo Response Code : 404 add account failed, Recheck the parameters..)
) else (echo. 
echo Login failed. Re-check rest username and password)
)

:: Logout from the server
curl.exe -s -k -b cookie1.txt -X POST %proto%://%jscapehost%:%jscapemanagmentport%/rest/management/logout

:: delete cookie
DEL cookie.txt cookie1.txt
IF exist response.txt DEL response.txt



