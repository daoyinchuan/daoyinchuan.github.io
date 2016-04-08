#!/bin/bash

echo -e "\033[0;32mDeploying updates to GitHub...\033[0m"

git config --global user.email "donbstringham@gmail.com"
git config --global user.name "Don B. Stringham"

# Build the project.
hugo

git clone https://github.com/daoyinchuan/daoyinchuan.github.io.git
cp -R public/* ${REPO}
cd ${REPO}
git remote
git add -A :/
git commit -a -m "latest via travis"
git push "https://${GH_TOKEN}@${GH_REPO}" master > /dev/null 2>&1