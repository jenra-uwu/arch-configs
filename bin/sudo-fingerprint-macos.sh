#!/bin/sh

if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

sudo cat /etc/pam.d/sudo > __tempSudoFile

File=__tempSudoFile

if ! grep -q pam_tid "$File"; then
  (echo "auth       sufficient     pam_tid.so" && cat $File) > $File".tmp"
  mv $File".tmp" $File
  sudo cp __tempSudoFile /etc/pam.d/sudo
fi

rm __tempSudoFile
