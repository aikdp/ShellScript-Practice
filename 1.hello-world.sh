#!/bin/bash



git add .
git commit -m "commit"
git push origin main

git rm --cached <file-name>  #back to workspace, means remove from stage and move to work directory

git config --global user.name <user-name>
git config --global user.email <email id>

