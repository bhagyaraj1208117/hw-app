#!/bin/bash

set -e

cd ../..
PATH=/usr/bin/yarn
cd -
export NODE_ENV=production
BABEL_ENV=cjs babel --source-maps -d lib src --config-file ./babel.config.js
npx flow-copy-source -v src lib
BABEL_ENV=es babel --source-maps -d lib-es src --config-file ./babel.config.js
npx flow-copy-source -v src lib-es