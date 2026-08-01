# ALK System — Mockup Sistem Pengurusan Kehadiran ALK

Sistem ini adalah **Mockup Website** Pengurusan Kehadiran Pegawai dan Staf Akademi Latihan Ketenteraan (ALK) yang dijalankan secara terus melalui **GitHub Pages**.

🔗 **Live Demo (GitHub Pages):** [https://maui2023.github.io/ALK-SYSTEM](https://maui2023.github.io/ALK-SYSTEM)

---

## 🌟 Ciri-Ciri Mockup

- **100% Serverless & Static**: Dibina sepenuhnya menggunakan **HTML5**, **Vanilla JavaScript**, dan **CSS**. Tidak memerlukan pelayan PHP atau pangkalan data MySQL.
- **Penyimpanan Data Penyemak (Browser Storage)**: Semua rekod (anggota, kehadiran, penyata, log aktiviti) disimpan secara tempatan menggunakan `localStorage` pelayar web.
- **Log Masuk Pintar (Auto-Role Detection)**: Mengesan peranan pengguna secara automatik semasa log masuk dan mengarahkan pengguna ke laman utama yang sesuai.
- **Modul Kehadiran Interaktif**: Merekod kehadiran (Berbaris / Tidak Hadir) mengikut bahagian dengan pilihan modal sebab ketidakhadiran.
- **Penyata Kekuatan Keseluruhan**: Pengiraan automatik jumlah kekuatan mengikut bahagian dan kategori (Dalam Pasukan / Luar Pasukan) berserta fungsi cetak.
- **Direktori Anggota**: Carian dan tapisan anggota mengikut bahagian serta muat naik gambar profil.
- **Pengurusan Pengguna & Log Aktiviti**: Pengurusan akaun pengguna dan rekod sejarah aktiviti secara masa nyata.

---

## 🔑 Maklumat Log Masuk Demo

Sila gunakan maklumat akaun demo di bawah untuk menguji sistem:

| Peranan (Role) | Nama Pengguna (Username) | Kata Laluan (Password) | Akses & Kebenaran |
|----------------|--------------------------|-----------------------|-------------------|
| **Admin** | `admin` | `123456` | Akses Penuh (Direktori, Kehadiran, Penyata, Urus User, Log Aktiviti) |
| **User** | `user1` | `123456` | Akses Pengguna (Direktori, Rekod Kehadiran, Penyata) |
| **Viewer** | `viewer1` | `123456` | Akses Paparan Sahaja (Direktori, Penyata, Dashboard Ringkasan) |

---

## 🚀 Cara Menjalankan Secara Tempatan (Local)

Sistem ini boleh dijalankan terus tanpa memerlukan sebarang web server (Apache/Nginx):

1. **Klon Repositori:**
   ```bash
   git clone https://github.com/maui2023/ALK-SYSTEM.git
   ```
2. **Buka Laman Utama:**
   Buka fail `index.html` terus di mana-mana pelayar web (Chrome, Edge, Firefox, Safari).

---

## 📄 Lesen & Hak Cipta

© Akademi Latihan Ketenteraan · ALK System Mockup