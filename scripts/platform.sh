platform='unknown'
distro='unknown'

if [[ $OSTYPE == "darwin"* ]]; then
  platform="macos"
elif [[ $OSTYPE == "linux-gnu"* ]]; then
  platform="linux"

  if [[ $(hostnamectl | grep "Operating System") == *"Amazon Linux 2" ]]; then
    distro="al2"
  fi
fi

if [[ $platform == 'unknown' ]]; then
  echo "[error] unknown OS platform. The platform.sh script couldn't locate the OS platform. Without knowing which OS is running, platform-specific functionalities won't work. Please update the platform.sh script to support the new platform."
fi

echo "[info] Platform: $platform, Distro (only needed in Linux): $distro"
