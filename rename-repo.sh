#!/bin/bash

# Coreen Yuen
# used for renaming local repo instance to remote naming
# NOTE: requires remote repo rename before running script

# asks user for which source control using
# only supports gitlab and github for now
echo "Choose which remote source control you're using"
echo "	Enter 1 for Gitlab"
echo "	Enter 2 for Github"
read -p "Your source control: " remote

# updates local repo for remote name changes and group moves
echo "Enter the rename info"
read -p "	old group: " oldGroup
read -p "	old name: " oldName
read -p "	new group: " newGroup
read -p "	new name: " newName
# assumes you run this in directory where path of local repo follows group/name semantics
cd $oldGroup/$oldName

# set the source control value based on previous input
if [ remote -eq 1 ]; then
	URL=gitlab
else
	URL=github
fi

# can use `git remote -v` to list current fetch and push urls
git remote set-url origin http://www.$URL.com/$newGroup/$newName.git
# pull to make sure url is reachable and to update the push url to match the newly modified fetch url
git pull

# rename the local repo path to match new remote path
cd ..
mv $oldName $newName
cd ..
mv $oldGroup $newGroup

