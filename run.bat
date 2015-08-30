@ECHO off
::@ECHO on
::=====================================
SET GITHUB_ACCOUNT=Borlipn	
SET WS_DIR=Java_HW_37
SET REPO_NAME=TV_PropertyFile 
SET APP_VERSION=1.2
SET MAIN_CLASS=core.TV_PropertyFile 
SET ARGS_01=
::========================================

::========================================
::SET GITHUB_ACCOUNT=%1
::SET WS_DIR=%2
::SET REPO_NAME=%3
::SET APP_VERSION=%4
::SET MAIN_CLASS=%5
::SET ARGS_01=%6
::========================================

IF "%JAVA_HOME%" == "" GOTO EXIT_JAVA
ECHO Java installed
IF "%M2%" == "" GOTO EXIT_MVN
ECHO Maven installed
:: Only for my comp path to git.exe 
CD C:\Program Files (x86)\Git\bin  
CALL git --version > nul 2>&1
IF NOT %ERRORLEVEL% == 0 GOTO EXIT_GIT
ECHO Git installed
CD\

GOTO NEXT

:NEXT
IF NOT EXIST C:\%WS_DIR% GOTO NO_WORKSPACE
IF EXIST C:\%WS_DIR%\%REPO_NAME% RMDIR /S /Q C:\%WS_DIR%\%REPO_NAME%
CD C:\%WS_DIR% 
"C:\Program Files (x86)\Git\bin\"git clone https://github.com/Borlipn/TV_PropertyFile.git
::git clone https://github.com/%GITHUB_ACCOUNT%/%REPO_NAME%.git
CD %REPO_NAME%
::SLEEP 2
CALL mvn package 
ECHO Executing Java programm ...
java -jar C:\Java_HW_37\TV_PropertyFile\target\TV_PropertyFile-1.2-jar-with-dependencies.jar
::java -jar C:\%WS_DIR%\%REPO_NAME%\target\%REPO_NAME%-%APP_VERSION%-jar-with-dependencies.jar
GOTO END

:EXIT_JAVA
ECHO No Java installed
GOTO END
:EXIT_MVN
ECHO No Maven installed
GOTO END
:EXIT_GIT
ECHO No Git installed
GOTO END
:NO_WORKSPACE
ECHO %WS_DIR% is not exists
GOTO END
:END
CD\

