#!/bin/bash

set -euo pipefail
LOGFILE="$HOME/.local/share/arch-maintain.log"
mkdir -p "$(dirname "$LOGFILE")"

log(){
	echo -e "[$(date '+%F %T')] $1" | tee -a "$LOGFILE"
}

log "🔧 Starting Arch Maintenance Script"


log "📦 Updating system packages..."
sudo pacman -Syu --noconfirm


if command -v paru &>/dev/null; then
  log "📦 Updating AUR packages with paru..."
  paru -Syu --noconfirm
elif command -v yay &>/dev/null; then
  log "📦 Updating AUR packages with yay..."
  yay -Syu --noconfirm
fi


log "🧹 Removing orphaned packages..."
orphans=$(pacman -Qdtq || true)
if [ -n "$orphans" ]; then
  sudo pacman -Rns --noconfirm $orphans
  log "✅ Removed orphans: $orphans"
else
  log "👍 No orphaned packages found."
fi


log "🧼 Cleaning pacman cache (keeping last 3 versions)..."
sudo paccache -rk3


log "🌐 Updating mirrorlist with reflector..."
if command -v reflector &>/dev/null; then
  sudo reflector --country India --age 12 --protocol https --sort rate --save /etc/pacman.d/mirrorlist
else
  log "⚠️ Reflector not installed. Skipping mirror update."
fi


log "🚨 Checking failed systemd services..."
FAILED=$(systemctl --failed --no-legend)
if [ -n "$FAILED" ]; then
  log "❌ Failed services found:\n$FAILED"
else
  log "✅ No failed services."
fi


if command -v flatpak &>/dev/null; then
  log "📦 Updating Flatpak apps..."
  flatpak update -y
fi


log "✅ Arch maintenance complete. Log saved to $LOGFILE"
