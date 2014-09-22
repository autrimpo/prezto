#
# Custom aliases
#

# Aliases for editing of dotfiles

alias vrc="pushd; cd; vim ~/.vimrc; popd"
alias zrc="pushd; cd; vim ~/.zshrc; popd"
alias zpc="pushd; cd; vim ~/.zpreztorc; popd"
alias zev="pushd; cd; vim ~/.zshenv; popd"
alias brc="pushd; cd ~/.config/bspwm; vim bspwmrc; popd"
alias sxrc="pushd; cd ~/.config/sxhkd; vim sxhkdrc; popd"
alias trc="pushd; cd ~/.config/termite; vim config; popd"

# TODO helpers
function atd() {
    echo $1 >> ~/TODO
}

function ltd() {
    cat ~/TODO
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
