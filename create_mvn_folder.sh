#!/bin/bash

# Create the maven folder and web application
read -p "Enter your mvn folder name:"\  mvn_name
mvn archetype:generate -DgroupId=com.$mvn_name -DartifactId=$mvn_name -Dversion=1.0-SNAPSHOT -DinteractiveMode=false -DarchetypeArtifactId=maven-archetype-webapp 

# Creatting local repository 
cd $mvn_name
git init

# Git configuration entry global
read -p "Enter your git user name:"\  username
git config --global user.name "$username"
read -p "Enter your git email Id:"\  git_email
git config --global user.email "$git_email" 

# Copy git add script
cp -f /Script/git_add.sh /Script/$mvn_name
