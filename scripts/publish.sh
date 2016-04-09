#!/bin/bash

CWD_DIR=`pwd`
TMP_DIR=${CWD_DIR}/../daoyinchuan.com

echo -e "\033[0;32mDeploying content updates to GitHub...\033[0m"

# Build the project.
git clone https://github.com/SenjinDarashiva/hugo-uno.git ./themes/hugo-uno
mkdir ${TMP_DIR}
hugo
cp -R ${CWD_DIR}/public/* ${TMP_DIR}
cp ${CWD_DIR}/scripts/CNAME ${TMP_DIR}
cp ${CWD_DIR}/scripts/sidebar.html ${TMP_DIR}/themes/hugo-uno/layouts/partials/sidebar.html
git stash

git checkout master
rm -fr *
cp -R ${TMP_DIR}/* ${CWD_DIR}/
git add *
git commit -m "Latest content via travis-ci"
git push origin --all
rm -fr ${TMP_DIR}

git checkout source
rm -fr ${CWD_DIR}/public
git stash pop
