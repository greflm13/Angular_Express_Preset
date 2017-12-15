#!/bin/bash -e
sudo npm i -g @angular/cli
if [ -d "empty_project" ]
then
    rm -R empty_project/
fi
mkdir empty_project
cd empty_project
ng new ng2
cd ng2
npm i --save @ng-bootstrap/ng-bootstrap
cd ..
mkdir server
cd server
npm init server
npm i --save express bootstrap debug debug-sx
npm i --save-dev @types/debug @types/express @types/node del gulp gulp-changed gulp-sourcemaps gulp-typescript gulp-using merge-stream run-sequence typescript
mkdir src
cd src
cat <<EOF >main.ts
import * as path from 'path';
import * as http from 'http';
import * as child from 'child_process';
import * as fs from 'fs';

import * as express from 'express';
import * as bodyparser from 'body-parser';
import * as debugsx from 'debug-sx';
EOF
cd ../../..
rsync -aP gulpfile.js empty_project/server/gulpfile.js
code empty_project/
