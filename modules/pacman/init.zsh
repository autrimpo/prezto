#
# Defines Pacman aliases.
#
# Authors:
#   Benjamin Boudreau <dreurmail@gmail.com>
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#
# Tips:
#   https://wiki.archlinux.org/index.php/Pacman_Tips
#

# Return if requirements are not found.
if (( ! $+commands[pacman] )); then
  return 1
fi

#
# Frontend
#

# Get the Pacman frontend.
zstyle -s ':prezto:module:pacman' frontend '_pacman_frontend'

if (( $+commands[$_pacman_frontend] )); then
  alias pacman="$_pacman_frontend"

  if [[ -s "${0:h}/${_pacman_frontend}.zsh" ]]; then
    source "${0:h}/${_pacman_frontend}.zsh"
  fi
else
  _pacman_frontend='pacman'
  _pacman_sudo='sudo '
fi

#
# Aliases
#

# Pacman.
alias pac="${_pacman_frontend}"

# Installs packages from repositories.
alias paci="${_pacman_frontend} -S"

# Installs packages from files.
alias pacI="${_pacman_frontend} -U"

# Removes packages and unneeded dependencies.
alias pacx="${_pacman_frontend} -Rs"

# Removes packages, their configuration, and unneeded dependencies.
alias pacX="${_pacman_frontend} -Rns"

# Displays information about a package from the repositories.
alias pacq="${_pacman_frontend} -Si"

# Displays information about a package from the local database.
alias pacQ="${_pacman_frontend} -Qi"

# Searches for packages in the repositories.
if [ "${_pacman_frontend}" = "pacaur" ];then
    alias pacs="${_pacman_frontend} -Ssr"
else
    alias pacs="${_pacman_frontend} -Ss"
fi

# Searches for packages in the local database.
alias pacS="${_pacman_frontend} -Qs"

# Lists orphan packages.
alias pacman-list-orphans="${_pacman_frontend} --query --deps --unrequired"

# Removes orphan packages.
alias pacman-remove-orphans="${_pacman_frontend} --remove --recursive \$(${_pacman_frontend} --quiet --query --deps --unrequired)"

# Synchronizes the local package and Arch Build System databases against the
# repositories.
if (( $+commands[abs] )); then
  alias pacu="${_pacman_frontend} -Sy && ${_pacman_sudo}abs"
else
  alias pacu="${_pacman_frontend} -Sy"
fi

# Synchronizes the local package database against the repositories then
# upgrades outdated packages.
if [ "${_pacman_frontend}" = "pacaur" ];then
    alias pacU="${_pacman_frontend} -Syur"
else
    alias pacU="${_pacman_frontend} -Syu"
fi

# AUR commands

# Upgrades AUR packages only
alias yaU="${_pacman_frontend} -Sua"

# Upgrade AUR packages without asking for edits
alias yau="${_pacman_frontend} -Sua --noedit"

# Search AUR packages
alias yas="${_pacman_frontend} -Ssa"

# Display info about AUR package
alias yaq="${_pacman_frontend} -Sia"

unset _pacman_{frontend,sudo}
