#! /bin/sh

# usege: wipscript.sh repo file branch
# for example
# wipscript.sh ~/repo file.sh development

# echo "Starting"
repo=$1
file=$2
branch=$3

cd $repo
hv=`git rev-parse HEAD`

git add $file
git commit $file -m $file

# assumes wip/$branch already exists
git checkout wip/$branch
git checkout $branch -- $file
git commit -am $file

git checkout $branch
git reset --soft $hv

# echo "Finished."
