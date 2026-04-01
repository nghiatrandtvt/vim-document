#!/bin/sh

BASE_URL='...' # Add specific url here
XDG_COMMAND='xdg-open' #use for linux, window and mac uses difference one

commit_hash=$1
change_id=$(git show $commit_hash | awk '/Change-Id/ {print $2}')

url="$BASE_URL"/"$change_id"
echo "Openning $url"

$XDG_COMMAND $url
