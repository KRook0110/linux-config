#!/bin/bash

git add ./kitty
git add ./nvim
git add ./tmux
git add ./.bashrc
git add ./.gitignore
git add ./github_commit_push.sh
git add ./.gitignore

git commit -m "scripted commit"

git remote add origin https://github.com/KRook0110/linux-config.git

git push origin master
