#!/bin/bash -e
sudo npm i -g @angular/cli
read -p 'Projectname: ' project
cd ..
mkdir $project
cd $project
ng new ng2
cd ng2
npm i --save @ng-bootstrap/ng-bootstrap
cd ..
mkdir server
cd server
rsync -aP ../../Angular_Express_Preset/package.json ./package.json
npm i
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
cd ../../../Angular_Express_Preset
rsync -aP gulpfile.js ../$project/server/gulpfile.js
cd ./$project/
code .
