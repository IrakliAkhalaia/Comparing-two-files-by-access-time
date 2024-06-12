     #!/bin/zsh

     if [ $# -ne 2 ]
     then
          echo "The number of arguments passed is less or more than allowed."
          exit
     fi

     if [ ! -e "$1" ]
     then
          echo "'$1' file doesn't exist."
          exit
     fi

     if [ ! -e "$2" ]
     then
          echo "'$2' file doesn't exist."
          exit
     fi

     # Saving in variables access time since epoch for both files.
     FFAT=$(stat -c "%X" "$1")
     SFAT=$(stat -c "%X" "$2")

     if [ $FFAT -eq $SFAT ]
     then
          echo "'$1' file and '$2' file access are same."

     elif [ $FFAT -lt $SFAT ]
     then
          echo "'$1' file access time is newer than '$2' file access time."
     elif [ $FFAT -gt $SFAT ]
     then
          echo "'$1' file access time is older than '$2' file access time."
     fi
