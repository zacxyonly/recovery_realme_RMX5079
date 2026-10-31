# Unified Custom Recovery Tree for Realme P3 5G & Realme Neo 7x

<div align="center">

![Device Codename](https://img.shields.io/badge/Device-Realme_P3_5G_%7C_Neo_7x-blue?style=for-the-badge&logo=android)
![Platform SoC](https://img.shields.io/badge/SoC-Qualcomm_Snapdragon_6_Gen_4_(SM6650)-orange?style=for-the-badge&logo=qualcomm)
![Kernel Base](https://img.shields.io/badge/Kernel-Linux_6.1_GKI-green?style=for-the-badge&logo=linux)
![License](https://img.shields.io/badge/License-Apache_2.0-red?style=for-the-badge)

<br/>

[![Build TWRP Recovery](https://github.com/zacxyonly/custom_recovery_realme_RMX5079/actions/workflows/twrp-build.yml/badge.svg?branch=twrp)](https://github.com/zacxyonly/custom_recovery_realme_RMX5079/actions/workflows/twrp-build.yml)
[![Build OrangeFox Recovery](https://github.com/zacxyonly/custom_recovery_realme_RMX5079/actions/workflows/orangefox-build.yml/badge.svg?branch=fox)](https://github.com/zacxyonly/custom_recovery_realme_RMX5079/actions/workflows/orangefox-build.yml)
[![Latest Release](https://img.shields.io/github/v/release/zacxyonly/custom_recovery_realme_RMX5079?style=flat-square&color=blue)](https://github.com/zacxyonly/custom_recovery_realme_RMX5079/releases)
[![Stars](https://img.shields.io/github/stars/zacxyonly/custom_recovery_realme_RMX5079?style=flat-square)](https://github.com/zacxyonly/custom_recovery_realme_RMX5079/stargazers)

**Comprehensive device configuration tree for building TeamWin Recovery Project (TWRP) and OrangeFox Recovery Project (OFRP) for Qualcomm SM6650 (`volcano` / `dongfeng`) devices.**

</div>

---

## 🗂️ Branch Architecture

This repository maintains separate branches for different custom recovery environments:

| Branch | Recovery Flavor | Base Manifest | Target Status |
| :--- | :--- | :--- | :--- |
| **[`main`](https://github.com/zacxyonly/custom_recovery_realme_RMX5079/tree/main)** | **Overview & Default** | Unified Documentation | Active |
| **[`twrp`](https://github.com/zacxyonly/custom_recovery_realme_RMX5079/tree/twrp)** | **TeamWin Recovery Project** | `minimal-manifest-twrp` (`twrp-12.1` / `twrp-14`) | Tested Build Available |
| **[`fox`](https://github.com/zacxyonly/custom_recovery_realme_RMX5079/tree/fox)** | **OrangeFox Recovery Project** | `OrangeFox/Manifest` (`fox_12.1`) | Automated CI/CD |

---

## 📱 Device Specifications

| Parameter | Technical Details |
| :--- | :--- |
| **Commercial Names** | Realme P3 5G (Global) / Realme Neo 7x (China) |
| **Model Numbers** | `RMX5079`, `RMX5070` (Global) / `RMX5071` (China) |
| **Device Codename** | `dongfeng` / `volcano` |
| **Manufacturer** | Realme / OPLUS |
| **Chipset** | Qualcomm SM6650 Snapdragon 6 Gen 4 ("volcano") |
| **CPU Configuration** | Octa-core (4x Cortex-A720 + 4x Cortex-A520, ARMv8.2-A / ARMv9) |
| **Kernel Version** | Linux 6.1 GKI (`android14-11-o-g0c7c6eb7943d`) |
| **Boot Header** | Version 4 (Virtual A/B) |
| **Storage Architecture** | UFS 3.1 |
| **Partition Scheme** | Dynamic Partitions (Super) - Primary: `erofs`, Fallback: `ext4` |
| **OPLUS Specific Partitions** | `my_product`, `my_carrier`, `my_region`, `my_heytap`, `my_stock`, `my_preload`, `my_manifest`, `my_engineering`, `my_bigball` |
| **Display Panel** | 1080 x 2400 AMOLED, 120Hz Refresh Rate (Center Punch-Hole) |
| **Touchscreen Controllers** | FocalTech FT3518 (`oplus_bsp_tp_ft3518.ko`) / Synaptics TCM2 (`oplus_bsp_synaptics_tcm2.ko`) |
| **Encryption Type** | Hardware-Backed File-Based Encryption (FBE v2) + WrappedKey |

---

## ⚡ Feature Support Status

- [x] Boot Image Header v4 unpacking & repacking
- [x] Prebuilt GKI 6.1 Kernel integration (`Image`, `dtb`, `dtbo.img`)
- [x] OPLUS BSP Touchscreen modular driver hierarchy (`smem` -> `projectinfo` -> `tp_custom` -> `tp_common` -> vendor IC)
- [x] Super Dynamic Partitions mounting (`system`, `system_ext`, `product`, `vendor`, `odm`, `my_*`)
- [x] Dual filesystem handling (`erofs` primary + `ext4` fallback)
- [x] MicroSD Card & USB-OTG external storage access
- [x] Fastbootd mode & ADB recovery interface
- [x] Battery status & Backlight display control
- [ ] Hardware-backed FBE v2 user data decryption (In progress)
- [ ] MTP internal storage transfer (Awaiting field verification)

---

## ⚠️ Disclaimer

> [!WARNING]
> Modifying device firmware and running custom recoveries involves inherent risks.
> - **Always use `fastboot boot` for testing** before considering flashing permanently.
> - The developers and contributors are not responsible for bricked hardware, bootloops, data loss, or voided warranties.
> - Ensure all critical data is backed up before unlocking bootloaders or modifying partitions.

---

## 🚀 Flashing & Usage Guide

### Prerequisites
1. **Unlocked Bootloader**: Bootloader must be officially unlocked (via Deep Testing).
2. **Platform Tools**: Install the latest [Android SDK Platform-Tools](https://developer.android.com/tools/releases/platform-tools).
3. **Recovery Image**: Download `recovery.img` from [GitHub Releases](https://github.com/zacxyonly/custom_recovery_realme_RMX5079/releases).

---

### Step 1: Boot into Fastboot Mode
1. Enable **Developer Options** and turn on **USB Debugging** on your phone.
2. Connect your device to your PC and reboot to bootloader:
   ```bash
   adb reboot bootloader
   ```
   *Alternative*: Power off completely, then hold **Power + Volume Down** until the Fastboot screen appears.
3. Verify connection:
   ```bash
   fastboot devices
   ```

---

### Step 2: Temporary Boot (Recommended & Safest)
> [!IMPORTANT]
> **DO NOT** directly run `fastboot flash recovery recovery.img` on your first attempt!  
> Loading the recovery into RAM with `fastboot boot` ensures your stock recovery remains untouched. If anything freezes, simply reboot the device.

```bash
fastboot boot recovery.img
```

---

### Step 3: Permanent Installation (Once Verified)
Once touchscreen, display, and core functions are verified:
* **Option A (Via Recovery Installer Zip)**:
  Copy the `OrangeFox-*.zip` (or TWRP installer zip) to your MicroSD / USB-OTG and flash it directly from the recovery interface.
* **Option B (Fastboot Flash)**:
  ```bash
  fastboot flash recovery recovery.img
  ```

---

## 🛠️ Building from Source

### 1. Build TWRP Recovery (Branch: `twrp`)
```bash
# Initialize minimal TWRP manifest
mkdir ~/twrp && cd ~/twrp
repo init --depth=1 -u https://github.com/minimal-manifest-twrp/platform_manifest_twrp_aosp.git -b twrp-12.1
repo sync -c -j$(nproc --all) --force-sync --no-clone-bundle --no-tags

# Clone device tree into target path
git clone -b twrp https://github.com/zacxyonly/custom_recovery_realme_RMX5079.git device/realme/RMX5079

# Build
source build/envsetup.sh
lunch twrp_RMX5079-eng
make recoveryimage -j$(nproc --all)
```

### 2. Build OrangeFox Recovery (Branch: `fox`)
```bash
# Initialize OrangeFox manifest
mkdir ~/fox && cd ~/fox
repo init --depth=1 -u https://gitlab.com/OrangeFox/Manifest.git -b fox_12.1
repo sync -c -j$(nproc --all) --force-sync --no-clone-bundle --no-tags

# Clone device tree into target path
git clone -b fox https://github.com/zacxyonly/custom_recovery_realme_RMX5079.git device/realme/RMX5079

# Build
source build/envsetup.sh
lunch twrp_RMX5079-eng
make recoveryimage -j$(nproc --all)
```

---

## 📋 Submitting Feedback & Logs

Field logs from testers are crucial for ongoing refinement:
* **TWRP / OrangeFox Recovery Log**:
  ```bash
  adb pull /tmp/recovery.log
  ```
* **Kernel DMESG Log**:
  ```bash
  adb shell dmesg > dmesg.txt
  ```
* **System Logcat**:
  ```bash
  adb logcat -d > logcat.txt
  ```
Submit issue reports with logs attached at [GitHub Issues](https://github.com/zacxyonly/custom_recovery_realme_RMX5079/issues).

---

## 👥 Credits & Acknowledgements

* **[TeamWin Project (TWRP)](https://twrp.me/)** - Core custom recovery foundation.
* **[OrangeFox Recovery Project](https://orangefox.download/)** - Enhanced recovery framework & UI.
* **[Minimal-Manifest-TWRP](https://github.com/minimal-manifest-twrp)** - Lightweight compilation environment.
* **[LineageOS](https://lineageos.org/)** - Android open source base & hardware interfaces.
* **Realme / OPLUS** - OEM kernel source drops and hardware platform drivers.

---

<div align="center">
<b>Maintained by <a href="https://github.com/zacxyonly">@zacxyonly</a></b>
</div>
