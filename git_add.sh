#!/bin/bash

git add .
git status
read -p "Enter your Commit:"\  commit
git commit -m "$commit"
