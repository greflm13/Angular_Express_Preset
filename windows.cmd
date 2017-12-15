@ECHO OFF
SET interactive=0
ECHO %CMDCMDLINE% | FINDSTR /L %COMSPEC% >NUL 2>&1
IF %ERRORLEVEL% == 0 SET interactive=1
update_angular.sh
IF EXIST "empty_project" rmdir empty_project /s /q
mkdir empty_project
cd empty_project
ng new ng2
mkdir server
cd server
npm init server
npm i --save express bootstrap debug debug-sx
npm i --save-dev @types/debug @types/express @types/node del gulp gulp-changed gulp-sourcemaps gulp-typescript gulp-using merge-stream run-sequence typescript
code package.json
mkdir src
cd src
(
@echo import * as path from 'path';
@echo import * as http from 'http';
@echo import * as child from 'child_process';
@echo import * as fs from 'fs';
@echo 
@echo import * as express from 'express';
@echo import * as bodyparser from 'body-parser';
@echo import * as debugsx from 'debug-sx';
) > main.ts
cd ..\..\..
copy gulpfile.js empty_project\server\gulpfile.js
IF "%interactive%"=="0" PAUSE
EXIT /B 0
