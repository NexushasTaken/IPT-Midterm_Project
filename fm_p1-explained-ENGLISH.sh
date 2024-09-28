#!/bin/bash
# the line above is called shebang-line, this tells lets call the OS which
# program should run this script.

# the sub command we enter after we run this script will be stored in $1;
# then we store the value of $1 to sub_command variable.
sub_command=$1

# we will use case statement also known as switch-case statement. 
# we access the sub_command variable and put it after the word "case".
case $sub_command in
  # this where the MATCHING starts, if the value of $sub_command is "copy", then the script will run the "cp" command.
  # This part is also known as match-case or Pattern Matching.
  # notice that $2 and $3 is used here, these are the input we gave when we run the script.
  # $2 is a target OR the file/directory we want to copy, and $3 is the destination or where we should copy the file/directory we provided.
  copy)
    cp -r $2 $3
    echo "Copied $2 to $3"
    ;;
  # this is similar to "copy", but instead we use "move" to use "mv" command.
  # $2 and $3 is also used here, similar to copy command.
  # $2 is a target OR the file/directory we want to move, and $3 is the destination or where we should move the file/directory we provided.
  move)
    mv $2 $3
    echo "Moved $2 to $3"
    ;;
  # this one is for renaming that uses "mv" to rename a file or directory.
  # $2 and $3 is also used here, similar to copy command.
  # $2 is a target OR the file/directory we want to copy, and $3 is the destination or where we should copy the file/directory we provided.
  rename)
    mv $2 $3
    echo "Renamed $2 into $3"
    ;;
  # this one is for deletion that uses "rm" to delete a file or directory.
  # -r means delete the directory even if it has files in it or not.
  # $2 is the only variable we used here, it only means that we only need one input to know what file or directory we should delete.
  delete)
    rm -r $2
    echo "Deleted $2"
    ;;
  # this one is for searching a file and directory inside a directory.
  # $2 and $3 is also used here, similar to copy command.
  # $3 is the file or directory we want to find inside $2 directory.
  search)
    echo "Looking for $3 in $2"
    find $2 -name $3
    ;;
  # this one is listing the files and directories inside a directory.
  # -l means include the permission and stats of each files and directories.
  # $2 is the only variable we used here, it means we only need one input to list all files and directory FROM that input.
  list)
    echo "Listing all files and directories in $2"
    ls -l $2
    ;;
  # this one is for editing files
  # $2 is the only variable we used here, it only means that we only need one input to what file we want to edit.
  edit)
    echo "Editing file $2"
    nano $2
    ;;
  # this one is displaying what inside of the file.
  # $2 is the only variable we used here, it only means that we only need one input to what file we to display.
  display)
    echo "Displaying the contents of $2"
    cat $2
    ;;
  # this is where the special part comes in, the askterisk (*) indicates no matter what value of $sub_command is, the "echo" command bellow will run! in this case, if we run this script with unknown sub command, the script will yell at us that we use an unknown command.
  *)
    echo "Unknown command $1"
    ;;
esac

# final words, notice that theres some weird ";;" or double semi-colons, this just indicates where or on what line the script should stop executing.
# for example, if $sub_command is "copy", then the script will run 'cp -r $2 $3' AND 'echo "Copied $2 to $3"', and then the script will stop at ";;", then the commands after the line "move)" won't run.
