#!/bin/bash

ARG=$1
if [[ $1 =~ .*/.*/.* ]]; then
  git clone "https://$ARG.git" || exit 1
else
  git clone "https://aur.archlinux.org/$ARG.git" || exit 1
fi
cd "$(basename "${ARG}")" || exit 1
makepkg -sf --noconfirm --skippgpcheck
