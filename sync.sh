#!/usr/bin/env bash

function copyfile() {
    src=$1
    dst=$2

    # create directory if not exist
    pdir=$(dirname $dst)
    if [ ! -d $pdir ]; then
        mkdir -p $pdir
    fi

    owner=$USER
    if [ -f $dst ]; then
        owner=$(stat --format=%U $dst)
    fi

    echo "copy $src to $dst ..."

    if [ ! -z $owner ] && [ "x$owner" != "x$USER" ]; then
        echo "file $dst owner is $owner, require super user pervillage to copy it"
        sudo cp $src $dst
    else
        cp $src $dst
    fi
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

function vim_install_tip() {
    cat << VIM
Please install VIM plugins manually with next command:

cd ~/.vim && bash bundle.sh

then open vim and run PluginInstall command
VIM
}

function usage() {
    cat << EOHELP
Usage: $0 -t [OPTIONS]

Options:
    -t, --target   sync to <local or system> folder
EOHELP
}

target=unset

TEMP=`getopt -o t: --long target: -- "$@"`
eval set -- "$TEMP"

while true ; do
    case "$1" in
        -t|--target) target=$2; shift ; shift ;;
        --) shift ; break ;;
        *) usage; exit 1 ;;
    esac
done

# show usage if missed copy option
if [ "x$target" == "xunset" ]; then
    usage
    exit 2
fi

# default copy from sys to repo
path_map=(/etc:etc ~:home)
tmpf=$(mktemp)
find . -type f ! -path './.git/*' | sed 's/^.\///;s/\// /' > $tmpf

while read -r name path; do
    if ignore $name $path; then
        continue
    fi

    for _path in ${path_map[@]}
    do
        sys=$(echo $_path | cut -d':' -f1)
        _local=$(echo $_path | cut -d':' -f2)

        src=$sys
        dst=$_local

        if [ "x$target" == "xsystem" ]; then
            _dst=$dst
            dst=$src
            src=$_dst
        fi

        if [ "x$_local" != "x$name" ]; then
            continue
        fi

        copyfile $src/$path $dst/$path
    done
done < $tmpf

# install vim plugins
if [ "x$target" == "xsystem" ]; then
    vim_install_tip
fi
