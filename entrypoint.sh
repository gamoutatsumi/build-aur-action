#!/bin/bash

REPO=$1
if [[ $1 =~ .*/.* ]]; then
  git clone "https://$REPO.git" || exit 1
else
  git clone "https://aur.archlinux.org/$REPO.git" || exit 1
fi
cd "$(basename "${REPO}")" || exit 1
makepkg -sf --noconfirm --skippgpcheck
