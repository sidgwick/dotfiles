#!/usr/bin/env bash

function copyfile() {
    src=$1
    dst=$2

    # create directory if not exist
    pdir=$(dirname $dst)
    if [ ! -d $pdir ]; then
        mkdir -p $pdir
    fi

    cp $src $dst
}

function unknown() {
    name=$1
    path=$2

    pattern="$name/$path"

    if [ -z $path ]; then
        pattern=$name
    fi

    echo "unknown how to copy file: $pattern"
}

function ignore() {
    name=$1
    path=$2

    pattern="$name/$path"

    if [ -z $path ]; then
        pattern=$name
    fi

    is_exclude=$(grep "^$pattern$" exclude)
    [ ! -z $is_exclude ]
}


function usage() {
    cat << EOHELP
Usage: $0 [OPTIONS]

Options:
    -l, --local    sync sys to local
    -s, --sys      sync local to sys
EOHELP
}

LOCAL_SYS=unset

TEMP=`getopt -o ls --long local,sys -- "$@"`
eval set -- "$TEMP"

while true ; do
    case "$1" in
        -l|--local) LOCAL_SYS=local; shift ;;
        -s|--sys) LOCAL_SYS=sys ; shift ;;
        --) shift ; break ;;
        *) usage; exit 1 ;;
    esac
done

# show usage if missed copy option
if [ "x$LOCAL_SYS" == "xunset" ]; then
    usage
    exit 2
fi


# default copy from sys to repo
src_etc=etc
src_home=home
dst_etc=/etc
dst_home=~

if [ "x$LOCAL_SYS" == "xlocal" ]; then
    src_etc=/etc
    src_home=~
    dst_etc=etc
    dst_home=home
fi

tmpf=$(mktemp)
find . -type f ! -path './.git/*' | sed 's/^.\///;s/\// /' > $tmpf

while read -r name path; do
    if ignore $name $path; then
        continue
    fi

    case "$name" in
        etc)
            copyfile $src_etc/$path $dst_etc/$path
            ;;
        home)
            copyfile $src_home/$path $dst_home/$path
            ;;
        *) unknown $name $path ;;
    esac
done < $tmpf
