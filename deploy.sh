#!/usr/bin/env sh

set -e
npm run build
cd dist

git init
git add -A
git commit -m 'New deployment'

git push -f git@github.com:worckyky/three-sitez.git master:gh-pages

cd -
