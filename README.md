<div align="center">

# 🏥 Covid-19 Patients Monitoring Dashboard

### Sistem Monitoring Pasien COVID-19 Berbasis IoT & Real-Time

[![Laravel](https://img.shields.io/badge/Laravel-10-FF2D20?style=for-the-badge&logo=laravel&logoColor=white)](https://laravel.com)
[![Next.js](https://img.shields.io/badge/Next.js-13-000000?style=for-the-badge&logo=nextdotjs&logoColor=white)](https://nextjs.org)
[![TypeScript](https://img.shields.io/badge/TypeScript-5-3178C6?style=for-the-badge&logo=typescript&logoColor=white)](https://www.typescriptlang.org)
[![MySQL](https://img.shields.io/badge/MySQL-8-4479A1?style=for-the-badge&logo=mysql&logoColor=white)](https://www.mysql.com)
[![Tailwind CSS](https://img.shields.io/badge/Tailwind-3-06B6D4?style=for-the-badge&logo=tailwindcss&logoColor=white)](https://tailwindcss.com)

> Dikembangkan bersama **Lab ESD – Telkom University** · 2023

</div>

---

## Apa itu Proyek Ini?

Bayangkan sebuah rumah sakit yang merawat banyak pasien COVID-19. Dokter dan perawat perlu memantau kondisi setiap pasien — detak jantung, saturasi oksigen, suhu tubuh, tekanan darah, laju pernapasan — **setiap saat, secara bersamaan**. Tanpa sistem digital, ini membutuhkan waktu, tenaga, dan rentan terhadap kelalaian manusia.

**Patient Monitoring System** hadir sebagai solusinya: sebuah dashboard web yang terhubung langsung ke perangkat IoT di ruang pasien. Data tanda-tanda vital masuk secara otomatis setiap 5 detik, ditampilkan dalam grafik real-time, dan tenaga medis bisa memantau seluruh pasien dari satu layar.

---

## Fitur Utama

### 🔴 Monitoring Real-Time
Data tanda-tanda vital pasien diperbarui **otomatis setiap 5 detik** dari perangkat IoT tanpa perlu refresh halaman.

| Parameter | Keterangan |
|-----------|------------|
| ❤️ Heart Rate (HR) | Detak jantung (bpm) |
| 🫁 Respiration Rate (RR) | Laju pernapasan |
| 💧 SpO2 | Saturasi oksigen dalam darah |
| 🌡️ Temperature | Suhu tubuh |
| 🩺 NIBP | Tekanan darah non-invasif (systolic/diastolic) |

### 📊 Visualisasi Grafik
Setiap parameter ditampilkan dalam **grafik garis interaktif** (Chart.js) yang menunjukkan 20 data terakhir, memudahkan dokter melihat tren kondisi pasien.

### 🏨 Manajemen Rumah Sakit Lengkap
Selain monitoring, sistem ini juga mencakup seluruh alur operasional rumah sakit:

- **Admisi Pasien** — pendaftaran masuk dan keluar pasien
- **Data Pasien** — rekam medis lengkap (IPPN, resep, lab, radiologi)
- **Master Data** — manajemen dokter, perawat, bangsal, kamar, obat, lab, radiologi
- **Early Warning System (EWS)** — peringatan dini berbasis IoT

### 🌐 Bilingual (EN / ID)
Antarmuka tersedia dalam **Bahasa Inggris dan Bahasa Indonesia**.

---

## Tampilan Aplikasi

> *Screenshot menyusul — jalankan proyek secara lokal untuk melihat tampilannya*

| Halaman | Deskripsi |
|---------|-----------|
| Dashboard EWS | Daftar semua pasien + grafik vital real-time |
| Detail Pasien | Grafik per parameter + riwayat pemeriksaan |
| Master Data | CRUD dokter, perawat, kamar, obat, dll |
| Admisi | Pendaftaran masuk/keluar pasien |

---

## Arsitektur Sistem

```
┌─────────────────────────────────────────────────┐
│                  PERANGKAT IoT                  │
│         (sensor di ruang pasien)                │
└────────────────────┬────────────────────────────┘
                     │ kirim data vital
                     ▼
┌─────────────────────────────────────────────────┐
│              BACKEND — Laravel 10               │
│  ┌─────────────┐  ┌──────────────────────────┐  │
│  │  REST API   │  │  MySQL Database          │  │
│  │  (40+ route)│  │  (pasien, vital signs,   │  │
│  │             │  │   dokter, kamar, dll)    │  │
│  └─────────────┘  └──────────────────────────┘  │
│        Auth: Laravel Sanctum (Bearer Token)     │
└────────────────────┬────────────────────────────┘
                     │ HTTP / Axios
                     ▼
┌─────────────────────────────────────────────────┐
│           FRONTEND — Next.js 13 + TS            │
│  ┌──────────────┐  ┌───────────────────────┐    │
│  │  Dashboard   │  │  Grafik Real-Time     │    │
│  │  EWS / IoT   │  │  (Chart.js, 5 detik) │    │
│  └──────────────┘  └───────────────────────┘    │
│        Styling: Tailwind CSS + Flowbite         │
└─────────────────────────────────────────────────┘
```

---

## Tech Stack

### Backend
| Teknologi | Kegunaan |
|-----------|----------|
| **Laravel 10** | Framework PHP untuk REST API |
| **Laravel Sanctum** | Autentikasi berbasis token |
| **MySQL** | Database relasional |
| **Eloquent ORM** | Query database |
| **Laravel Pint** | Code formatter |
| **PHPUnit** | Unit testing |

### Frontend
| Teknologi | Kegunaan |
|-----------|----------|
| **Next.js 13** | Framework React (SSR + routing) |
| **TypeScript** | Type safety |
| **Tailwind CSS** | Styling utility-first |
| **Chart.js** | Grafik interaktif |
| **Axios** | HTTP client |
| **Headless UI + Flowbite** | Komponen UI |
| **i18next** | Internasionalisasi (EN/ID) |

---

## Cara Menjalankan Secara Lokal

### Prasyarat
- PHP 8.1+ & Composer
- Node.js 18+ & npm
- MySQL (jalankan di port 7000 atau sesuaikan `.env`)

### 1. Clone & Setup Backend

```bash
cd be
composer install
cp .env.example .env
php artisan key:generate

# Sesuaikan konfigurasi database di .env
# DB_PORT=7000, DB_DATABASE=covid-be

php artisan migrate
php artisan db:seed
php artisan serve          # → http://localhost:8000
```

### 2. Setup Frontend

```bash
cd fe
npm install
cp .env.example .env

# Pastikan NEXT_PUBLIC_API_URL=http://127.0.0.1:8000/api

npm run dev                # → http://localhost:3000
```

---

## Struktur Direktori

```
monitoring_covid/
├── be/                    # Backend (Laravel 10)
│   ├── app/Models/        # Eloquent models
│   ├── app/Http/          # Controllers & API
│   ├── database/          # Migrations & seeders
│   └── routes/api.php     # Seluruh endpoint API
│
└── fe/                    # Frontend (Next.js 13)
    └── src/
        ├── pages/dashboard/
        │   ├── ews_iot.tsx          # Monitoring IoT real-time
        │   ├── patient_admission.tsx
        │   └── master_data/         # CRUD master data
        ├── lib/http/client.ts       # Axios HTTP client
        └── components/
```

---

## Highlights Teknis

- **Polling IoT** — frontend melakukan `setInterval` setiap 5 detik untuk mengambil data terbaru tanpa WebSocket
- **Bulk Insert API** — endpoint khusus untuk menerima data massal dari banyak perangkat sekaligus
- **Dynamic Routes** — `/patient/vital_sign/[id]` menampilkan detail grafik per pasien menggunakan Next.js dynamic routing
- **Sanctum Token Auth** — token disimpan di localStorage, dikirim otomatis di setiap request terautentikasi
- **Conventional Commits** — pesan commit divalidasi oleh CommitLint untuk menjaga konsistensi history

---

<div align="center">

**© 2023 Lab ESD – Telkom University**

*Proyek ini dikembangkan sebagai sistem informasi rumah sakit untuk penanganan pasien COVID-19*

</div>
