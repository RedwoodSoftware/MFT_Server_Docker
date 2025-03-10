@echo off
SETLOCAL EnableDelayedExpansion
echo.
cd ..\..\..\..\..
javac -cp .\libs\* .\doc\api-examples\rest\java\create_resource\CreateResourceExample.java
javac -cp .\libs\* .\doc\api-examples\rest\java\create_resource\CreateS3ResourceExample.java

ECHO.
ECHO ###########################
ECHO Select Storage Type
ECHO ###########################
ECHO.

:: Choose storage type
:start
echo 1:FTP
echo 2:Amazon S3 
set choice=
set /p choice=Choose the type.
if not '%choice%'=='' set choice=%choice:~0,1%
if '%choice%'=='1' goto ftp
if '%choice%'=='2' goto amazons3
ECHO "%choice%" is not valid, try again
ECHO.
goto start
:ftp
java -cp .\libs\*;.\doc\api-examples\rest\java\create_resource CreateResourceExample
goto end
:amazons3
java -cp .\libs\*;.\doc\api-examples\rest\java\create_resource CreateS3ResourceExample
goto end
:end
cd .\doc\api-examples\rest\java\create_resource
