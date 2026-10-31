# Unified Custom Recovery Project for Realme P3 5G & Neo 7x

<div align="center">

![Device Codename](https://img.shields.io/badge/Device-Realme_P3_5G_%7C_Neo_7x-blue?style=for-the-badge&logo=android)
![Platform SoC](https://img.shields.io/badge/SoC-Qualcomm_Snapdragon_6_Gen_4_(SM6650)-orange?style=for-the-badge&logo=qualcomm)
![Kernel Base](https://img.shields.io/badge/Kernel-Linux_6.1_GKI-green?style=for-the-badge&logo=linux)
![License](https://img.shields.io/badge/License-Apache_2.0-red?style=for-the-badge)

<br/>

[![Build TWRP Recovery](https://github.com/zacxyonly/recovery_realme_RMX5079/actions/workflows/twrp-build.yml/badge.svg?branch=main)](https://github.com/zacxyonly/recovery_realme_RMX5079/actions/workflows/twrp-build.yml)
[![Build OrangeFox Recovery](https://github.com/zacxyonly/recovery_realme_RMX5079/actions/workflows/orangefox-build.yml/badge.svg?branch=main)](https://github.com/zacxyonly/recovery_realme_RMX5079/actions/workflows/orangefox-build.yml)
[![Latest Release](https://img.shields.io/github/v/release/zacxyonly/recovery_realme_RMX5079?style=flat-square&color=blue)](https://github.com/zacxyonly/recovery_realme_RMX5079/releases)
[![Stars](https://img.shields.io/github/stars/zacxyonly/recovery_realme_RMX5079?style=flat-square)](https://github.com/zacxyonly/recovery_realme_RMX5079/stargazers)

**Master documentation and CI/CD hub for compiling custom recoveries on Qualcomm Snapdragon 6 Gen 4 SM6650 (`volcano` / `dongfeng`) devices.**

</div>

---

## 🗂️ Branch Architecture

Repository ini menggunakan struktur multi-branch yang bersih dan terisolasi:

| Branch | Jenis Recovery | Deskripsi & Isi | Status |
| :--- | :--- | :--- | :--- |
| **[`main`](https://github.com/zacxyonly/recovery_realme_RMX5079/tree/main)** | **Dokumentasi & Hub CI/CD** | Halaman utama, spesifikasi, panduan flashing, dan workflow GitHub Actions | Aktif |
| **[`twrp`](https://github.com/zacxyonly/recovery_realme_RMX5079/tree/twrp)** | **TeamWin Recovery Project** | Device tree TWRP lengkap (modul touch, USB ConfigFS OPLUS, Keystore FBE v2) | Siap Kompilasi |
| **[`orangefox`](https://github.com/zacxyonly/recovery_realme_RMX5079/tree/orangefox)** | **OrangeFox Recovery Project** | Device tree OrangeFox (geometri punch-hole, Magiskboot, lptools) | Siap Kompilasi |

---

## 📱 Spesifikasi Teknis Perangkat

| Parameter | Keterangan Teknis |
| :--- | :--- |
| **Nama Komersial** | Realme P3 5G (Global) / Realme Neo 7x (China) |
| **Nomor Model** | `RMX5079`, `RMX5070` (Global) / `RMX5071` (China) |
| **Codename** | `dongfeng` / `volcano` |
| **Pabrikan** | Realme / OPLUS |
| **Chipset** | Qualcomm SM6650 Snapdragon 6 Gen 4 ("volcano") |
| **CPU Architecture** | Octa-core (4x Cortex-A720 + 4x Cortex-A520, ARMv8.2-A / ARMv9) |
| **Kernel Version** | Linux 6.1 GKI (`android14-11-o-g0c7c6eb7943d`) |
| **Boot Header** | Versi 4 (Virtual A/B) |
| **Storage Architecture** | UFS 3.1 (`/sys/devices/platform/soc/1d84000.ufshc`) |
| **Skema Partisi** | Dynamic Partitions (Super) — Primary: `erofs`, Fallback: `ext4` |
| **Partisi Khusus OPLUS** | `my_product`, `my_carrier`, `my_region`, `my_heytap`, `my_stock`, `my_preload`, `my_manifest`, `my_engineering`, `my_bigball` |
| **Panel Layar** | 1080 x 2400 AMOLED, 120Hz Refresh Rate (Center Punch-Hole) |
| **Touchscreen Controllers** | FocalTech FT3518 (`oplus_bsp_tp_ft3518.ko`) / Synaptics TCM2 (`oplus_bsp_synaptics_tcm2.ko`) |
| **Enkripsi Data** | Hardware-Backed File-Based Encryption (FBE v2) + WrappedKey |

---

## ⚡ Fitur Utama Recovery Tree

- [x] Mendukung Boot Image Header v4 (Kernel terpisah dari recovery image)
- [x] Integrasi kernel GKI 6.1 dan DTBO prebuilt (`kernel`, `dtb`, `dtbo.img`)
- [x] Rantai ketergantungan driver layar sentuh OPLUS BSP (`smem` -> `projectinfo` -> `tp_custom` -> `tp_common` -> IC Touch)
- [x] Inisialisasi USB & MTP resmi OPLUS (`idVendor 0x22d9`, `idProduct 0x2769`)
- [x] Blob dekripsi Keystore & QSEECom untuk persiapan dekripsi userdata
- [x] Mounting Super Dynamic Partitions (`system`, `system_ext`, `product`, `vendor`, `odm`, `my_*`)
- [x] Dual filesystem handling (`erofs` & `ext4`)
- [x] Akses MicroSD Card & USB-OTG external storage
- [x] Mode Fastbootd & ADB recovery interface
- [x] Status Baterai & Backlight kontrol kecerahan

---

## 🚀 Panduan Flashing & Penggunaan (Aman)

### Persyaratan:
1. **Bootloader Unlocked**: Bootloader telah di-unlock resmi (via Deep Testing).
2. **Platform Tools**: Menggunakan [Android SDK Platform-Tools](https://developer.android.com/tools/releases/platform-tools) terbaru.
3. **File Recovery**: Unduh `recovery.img` dari menu [Releases](https://github.com/zacxyonly/recovery_realme_RMX5079/releases).

---

### Langkah 1: Masuk ke Mode Fastboot
1. Aktifkan **Developer Options** dan nyalakan **USB Debugging** di ponsel.
2. Sambungkan ponsel ke PC dan jalankan:
   ```bash
   adb reboot bootloader
   ```
   *(Atau matikan HP, lalu tahan **Power + Volume Bawah** sampai muncul logo Fastboot)*.
3. Pastikan koneksi terdeteksi:
   ```bash
   fastboot devices
   ```

---

### Langkah 2: Temporary Boot (SANGAT DIREKOMENDASIKAN)
> [!IMPORTANT]
> **JANGAN LANGSUNG FLASH SECARA PERMANEN!**  
> Gunakan perintah `fastboot boot` terlebih dahulu untuk memuat recovery ke RAM tanpa menyentuh partisi bawaan ponsel. Jika layar sentuh macet atau terjadi freeze, cukup restart ponsel untuk kembali ke sistem normal.

```bash
fastboot boot recovery.img
```

---

### Langkah 3: Pemasangan Permanen (Setelah Diverifikasi Normal)
Setelah touch screen, tampilan, dan fungsi dasar terbukti berjalan lancar:
* **Metode 1 (Flash Installer Zip di Recovery)**:
  Salin file `OrangeFox-*.zip` (atau installer zip) ke MicroSD / USB-OTG, lalu flash langsung dari menu recovery.
* **Metode 2 (Fastboot Flash)**:
  ```bash
  fastboot flash recovery recovery.img
  ```

---

## ☁️ Manual Cloud Build (GitHub Actions)

Build otomatis saat push telah dinonaktifkan untuk menghemat kuota build. Build dijalankan secara manual (*on-demand*) melalui **Workflow Dispatch**:

1. Buka tab **[Actions](https://github.com/zacxyonly/recovery_realme_RMX5079/actions)** pada repository ini.
2. Pilih menu di sebelah kiri:
   - **Build TWRP Recovery**, atau
   - **Build OrangeFox Recovery**
3. Klik tombol biru **"Run workflow"**:
   - **Manifest Branch**: Pilih versi basis manifest (`twrp-12.1`/`twrp-14` atau `12.1`/`14.1`).
   - **Custom Version Tag**: Isi tag kustom (misal `v1.0-test`) atau kosongkan untuk tag otomatis berdasarkan tanggal.
   - **Release Classification**: Pilih `pre-release`, `release`, atau `test-build`.
   - **Publish as GitHub Release**: Centang untuk mempublikasikan hasil build secara instan ke tab Releases lengkap dengan checksum `sha256.txt`.

---

## 👥 Kredit & Kontributor

* **[TeamWin Project (TWRP)](https://twrp.me/)**
* **[OrangeFox Recovery Project](https://orangefox.download/)**
* **[Minimal-Manifest-TWRP](https://github.com/minimal-manifest-twrp)**
* **Realme / OPLUS** - Kernel sources & hardware drivers
* **Arunpain** - Referensi konfigurasi USB ConfigFS & Keystore blobs

---

<div align="center">
<b>Maintained by <a href="https://github.com/zacxyonly">@zacxyonly</a></b>
</div>
