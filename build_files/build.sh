#!/bin/bash

set -ouex pipefail

### Install packages

# Packages can be installed from any enabled yum repo on the image.
# RPMfusion repos are available by default in ublue main images
# List of rpmfusion packages can be found here:
# https://mirrors.rpmfusion.org/mirrorlist?path=free/fedora/updates/39/x86_64/repoview/index.html&protocol=https&redirect=1

# this installs a package from fedora repos
dnf5 install -y gdm niri 
#install AGS and dependencies
dnf5 install -y dunst grim slurp gtk4 gtk4-layer-shell gjs NetworkManager NetworkManager-libnm-devel bluez wireplumber wireplumber-devel pipewire libnotify upower-devel libappindicator-gtk3-devel 
dnf5 -y copr enable solopasha/hyprland
dnf5 -y install aylurs-gtk-shell2 cliphist nwg-look
dnf5 -y copr disable solopasha/hyprland
#Install bazaar
dnf5 -y copr enable ublue-os/staging
dnf5 -y install bazaar fwupd
dnf5 -y copr disable ublue-os/staging
#Virtualisation setup
#dnf5 install -y virt-manager

# Use a COPR Example:
#
# dnf5 -y copr enable ublue-os/staging
# dnf5 -y install package
# Disable COPRs so they don't end up enabled on the final image:
# dnf5 -y copr disable ublue-os/staging

#### Example for enabling a System Unit File

systemctl enable podman.socket
systemctl enable gdm.service
