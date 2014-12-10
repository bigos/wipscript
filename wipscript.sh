#! /bin/sh

# usage: wipscript.sh repo file branch
# for example
# wipscript.sh ~/repo file.sh development

repo=$1
file=$2
branch=$3

cd $repo
hv=`git rev-parse HEAD`

branch_present=`git branch | grep wip/$branch`
# echo $branch_present
# echo "------"

git add $file
git commit -a -m $file

if [[ $branch_present == *"wip/$branch"* ]]
then
    # echo "in then"
    git checkout wip/$branch;
else
    # echo "doing else"
    git checkout -b wip/$branch;
fi

git checkout $branch -- $file
git commit -am $file

git checkout $branch
git reset --soft $hv

# echo "Finished."
