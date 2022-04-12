# install packages (if not yet)

platform='unknown'
distro='unknown'

if [[ $OSTYPE == "darwin"* ]]; then
  platform="macos"
elif [[ $OSTYPE == "linux-gnu"* ]]; then
  platform="linux"
fi

function install_taskwarrior() {
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
function install() {
  install_taskwarrior
}

install
