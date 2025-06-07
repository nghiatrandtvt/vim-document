#!/bin/sh

BASE_URL='...'
XDG_COMMAND='xdg-open' #use for linux, window and mac uses difference one

commit_hash=$1
change_id=$(git show $commit_hash | awk '/Change-Id/ {print $2}')

url="$BASE_URL"/"$commit_hash"
echo "Openning $url"

$XDG_COMMAND $url
