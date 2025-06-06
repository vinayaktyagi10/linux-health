# linux-health

linux-health is a personal system maintenance utility designed for Arch Linux users. It features a comprehensive Bash script — arch-maintain — that automates routine update and cleanup tasks, ensuring your system remains fast, clean, and up-to-date.

---

## Features

-Updates system packages via pacman

-Supports AUR updates via paru or yay

-Removes orphaned packages

-Cleans up pacman cache (keeps last 3 versions)

-Updates mirrorlist using reflector (India mirrors, fastest first)

-Checks for failed systemd services

-Updates Flatpak apps (if Flatpak is installed)

-Logs all actions to: ~/.local/share/arch-maintain.log

---

## Requirements

-Arch Linux (or Arch-based distro)

-sudo privileges

-Optionally:

   -yay or paru for AUR updates

   -reflector for mirrorlist update

   -flatpak for Flatpak app updates

---

## Usage

1. **Clone this repo:**

    ```bash
    git clone https://github.com/your-username/linux-health.git
    cd linux-health
    ```

2. **Make the script executable:**

    ```bash
    chmod +x arch-maintain
    ```

3. **Run the script:**

    ```bash
    ./arch-maintain
    ```

    Or add it to your `PATH` and use it like any other command.

---

## Sample Log Output

A log is saved to ~/.local/share/arch-maintain.log every time the script runs, including timestamps and update status.


[2025-06-04 04:34:37] 🔧 Starting Arch Maintenance Script

[2025-06-04 04:34:37] 📦 Updating system packages...

[2025-06-04 04:36:10] 📦 Updating AUR packages with paru...

[2025-06-04 04:36:14] 🧹 Removing orphaned packages...

[2025-06-04 04:36:14] 👍 No orphaned packages found.

[2025-06-04 04:36:14] 🧼 Cleaning pacman cache (keeping last 3 versions)...

[2025-06-04 04:36:14] 🌐 Updating mirrorlist with reflector...

[2025-06-04 04:36:23] 🚨 Checking failed systemd services...

[2025-06-04 04:36:23] ✅ No failed services.

[2025-06-04 04:36:23] 📦 Updating Flatpak apps...

[2025-06-04 04:36:52] ✅ Arch maintenance complete. Log saved to ~/.local/share/arch-maintain.log

---

## Customization

You can customize the script to:

   -Use different countries in reflector

   -Keep more or fewer versions in paccache

   -Add your own maintenance commands

---

## Contributing

Pull requests are welcome. Feel free to fork and tweak to your needs.

MIT License — see LICENSE file for details.
