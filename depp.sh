#! /bin/bash

# what goes where
BASEDIR=$(realpath $(dirname "$0"))
RUNDIR=$(pwd)
TEMPDIR="$BASEDIR/templates"

# helpers
TEMPLATES=("python") # valid and existing templates

# project name and type
LANG="python"
NAME=""

# some colours for pretty printing
Color_Off='\033[0m'       # Text Reset
BGreen='\033[1;32m'       # Green
BRed='\033[1;31m'         # Red

place_template () { # pass parameters : 1: lang 2: name
    echo -e "Placing ${BGreen}$1${Color_Off} template ${BGreen}$2${Color_Off}"
    echo -e "path : ${BGreen}$RUNDIR/${Color_Off}"
    echo -e "name : ${BGreen}$NAME${Color_Off}"

    PROJECTDIR="$RUNDIR/$NAME"

    if [ -d "$PROJECTDIR" ]; then
        echo -e "${BRed}Project $PROJECTDIR already exists! Be more original!${Color_Off}"
    else
        mkdir $PROJECTDIR
        cp "$TEMPDIR/$LANG/"* "$PROJECTDIR/"
        touch "$PROJECTDIR/README.md"
        ls -lisah $PROJECTDIR
    fi
}

if [[ $# -eq 0 ]] ; then
    echo "No idea what you want from me!"
elif [[ $# -ne 0 ]] ; then
    for arg in "$@"; do
        lower=$(echo "$arg" | sed 's/.*/\L&/') # force lowercase on the arg
        if [[ " ${TEMPLATES[*]} " =~ [[:space:]]"$lower"[[:space:]] ]] ; then # so, there's a project language passed!
            LANG="$lower"
        elif [[ ! -n "$NAME" ]] ; then # just assume that the first non-keyword is the project name
            NAME="$arg"
        fi
    done
        place_template $LANG $NAME
fi
