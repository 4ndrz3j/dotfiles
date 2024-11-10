#!/bin/zsh


git-search-file() {
FILE_PATH=$1
git log --all --pretty=format:"%H" -- "$FILE_PATH"| while read commit_hash; do sha1=$(git show "$commit_hash":"$FILE_PATH" | sha1sum);  echo "Commit: $commit_hash, SHA1: $sha1" ;done
}
