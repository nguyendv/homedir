# "import" platform.sh
. ./platform.sh


function install_taskwarrior() {
  echo "[info] installing taskwarrior on platform=$platform and distro=$distro"
  if [[ -x "$(command -v task)" ]]; then
    echo "[info] skipping installing taskwarrior. The nvim binary is detected in the current system"
    return
  fi

  if [[ $platform == "macos" ]]; then
    brew install task
  elif [[ $platform == "linux" ]]; then
    if [[ $distro == "al2" ]]; then
      echo "[info] I don't have a plan to install taskwarrior on AmazonLinux2"
    else
      echo "Error: unimplemented"
      exit 1
    fi
  else
    echo "Error: unimplemented"
    exit 1
  fi
}

function install_neovim() {
  echo "[info] installing neovim on platform=$platform and distro=$distro"
  if [[ -x "$(command -v nvim)" ]]; then
    echo "[info] skipping installing neovim. The nvim binary is detected in the current system"
    return
  fi

  if [[ $platform == "macos" ]]; then
    brew install neovim
  elif [[ $platform == "linux" ]]; then
    if [[ $distro == "al2" ]]; then
      mkdir -p ~/src/github.com
      cd ~/src/github.com
      git clone https://github.com/neovim/neovim
      cd neovim
      make CMAKE_BUILD_TYPE=Release
      sudo make install
    else
      echo "Error: unimplemented"
      exit 1
    fi
  else
    echo "Error: unimplemented"
    exit 1
  fi
}

function install_lunarvim() {
  echo "[info] install lunarvim"
  if [[ -x "$(command -v lvim)" ]]; then
    echo "[info] skipping installing lunarvim. The lvim binary is detected in the current system"
    return
  fi
  bash <(curl -s https://raw.githubusercontent.com/lunarvim/lunarvim/master/utils/installer/install.sh)
}

function install() {
  # install_taskwarrior
  install_neovim
  install_lunarvim
}

install
