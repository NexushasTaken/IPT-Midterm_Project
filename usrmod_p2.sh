#!/bin/bash
sub_command=$1

sudo userdel -r $2

case $sub_command in
  create)
    sudo useradd $2
    echo "User $2 was created."
    ;;
  delete)
    sudo userdel -r $2
    echo "User $2 was created and its home directory."
    ;;
  change-password)
    sudo passwd $2
    echo "Password for $2 was created."
    ;;
  *)
    echo "Unknown command $1"
    ;;
esac
