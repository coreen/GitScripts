#!/bin/bash

# Coreen Yuen
# Usage: ./update-all.sh <optionalGroupFolderName>
# used to update all repos within an "everything" folder following the below structure:
# Everything/
#      GroupA/
#          Repo1/
#          Repo2/
#      GroupB/
#          Repo3/
# NOTE: requires being cd'd into the "everything"  folder

# update all repos
update_repos () {
	for r in `ls -d */`
	do
		cd $r
		CURRENT_BRANCH=`git branch --no-color | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'`
		git stash
		git checkout master
		git pull origin master
		git remote prune origin
		git checkout ${CURRENT_BRANCH}
		git stash pop
		cd ..
	done
}

# special case for when optional group folder name is specified
if [ $# -gt 0 ]; then
	cd $1
	update_repos
	cd ..
else
	# do for all groups
	for g in `ls -d */`
	do
		cd $g
		update_repos
		cd ..
	done
fi

