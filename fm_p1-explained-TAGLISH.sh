#!/bin/bash
# the line above is called shebang-line, sinasabi lang nito sa OS o yung runner
# kung anong program dapat irun ang script na ito.

# yung sub command na inenter natin kapag nirun natin ang script nato ay
# mapupunta sa $1 na variable. kaya ang gagawin natin ay ilalagay natin yung
# value nang $1 sa sub_command na variable.
sub_command=$1

# we will use case statement also known as switch-case statement. para magamit
# ang case statement, ilagay dapat ang input or $sub_command sa tabi nang
# "case" para naman malaman kung anong value ang gagamitin nang case statement
case $sub_command in
  # this where the MATCHING starts, kung nilagay natin na variable sa tabi nang "case" ay may value na "copy",
  # yung script irurun yung nasa baba nang "copy)" or yung 'cp -r $2 $3' at 'echo "Copied $2 to $3"'
  # yung 'copy)' ay tinatawag ding "match-case" or "Pattern Matching".
  # kung makikita mo ang variable na $2 at $3 ay ginamit dito, ito yung mga
  # input para sa pag cocopy.
  # ang $2 is a target OR the file/directory na gusto nating icopy, at $3 ay ang pangalan nang file na macocopy.
  copy)
    cp -r $2 $3
    echo "Copied $2 to $3"
    ;;
  # this is similar to "copy", but instead we use "move" to use "mv" command.
  # ginamit din natin yung $2 at $3 sa part na ito, parang kaparehas lang nang copy command to.
  # ang $2 is a target OR the file/directory na gusto nating imove, at $3 ay kung saan ilalagay yung file/directory na ininput natin.
  move)
    mv $2 $3
    echo "Moved $2 to $3"
    ;;
  # this one is for renaming that uses "mv" to rename a file or directory.
  # $2 and $3 is also used here, similar to copy command.
  # ang $2 is a target OR the file/directory na gusto nating irename, at $3 ay kung ano ang bagong pangalan na gusto natin para sa ininput natin.
  rename)
    mv $2 $3
    echo "Renamed $2 into $3"
    ;;
  # this one is for deletion that uses "rm" to delete a file or directory.
  # -r means delete the directory even if it has files in it or not.
  # ang $2 ay ang file/directory na gusto nating iremove.
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
  # $2 na variable ang ginamit lang natin dito, ibigsabihin, ito yung directory na kung nasan yung files at directory na gusto natin idisplay or output.
  list)
    echo "Listing all files and directories in $2"
    ls -l $2
    ;;
  # this one is for editing files
  # $2 is the only variable we used here, ito lang naman yung file na gusto nating iedit.
  edit)
    echo "Editing file $2"
    nano $2
    ;;
  # this one is displaying what inside of the file.
  # $2 is the only variable we used here, ito lang naman yung file na gusto nating idisplay.
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
