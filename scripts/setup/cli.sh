#!/bin/sh

set -eu

NOCLIENT=1 yarn install --pure-lockfile

rm -rf ./dist/server/tools/

(
    cd ./server/tools
    yarn install --pure-lockfile
)

npm run tsc -- --build ./server/tools/tsconfig.json

mv "./server/tools/node_modules" "./dist/server/tools"
