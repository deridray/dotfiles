#!/bin/bash
echo -n "enter commit message: "
read commit_msg
cd ~/dotfiles
git add .
git commit -m "$commit_msg"
git push origin main
