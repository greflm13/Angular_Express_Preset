@ECHO OFF
SET interactive=0
ECHO %CMDCMDLINE% | FINDSTR /L %COMSPEC% >NUL 2>&1
IF %ERRORLEVEL% == 0 SET interactive=1
echo updating angular, please wait for the window to close.
start cmd /C npm i -g @angular/cli && pause
set /p projectname=Projectname: 
cd ..
mkdir %projectname%
cd %projectname%
echo intializing angular...
start cmd /C ng new ngx && pause
mkdir server
cd server
echo initializing server...
copy ..\..\Angular_Express_Preset\package.json package.json
start cmd /C npm i && pause
mkdir src
cd src
(
@echo import * as path from 'path';
@echo import * as http from 'http';
@echo import * as child from 'child_process';
@echo import * as fs from 'fs';
@echo import * as express from 'express';
@echo import * as bodyparser from 'body-parser';
@echo import * as debugsx from 'debug-sx';
) > main.ts
cd ..\..\ngx
start cmd /C npm i --save @ng-bootstrap/ng-bootstrap && pause
cd ..\..\Angular_Express_Preset
copy gulpfile.js ..\%projectname%\server\gulpfile.js
copy upper.package.json ..\%projectname%\package.json
copy tsconfig.json ..\%projectname%\server\tsconfig.json
cd ..\%projectname%
code .
IF "%interactive%"=="0" PAUSE
EXIT /B 0
