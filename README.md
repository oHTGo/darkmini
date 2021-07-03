# Dark Mini

Dark theme for rEFInd

[rEFInd](http://www.rodsbooks.com/refind/) is a simplistic boot manager for UEFI
based systems. This is a clean, dark and minimal theme for it.

### Usage
 1. Locate your refind EFI directory. This is commonly `/boot/EFI/refind`
    though it will depend on where you mount your ESP and where rEFInd is
    installed. `fdisk -l` and `mount` may help.
 2. Create a folder called `themes` inside it, if it doesn't already exist
 3. Clone this repository into the `themes` directory.
 4. To enable the theme add `include themes/darkmini/theme-mini.conf` at the end of refind.conf
 5. Set option `banner` in theme file for select background image
    Ex: `banner themes/darkmini/bg/ubuntu_style.png`

### Auto install
After configuring the files according to your needs, run one of the following commands:

- For Debian, Ubuntu, Kali (Linux): you run `sudo bash ./scripts/linux-debian.sh`
- For Windows 10: you run `cmd` as admin with `scripts\windows`