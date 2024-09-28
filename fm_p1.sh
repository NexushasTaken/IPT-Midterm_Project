#!/bin/bash
sub_command=$1

case $sub_command in
  copy)
    cp -r $2 $3
    echo "Copied $2 to $3"
    ;;
  move)
    mv $2 $3
    echo "Moved $2 to $3"
    ;;
  rename)
    mv $2 $3
    echo "Renamed $2 into $3"
    ;;
  delete)
    rm -r $2
    echo "Deleted $2"
    ;;
  search)
    echo "Looking for $3 in $2"
    find $2 -name $3
    ;;
  list)
    echo "Listing all files and directories in $2"
    ls -l $2
    ;;
  edit)
    echo "Editing file $2"
    nano $2
    ;;
  display)
    echo "Displaying the contents of $2"
    cat $2
    ;;
  *)
    echo "Unknown command $1"
    ;;
esac
