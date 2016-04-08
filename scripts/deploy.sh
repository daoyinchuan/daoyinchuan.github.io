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
