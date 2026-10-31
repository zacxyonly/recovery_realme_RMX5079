# TeamWin Recovery Project (TWRP) — Realme P3 5G & Neo 7x

<div align="center">

![Recovery](https://img.shields.io/badge/Recovery-TWRP_3.7+-blue?style=for-the-badge&logo=twrp)
![Device](https://img.shields.io/badge/Device-Realme_P3_5G_%2F_Neo_7x-blue?style=for-the-badge)
![SoC](https://img.shields.io/badge/SoC-Qualcomm_Snapdragon_6_Gen_4-red?style=for-the-badge)

**Official device tree configuration for building TWRP on Qualcomm SM6650 (`volcano`).**

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

## ⚡ Fitur Utama Tree Ini
* **Driver Touchscreen Utuh:** Memuat modul kernel `smem` -> `projectinfo` -> `tp_custom` -> `tp_common` -> IC Touchscreen (`ft3518` / `tcm2`).
* **Inisialisasi USB & MTP:** Didukung ConfigFS USB resmi OPLUS (`idVendor 0x22d9`, `idProduct 0x2769`).
* **Dukungan FBE v2 & Keystore:** Menyertakan blob dekripsi QSEECom dan spoofing versi security patch anti-rollback.
* **Super Dynamic Partitions:** Mappings backup flashable image untuk `system`, `vendor`, `product`, `odm`, `system_ext`, dan partisi `my_*`.

---

## 🛠️ Cara Kompilasi Lokal

```bash
# 1. Inisialisasi minimal manifest TWRP
mkdir ~/twrp && cd ~/twrp
repo init --depth=1 -u https://github.com/minimal-manifest-twrp/platform_manifest_twrp_aosp.git -b twrp-12.1
repo sync -c -j$(nproc --all) --force-sync --no-clone-bundle --no-tags

# 2. Clone device tree branch twrp
git clone -b twrp https://github.com/zacxyonly/recovery_realme_RMX5079.git device/realme/RMX5079

# 3. Jalankan build
source build/envsetup.sh
lunch twrp_RMX5079-eng
make recoveryimage -j$(nproc --all)
```

Hasil build berada di `out/target/product/RMX5079/recovery.img`.

---

## 🚀 Panduan Boot Testing (Aman)
> ⚠️ **PERINGATAN**: Selalu gunakan `fastboot boot` terlebih dahulu untuk memastikan recovery berjalan dengan normal tanpa mengubah partisi recovery internal!

```bash
adb reboot bootloader
fastboot boot recovery.img
```
