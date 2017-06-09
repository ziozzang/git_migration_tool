#!/bin/bash
# Git Migration utility

if [ -z "$2" ]
  then
    echo "Usage: $0 [src_git_url] [target_git_url]"
    exit 1
fi

SRC=$1
TGT=$2
PWD=`pwd`
DIR=`mktemp -d`
git clone ${SRC} ${DIR}
cd "${DIR}"
BRNAME=`git rev-parse --abbrev-ref --symbolic-full-name @{u}`
BRHEAD=`git name-rev --name-only HEAD`
for branch in `git branch -a | grep remotes | grep -v HEAD | grep -v ${BRHEAD} `; do
   git branch --track ${branch#remotes/origin/} $branch
done

git remote remove origin
git remote add origin ${TGT}
git push --all -f
# --set-upstream ${BRHEAD}
cd "${PWD}"
rm -rf "${DIR}"
