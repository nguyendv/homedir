# "import" platform.sh
. ./platform.sh


function upgrade_taskwarrior() {
  echo "[info] upgrading taskwarrior on platform=$platform and distro=$distro"
  if [[ $platform == "macos" ]]; then
    brew upgrade task
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

function upgrade_neovim() {
  echo "[info] upgrading neovim"
  if [[ $platform == "macos" ]]; then
    brew upgrade neovim
  elif [[ $platform == "linux" ]]; then
    if [[ $distro == "al2" ]]; then
      cd ~/src/github.com/neovim
      git pull
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

function upgrade_lunarvim() {
  echo "[info] upgrading lvim"
  lvim +LvimUpdate +q
  echo "[warn] it's time to upgrade neovim plugins. Open lvim and run :LvimSyncPlugins"
}

function update() {
  echo "[info] upgrading packages"
  # upgrade_taskwarrior
  upgrade_neovim
  upgrade_lunarvim
}

update
