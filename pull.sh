#!/usr/bin/env sh

check_for_changes() {
  echo "Checking $1"
  diff --color=always $1 $HOME/$1
  if [ $? -eq 1 ]; then
    echo -n "Is this okay? "
    read answer </dev/tty
    if [ "$answer" != "${answer#[Yy]}" ]; then
        echo "Replacing $1"
        cp $HOME/$1 $1
    fi
  fi
}

find . -type d \( -path ./.git -o -path ./etc \) -prune -o \
       -type f \( -name push.sh -o -name pull.sh \) -prune -o \
       -type f -print \
       | while read file; do check_for_changes "$file"; done
