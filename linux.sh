#!/bin/bash -e
sudo npm i -g @angular/cli
if [ -d "empty_project" ]
then
    rm -R empty_project/
fi
mkdir empty_project
cd empty_project
ng new ng2
mkdir server
cd server
npm init server
npm i --save express bootstrap debug debug-sx
npm i --save-dev @types/debug @types/express @types/node del gulp gulp-changed gulp-sourcemaps gulp-typescript gulp-using merge-stream run-sequence typescript
code package.json
cd ../..
rsync -aP gulpfile.js empty_project/server/gulpfile.js
