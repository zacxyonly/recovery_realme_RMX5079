# TWRP Device Tree — Realme P3 5G (dongfeng)

[![Recovery](https://img.shields.io/badge/Recovery-TWRP_12.1-2563EB?style=for-the-badge&logo=twrp&logoColor=white)](https://twrp.me/)
[![Device](https://img.shields.io/badge/Device-Realme_P3_5G_(dongfeng)-blue?style=for-the-badge&logo=android&logoColor=white)](https://github.com/zacxyonly/recovery_realme_RMX5079)
[![Base](https://img.shields.io/badge/Base-Android_12.1_LTS-green?style=for-the-badge)](https://github.com/minimal-manifest-twrp/platform_manifest_twrp_aosp)

Dedicated TeamWin Recovery Project (TWRP) device tree for **Realme P3 5G** (`RMX5079`, codename: `dongfeng` / SM6650).

[📖 Main Project Hub](https://github.com/zacxyonly/recovery_realme_RMX5079/tree/main)

---

## 🛠️ Local Build Instructions

```bash
# 1. Initialize TWRP 12.1 minimal manifest
mkdir ~/twrp && cd ~/twrp
repo init --depth=1 -u https://github.com/minimal-manifest-twrp/platform_manifest_twrp_aosp.git -b twrp-12.1
repo sync -c -j$(nproc --all) --force-sync --no-clone-bundle --no-tags

# 2. Clone this tree
git clone -b twrp https://github.com/zacxyonly/recovery_realme_RMX5079.git device/realme/RMX5079

# 3. Build recovery image
source build/envsetup.sh
lunch twrp_RMX5079-eng
make recoveryimage -j$(nproc --all)
```

Output: `out/target/product/RMX5079/recovery.img`

---

## 🚀 Test Boot

```bash
adb reboot bootloader
fastboot boot recovery.img
```
