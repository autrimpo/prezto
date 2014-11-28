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
  #alias pacman="$_pacman_frontend"
  _pacman_sudo='sudo '

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
alias paci="${_pacman_sudo}${_pacman_frontend} -S"

# Installs packages from files.
alias pacI="${_pacman_sudo}${_pacman_frontend} -U"

# Removes packages and unneeded dependencies.
alias pacx="${_pacman_sudo}${_pacman_frontend} -Rs"

# Removes packages, their configuration, and unneeded dependencies.
alias pacX="${_pacman_sudo}${_pacman_frontend} -Rns"

# Displays information about a package from the repositories.
alias pacq="${_pacman_frontend} -Si"

# Displays information about a package from the local database.
alias pacQ="${_pacman_frontend} -Qi"

# Searches for packages in the repositories.
alias pacs="${_pacman_frontend} -Ss"

# Searches for packages in the local database.
alias pacS="${_pacman_frontend} -Qs"

# Lists orphan packages.
alias paco="${_pacman_frontend} -O"

# Removes orphan packages.
alias pacox"${_pacman_sudo}${_pacman_frontend} --remove --recursive \$(${_pacman_frontend} --quiet --query --deps --unrequired)"

# Synchronizes the local package and Arch Build System databases against the
# repositories.
if (( $+commands[abs] )); then
  alias pacu="${_pacman_sudo}${_pacman_frontend} -Sy && ${_pacman_sudo}abs"
else
  alias pacu="${_pacman_sudo}${_pacman_frontend} -Sy"
fi

# Synchronizes the local package database against the repositories then
# upgrades outdated packages.
alias pacU="${_pacman_sudo}${_pacman_frontend} -Syu"

# AUR commands
# Installs a package from AUR
alias yai="${_pacman_sudo}${_pacman_frontend} -A"

# Upgrades AUR packages only
alias yau="${_pacman_sudo}${_pacman_frontend} -Au"

# Upgrade all AUR packages, show PKGBUILD diffs, and remove unneeded makedeps after installation
alias yaU="${_pacman_sudo}${_pacman_frontend} -Akua"

# Search AUR packages
alias yas="${_pacman_frontend} -ASs"

# Display info about AUR package
alias yaq="${_pacman_frontend} -ASi"

unset _pacman_{frontend,sudo}
