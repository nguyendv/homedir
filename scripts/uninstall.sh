function uninstall_lunarvim() {
  bash <(curl -s https://raw.githubusercontent.com/lunarvim/lunarvim/master/utils/installer/uninstall.sh)
  echo "[info] lunarvim has been uninstalled"
}

echo "[info] Uninstalling $1"
uninstall_$1
