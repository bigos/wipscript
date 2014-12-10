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

branch_present=`git show-branch wip/$branch`
# echo $branch_present

git add $file
git commit $file -m $file

if [[ $branch_present == *"exists"* ]]
then
    echo "in then"
    git checkout wip/$branch;
else
    echo "doing else"
    git checkout -b wip/$branch;
fi

git checkout $branch -- $file
git commit -am $file

git checkout $branch
git reset --soft $hv

# echo "Finished."
