#!/bin/bash

git add ./kitty/**/*
git add ./nvim
git add ./tmux
git add ./.bashrc
git add ./i3/
git add ./.zshrc
git add ./github_commit_push.sh
git add ./.gitignore
git add ./polybar
git add ./picom
git add ./.vimrc


git commit -m "scripted commit"

git remote add origin https://github.com/KRook0110/linux-config.git

git push origin master
