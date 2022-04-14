# install or update packages

platform='unknown'
distro='unknown'

if [[ $OSTYPE == "darwin"* ]]; then
  platform="macos"
elif [[ $OSTYPE == "linux-gnu"* ]]; then
  platform="linux"
fi

if [[ $(date +%u) == 6 || $(date +%u) == 7 ]]; then
  is_weekend=true
fi

function install_taskwarrior() {
  if [[ -x "$(command -v task)" ]]; then
    return
  fi

  if [[ $platform == "macos" ]]; then
    brew install task
  elif [[ $platform == "linux" ]]; then
    echo "Error: unimplemented"
    exit 1
  else
    echo "Error: unimplemented"
    exit 1
  fi
}

function upgrade_taskwarrior() {
  if [[ $platform == "macos" ]]; then
    brew upgrade task
  elif [[ $platform == "linux" ]]; then
    echo "Error: unimplemented"
    exit 1
  else
    echo "Error: unimplemented"
    exit 1
  fi
}

function install_neovim() {
  if [[ -x "$(command -v nvim)" ]]; then
    return
  fi

  if [[ $platform == "macos" ]]; then
    brew install neovim
  elif [[ $platform == "linux" ]]; then
    echo "Error: unimplemented"
    exit 1
  else
    echo "Error: unimplemented"
    exit 1
  fi
}

function upgrade_neovim() {
  if [[ $platform == "macos" ]]; then
    brew upgrade neovim
  elif [[ $platform == "linux" ]]; then
    echo "Error: unimplemented"
    exit 1
  else
    echo "Error: unimplemented"
    exit 1
  fi
}

function install_lunarvim() {
  if ! [[ -x "$(command -v lvim)" ]]; then
    bash <(curl -s https://raw.githubusercontent.com/lunarvim/lunarvim/master/utils/installer/install.sh)
  fi
}

function upgrade_lunarvim() {
  echo "[warn] it's time to upgrade lvim. Open lvim and run :LvimUpdate"
}

function install() {
  install_taskwarrior
  install_neovim
  install_lunarvim

  if [[ $is_weekend == true ]]; then
    echo "[info] upgrading packages"
    upgrade_taskwarrior
    upgrade_neovim
    upgrade_lunarvim
  fi
}

install
