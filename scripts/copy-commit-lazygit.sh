#!/bin/sh

BASE_URL='...' #Add specific url here

commit_hash=$1
change_id=$(git show $commit_hash | awk '/Change-Id/ {print $2}')

url="$BASE_URL"/"$change_id"
echo "$url" | xclip -selection clipboard

echo "Copied $url to clipboard"