#!/bin/bash

echo -e "\033[0;32mDeploying content updates to GitHub...\033[0m"

# Build the project.
git clone https://github.com/SenjinDarashiva/hugo-uno.git ./themes/hugo-uno
mkdir ../daoyinchuan.com
hugo
cp -R public/* ../daoyinchuan.com
cp scripts/CNAME ../daoyinchuan.com
git stash
git checkout master
rm -fr *
cp -R ../daoyinchuan.com/* .
git add *
git commit -m "Latest content via travis-ci"
git push origin --all
rm -fr ../daoyinchuan.com
git checkout source
git stash pop
