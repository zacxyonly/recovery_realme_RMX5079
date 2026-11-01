# Custom Recovery for Realme P3 5G (dongfeng)

[![Device](https://img.shields.io/badge/Device-Realme_P3_5G_(dongfeng)-2563EB?style=for-the-badge&logo=android&logoColor=white)](https://github.com/zacxyonly/recovery_realme_RMX5079)
[![SoC](https://img.shields.io/badge/SoC-Snapdragon_6_Gen_4-EA580C?style=for-the-badge&logo=qualcomm&logoColor=white)](https://www.qualcomm.com/)
[![Kernel](https://img.shields.io/badge/Kernel-Linux_6.1_GKI-16A34A?style=for-the-badge&logo=linux&logoColor=white)](https://kernel.org/)
[![License](https://img.shields.io/badge/License-Apache_2.0-DC2626?style=for-the-badge)](LICENSE)

Unified repository and automated CI/CD pipeline for building custom recoveries (**TWRP** and **OrangeFox**) specifically for **Realme P3 5G** (`RMX5079`, codename: `dongfeng` / SM6650).

---

## 🧭 Branches

| Branch | Description | Base Manifest | Status |
|:---|:---|:---|:---|
| **[`main`](https://github.com/zacxyonly/recovery_realme_RMX5079/tree/main)** | Documentation hub & CI/CD workflows | N/A | Active |
| **[`twrp`](https://github.com/zacxyonly/recovery_realme_RMX5079/tree/twrp)** | TeamWin Recovery Project device tree | `twrp-12.1` | Ready |
| **[`orangefox`](https://github.com/zacxyonly/recovery_realme_RMX5079/tree/orangefox)** | OrangeFox Recovery Project device tree | `fox_12.1` (`R12.1`) | Ready |

---

## 📱 Device Specifications

| Attribute | Specification |
|:---|:---|
| **Device** | Realme P3 5G |
| **Model** | `RMX5079` |
| **Codename** | `dongfeng` / `volcano` |
| **SoC** | Qualcomm Snapdragon 6 Gen 4 (SM6650, 4nm) |
| **Kernel** | Linux 6.1 GKI (Boot Header v4) |
| **Storage** | UFS 3.1 (Dynamic Partitions / `erofs` & `ext4`) |
| **Display** | 1080 x 2400 AMOLED 120Hz (Center Punch-Hole) |

---

## ⚡ Key Features

- **Touchscreen**: Full OPLUS BSP dependency chain pre-loaded (`ft3518` & `tcm2`).
- **USB & MTP**: Native OPLUS ConfigFS (`0x22d9:0x2769`) for ADB and fast file transfer.
- **Partitions**: Super dynamic partition mounting (`system`, `vendor`, `product`, `odm`, `my_*`).
- **Storage**: Internal storage, MicroSD card, and USB-OTG supported.
- **Crypto**: Qualcomm Keystore & QSEECom integration for hardware-backed FBE.

---

## 📥 Downloads & Automated Builds

Pre-compiled recovery images are built via GitHub Actions and published under [**Releases**](https://github.com/zacxyonly/recovery_realme_RMX5079/releases).

To build manually:
1. Go to [**Actions**](https://github.com/zacxyonly/recovery_realme_RMX5079/actions).
2. Choose **Build TWRP Recovery** or **Build OrangeFox Recovery**.
3. Click **Run workflow**.

---

## 🚀 Installation Guide

> [!WARNING]
> Your bootloader must be unlocked via official Deep Testing before flashing. Always test with `fastboot boot` before writing to partition!

### 1. Temporary Boot (Recommended)
```bash
adb reboot bootloader
fastboot boot recovery.img
```

### 2. Permanent Installation
Once verified working:
```bash
fastboot flash recovery recovery.img
```
*Or flash the recovery zip directly inside recovery environment.*

---

## 🤝 Credits

- **[TeamWin (TWRP)](https://twrp.me/)** & **[OrangeFox Recovery Project](https://orangefox.download/)**
- **[Minimal-Manifest-TWRP](https://github.com/minimal-manifest-twrp)**
- **Realme / OPLUS** — Kernel sources and hardware blobs
- **[Arunpain](https://github.com/Arunpain)** — Reference configuration

---

<div align="center">
Maintained by <a href="https://github.com/zacxyonly"><b>@zacxyonly</b></a>
</div>
