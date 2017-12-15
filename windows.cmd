@ECHO OFF
SET interactive=0
ECHO %CMDCMDLINE% | FINDSTR /L %COMSPEC% >NUL 2>&1
IF %ERRORLEVEL% == 0 SET interactive=1
echo updating angular, please wait for the window to close.
start cmd /C update_angular && pause
IF EXIST "empty_project" echo deleting old project... && rmdir empty_project /s /q
echo creating folder...
mkdir empty_project
cd empty_project
echo intializing angular...
start cmd /C ng new ng2
mkdir server
cd server
echo initializing server...
start cmd /C npm init server && pause
start cmd /C npm i --save express bootstrap debug debug-sx
start cmd /C npm i --save-dev @types/debug @types/express @types/node del gulp gulp-changed gulp-sourcemaps gulp-typescript gulp-using merge-stream run-sequence typescript
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
cd ..\..\ng2
start cmd /C npm i --save @ng-bootstrap/ng-bootstrap
cd ..\..
copy gulpfile.js empty_project\server\gulpfile.js
code empty_project\
IF "%interactive%"=="0" PAUSE
EXIT /B 0
