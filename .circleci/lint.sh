#!/bin/bash

# TODO(mattfarina) make sure master is the master on kubernetes/charts and not
# on a fork

# Compare to the merge-base rather than master to limit scanning to changes
# this PR/changeset is introducing
git remote add k8s https://github.com/kubernetes/charts
git fetch k8s master
cat .git/config
#CHANGED_FOLDERS=`git diff --find-renames --name-only $(git merge-base k8s/master HEAD) stable/ incubator/ | awk -F/ '{print $1"/"$2}' | uniq`
CHANGED_FOLDERS=`git diff --find-renames --name-only FETCH_HEAD stable/ incubator/ | awk -F/ '{print $1"/"$2}' | uniq`
echo $CHANGED_FOLDERS

# Exit early if no charts have changed
if [ -z "$CHANGED_FOLDERS" ]; then
  echo "No changes to charts found"
  exit 0
fi

for directory in ${CHANGED_FOLDERS}; do
  if [ "$directory" == "incubator/common" ]; then
    continue
  elif [ -d $directory ]; then
    helm lint ${directory}
  fi
done