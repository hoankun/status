#!/bin/bash

pkill gitk 2>/dev/null     # đóng cửa sổ gitk của lần chạy trước
cd ~
rm -rf git-lab             # xóa hẳn repo cũ
mkdir git-lab && cd git-lab

git init -b master
git config user.name "cung1"
git config user.email "abc@gmail.com"

git commit --allow-empty -m "m1"

git checkout -b red
git commit --allow-empty -m "r1"
git commit --allow-empty -m "r2"
git commit --allow-empty -m "r3"


git checkout master 

git checkout -b green
git commit --allow-empty -m "g1"
git commit --allow-empty -m "g2"

git checkout master
git commit --allow-empty -m "m2"
git commit --allow-empty -m "m3"
git commit --allow-empty -m "m4"

git merge --no-ff green -m "Merge green vao master"

git checkout red
git merge --no-ff master -m "Merge master vao red"

gitk --all &
