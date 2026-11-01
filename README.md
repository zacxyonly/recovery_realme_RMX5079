# OrangeFox Device Tree — Realme P3 5G / Neo 7x

[![Recovery](https://img.shields.io/badge/Recovery-OrangeFox_R12.1-EA580C?style=for-the-badge&logo=android&logoColor=white)](https://orangefox.download/)
[![Device](https://img.shields.io/badge/Device-RMX5079_%7C_RMX5070-blue?style=for-the-badge&logo=android&logoColor=white)](https://github.com/zacxyonly/recovery_realme_RMX5079)
[![Base](https://img.shields.io/badge/Base-Fox_12.1_LTS-green?style=for-the-badge)](https://gitlab.com/orangefox)

Dedicated OrangeFox Recovery Project (OFRP) device tree for **Realme P3 5G** and **Realme Neo 7x** (`RMX5079` / `RMX5070` / `RMX5071`, SM6650 / `volcano`).

[📖 Main Project Hub](https://github.com/zacxyonly/recovery_realme_RMX5079/tree/main)

---

## 🦊 OrangeFox Configurations

- **Version**: `R12.1_0`
- **Magiskboot**: Native boot patching support enabled
- **Display Geometry**: Tuned for AMOLED center punch-hole (`OF_STATUS_H := 95`, `OF_STATUS_INDENT := 48`)
- **Partitions**: Super dynamic partition support via `lptools`

---

## 🛠️ Local Build Instructions

```bash
# 1. Sync official OrangeFox R12.1 environment
git clone https://gitlab.com/orangefox/sync.git ~/orangefox_sync
cd ~/orangefox_sync
./orangefox_sync.sh --branch 12.1 --path ~/fox

# 2. Clone this tree
git clone -b orangefox https://github.com/zacxyonly/recovery_realme_RMX5079.git ~/fox/device/realme/RMX5079

# 3. Build OrangeFox recovery
cd ~/fox
export ALLOW_MISSING_DEPENDENCIES=true
export FOX_USE_TWRP_RECOVERY_IMAGE_BUILDER=1
source build/envsetup.sh
lunch twrp_RMX5079-eng
make recoveryimage -j$(nproc --all)
```

Outputs: `out/target/product/RMX5079/recovery.img` and `OrangeFox-*.zip`

---

## 🚀 Test Boot

```bash
adb reboot bootloader
fastboot boot recovery.img
```
