export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.ustc.edu.cn/homebrew-bottles
export HOMEBREW_CASK_DOMAIN=https://mirrors.ustc.edu.cn/homebrew-cask

export LESSCHARSET=utf-8 #设置 Shell 临时环境变量

export PATH="$HOME/.bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH=/usr/local/share/python:$PATH

# Configuration for virtualenv
export WORKON_HOME=$HOME/.virtualenvs
export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python3
export VIRTUALENVWRAPPER_VIRTUALENV=/usr/local/bin/virtualenv
source /usr/local/bin/virtualenvwrapper.sh


export PATH="/usr/local/Cellar/csvkit/1.0.6_1/bin:$PATH"
export PATH="/usr/local/Cellar/docker/19.03.12/bin:$PATH"
export PATH="/usr/local/Cellar/dosfstools/4.2/sbin:$PATH"
export PATH="/usr/local/Cellar/vim/9.0.1400/bin:$PATH"
export PATH="/usr/local/opt/binutils/bin:$PATH"
export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
export PATH="/usr/local/opt/e2fsprogs/bin:$PATH"
export PATH="/usr/local/opt/e2fsprogs/sbin:$PATH"
export PATH="/usr/local/opt/ed/bin:$PATH"
export PATH="/usr/local/opt/ed/libexec/gnubin:$PATH"
export PATH="/usr/local/opt/findutils/libexec/gnubin:$PATH"
export PATH="/usr/local/opt/gawk/libexec/gnubin:$PATH"
export PATH="/usr/local/opt/gnu-getopt/bin:$PATH"
export PATH="/usr/local/opt/gnu-indent/libexec/gnubin:$PATH"
export PATH="/usr/local/opt/gnu-sed/libexec/gnubin:$PATH"
export PATH="/usr/local/opt/gnu-tar/libexec/gnubin:$PATH"
export PATH="/usr/local/opt/gnu-which/libexec/gnubin:$PATH"
export PATH="/usr/local/opt/grep/libexec/gnubin:$PATH"
export PATH="/usr/local/opt/openssl@1.1/bin:$PATH"
export PATH="/usr/local/opt/texinfo/bin:$PATH"
#export CPPFLAGS="-I/usr/local/opt/binutils/include"
#export LDFLAGS="-L/usr/local/opt/binutils/lib"

export PATH="/opt/flutter/bin:$PATH"
export PATH="/Users/zhigang/Library/Android/sdk/cmdline-tools/latest/bin/:$PATH"
export XML_CATALOG_FILES="/usr/local/etc/xml/catalog"

eval $(thefuck --alias)
export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.ustc.edu.cn/homebrew-bottles/

export XDEV="$HOME/Documents/work/dev"
export XBOE="$HOME/Documents/work/xboe"

export GOENV_GOPATH_PREFIX=$HOME/.goenv/go_path
export GOENV_ROOT="$HOME/.goenv"
export PATH="$GOENV_ROOT/bin:$PATH"
eval "$(goenv init -)"
export PATH="$GOROOT/bin:$PATH"
export PATH="$PATH:$GOPATH/bin"
