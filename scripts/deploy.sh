#!/bin/bash

echo -e "\033[0;32mDeploying content updates to GitHub...\033[0m"

git config --global user.email "donbstringham@gmail.com"
git config --global user.name "Don B. Stringham"

# Build the project.
git checkout source
git clone https://github.com/SenjinDarashiva/hugo-uno.git ./themes/hugo-uno
mkdir ../daoyinchuan.com
hugo
cp -R public/* ../daoyinchuan.com
git checkout master
rm -fr *
cp -R ../daoyinchuan.com/* .
git add --all
git commit -m "Latest content via travis-ci"
git push --set-upstream origin
git checkout source
rm -fr ../daoyinchuan.com
