#
# Custom aliases
#

# Aliases for editing of dotfiles

function dotfileedit() {
    if [ "$(pwd)" = "$(dirname $1)" ];then
        vim $1
    else
        pushd
        cd $(dirname $1)
        vim $1
        popd
    fi
}

alias vrc="dotfileedit ~/.vimrc"
alias zrc="dotfileedit ~/.zshrc"
alias zpc="dotfileedit ~/.zpreztorc"
alias zev="dotfileedit ~/.zshenv"
alias brc="dotfileedit ~/.config/bspwm/bspwmrc"
alias sxrc="dotfileedit ~/.config/sxhkd/sxhkdrc"
alias trc="dotfileedit ~/.config/termite/config"

# TODO helpers
function atd() {
    echo $1 >> ~/TODO
}

function ltd() {
    sed = ~/TODO | sed 'N;s/\n/\t/'
}

function rtd() {
    sed -i "/${1}/d" ~/TODO
}

# sudo vim preserve environment
alias svim="sudo -E vim"

# Copy template Makefile to current dir
alias makemake="cp ~/.Makefile_temp ./Makefile"

# Update pacman mirrors
alias mirrupd="sudo reflector --verbose -l 200 -p http --sort rate --save /etc/pacman.d/mirrorlist"

# Menu for bspwm actions
alias bmenu="mygtkmenu ~/.config/GTKmenu/BspwmMenu > /dev/null"

# mpdviz preset
alias mviz="mpdviz -c blue -i --imode="dumb" -v spectrum"

#transmission-daemon
alias trstart="transmission-daemon"
alias trview="transmission-remote-cli"
alias trstop="transmission-remote --exit"

# 4chan image downloader
dta() {
  wget -O - $1 |
  grep -Eo 'i.4cdn.org/[^"]+' |
  uniq |
  xargs wget
}