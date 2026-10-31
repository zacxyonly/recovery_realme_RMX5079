# OrangeFox Recovery Project (OFRP) — Realme P3 5G & Neo 7x

<div align="center">

![Recovery](https://img.shields.io/badge/Recovery-OrangeFox_R12.1-orange?style=for-the-badge&logo=android)
![Device](https://img.shields.io/badge/Device-Realme_P3_5G_%2F_Neo_7x-blue?style=for-the-badge)
![SoC](https://img.shields.io/badge/SoC-Qualcomm_Snapdragon_6_Gen_4-red?style=for-the-badge)

**Official device tree configuration for building OrangeFox Recovery Project on Qualcomm SM6650 (`volcano`).**

[📖 Hub Utama & Dokumentasi Lengkap (Branch: main)](https://github.com/zacxyonly/recovery_realme_RMX5079/tree/main)

</div>

---

## 📱 Ringkasan Perangkat
* **Model Komersial:** Realme P3 5G / Realme Neo 7x
* **Kode Model:** `RMX5079`, `RMX5070`, `RMX5071`
* **Codename:** `dongfeng` / `volcano`
* **Chipset:** Qualcomm Snapdragon 6 Gen 4 (SM6650)
* **Kernel:** Linux 6.1 GKI (`android14-11-o-g0c7c6eb7943d`)
* **Layar:** 1080 x 2400 AMOLED (Center Punch-Hole)

---

## 🦊 Konfigurasi Khusus OrangeFox (OFRP)
* **Magisk & Root:** `OF_USE_MAGISKBOOT := 1` (Patching boot otomatis langsung di recovery)
* **Status Bar & Notch:** Disesuaikan dengan geometri layar punch-hole Realme P3 (`OF_STATUS_H := 95`, `OF_STATUS_INDENT := 48`)
* **Dynamic Partitions:** Super partition support via `lptools` (`OF_ENABLE_LPTOOLS := 1`)
* **Touchscreen Driver:** Termasuk modul lengkap FocalTech (`oplus_bsp_tp_ft3518.ko`) dan Synaptics (`oplus_bsp_synaptics_tcm2.ko`)

---

## 🛠️ Cara Kompilasi Lokal

```bash
# 1. Clone tool sync resmi OrangeFox
git clone https://gitlab.com/orangefox/sync.git ~/orangefox_sync
cd ~/orangefox_sync
./orangefox_sync.sh --branch 12.1 --path ~/fox

# 2. Clone device tree branch orangefox
git clone -b orangefox https://github.com/zacxyonly/recovery_realme_RMX5079.git ~/fox/device/realme/RMX5079

# 3. Jalankan build
cd ~/fox
export ALLOW_MISSING_DEPENDENCIES=true
export FOX_USE_TWRP_RECOVERY_IMAGE_BUILDER=1
source build/envsetup.sh
lunch twrp_RMX5079-eng
make recoveryimage -j$(nproc --all)
```

Hasil build berada di `out/target/product/RMX5079/recovery.img` dan `OrangeFox-*.zip`.

---

## 🚀 Panduan Boot Testing (Aman)
> ⚠️ **PERINGATAN**: Selalu gunakan `fastboot boot` terlebih dahulu untuk memastikan recovery berjalan dengan normal tanpa mengubah partisi recovery internal!

```bash
adb reboot bootloader
fastboot boot recovery.img
```
