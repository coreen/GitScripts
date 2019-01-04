# Git Scripts

Scripts for dealing with Git repositories locally.

## Table of Contents

* Rename repo
* Update all

### Rename repo

Use this script when the remote repository has been renamed and the local repository needs to be updated to match the new naming. Will handle repository name changes and repository moves to a different namespace group. Prompts the user for the old and new input paths to update accordingly.

### Update all

Use this script when there are a bunch of locally pulled git repositories within a single folder that would like to be kept in sync with remote. Move the script to be within that single folder then run `./update-all.sh` to have all the updating handled for you. Note this can be run regardless of what branch you currently have checked out, since the script automatically switches to `master` branch to update before returning to branch checked out before script run. However, if there are repositories within the single folder that have a default branch other than `master`, they will need to be updated manually.

