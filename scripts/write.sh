#!/bin/bash

CWD_DIR=`pwd`

echo -e "\033[0;32mPreparing content for updates...\033[0m"

# Build the project.
git clone https://github.com/SenjinDarashiva/hugo-uno.git ./themes/hugo-uno
yes | cp ./scripts/sidebar.html ./themes/hugo-uno/layouts/partials/sidebar.html