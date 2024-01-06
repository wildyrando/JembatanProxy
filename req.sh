#!/bin/bash
#
#  JembatanProxy
#  Berfungsi untuk meneruskan traffic 80/443 ke suatu proxy server
#
#  Author : Wildy Sheverando <hai@wildyrando.com>
#  Repo   : https://github.com/wildyrando/JembatanProxy
#
#  This Project Licensed under MIT License
#  https://raw.githubusercontent.com/wildyrando/JembatanProxy/main/LICENSE
# ------------------------------------------------------------------------------

# >> Check sudoer
if ! [[ $(whoami) == 'root' ]]; then
  echo "Silakan jalankan program ini dalam root"
  exit
fi

# >> Check installation command
if command -V apt > /dev/null 2>&1; then
  export SEPUH="apt"
elif command -V dnf > /dev/null 2>&1; then
  export SEPUH="dnf"
else
  echo "Script ini tidak mendukung os anda, silakan install iptables dan requirements secara manual"
  exit
fi

# >> Install
$SEPUH update -y; $SEPUH upgrade -y
$SEPUH install iptables ip6tables -y

# >> Done
echo "Installasi berhasil."
