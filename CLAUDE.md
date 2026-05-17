# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Ringkasan Proyek

Sistem monitoring pasien COVID berbasis web dengan IoT. Backend REST API (Laravel 10) dan frontend SPA (Next.js 13 + TypeScript). Dirancang untuk memantau tanda-tanda vital pasien secara real-time dari perangkat IoT.

---

## Perintah Development

### Backend (`be/`)

```bash
composer install
php artisan migrate:fresh --seed           # reset + isi semua data seeder
php artisan migrate                        # hanya jalankan migration baru
php artisan db:seed                        # isi data tanpa reset
php artisan serve                          # http://localhost:8000

# Testing
vendor/bin/phpunit                         # semua test
vendor/bin/phpunit --filter=NamaTest       # test spesifik

# Code formatting
./vendor/bin/pint
```

### Frontend (`fe/`)

```bash
npm install
npm run dev                # http://localhost:3000
npm run build
npm run start
npm run lint
npm run lint:fix           # ESLint + Prettier sekaligus
npm run typecheck
npm run test
npm run test:watch
```

---

## Arsitektur Sistem

### Gambaran Besar

```
Frontend (Next.js) ──HTTP/Axios──► Backend API (Laravel) ──Eloquent──► MySQL
                                          │
                                   Laravel Sanctum
                                   (Token Auth)
```

Frontend memanggil API via `fe/src/lib/http/client.ts`. URL API dikonfigurasi lewat `NEXT_PUBLIC_API_URL` di `fe/.env`. Token disimpan di `localStorage` dan dikirim sebagai Bearer token.

### Backend — Struktur API

Seluruh route API berada di `be/routes/api.php`, dikelompokkan menjadi:

- **Master data**: `/api/patients`, `/api/doctors`, `/api/nurses`, `/api/wards`, `/api/rooms`, `/api/medicines`, `/api/labs`, `/api/radiologies`
- **Tanda-tanda vital (time-series)**: `/api/respirationRate`, `/api/heartRate`, `/api/spo2`, `/api/temp`, `/api/nibp`, `/api/vitalsign`
- **Bulk insert IoT**: `POST /api/multiple{Doctor|Nurse|Ward|Room|Medicine|Lab|Radiology}`
- **Update vital sign**: `POST /api/update-patient-check/{patientId}/{vitalSignId}/{type}/{value}`
- **Query agregat**: `GET /api/last20{rr|hr|spo2|temp|nibp}` — 20 data terbaru per tipe vital

Model `Patient` memiliki relasi `hasMany` ke semua tabel vital signs (`HeartRate`, `RespirationRate`, `Spo2`, `Temperature`, `Nibp`) dan ke `PatientExamination`.

### Frontend — Struktur Halaman

```
fe/src/pages/dashboard/
├── master_data/       # CRUD: doctor, nurse, patient, ward, room, medicine, lab, radiology, iot_device
├── dashboard_rs.tsx   # Dashboard utama rumah sakit
└── ews_iot.tsx        # Early Warning System — monitoring IoT real-time
```

Semua page menggunakan `baselayout.tsx` sebagai layout wrapper. HTTP client ada di `fe/src/lib/http/client.ts` dengan dua varian: `getDefaultClient()` (tanpa auth) dan `getAuthClient()` (dengan Bearer token dari localStorage).

### Database

MySQL default berjalan di **port 7000** (non-standard) dengan database bernama `covid-be`. Tabel vital signs adalah time-series terpisah per jenis sinyal. Autentikasi menggunakan `personal_access_tokens` (Laravel Sanctum).

### Seeder

`be/database/seeders/DatabaseSeeder.php` menjalankan 14 seeder secara berurutan. **Urutan penting** karena ada foreign key:

```
PermissionSeeder → RoleSeeder → UserSeeder
WardSeeder → DoctorSeeder → NurseSeeder
PatientSeeder → RoomSeeder → PatientExaminationSeeder
             → MedicineSeeder → LabSeeder → RadiologySeeder
             → VitalSignSeeder → EwsSeeder
```

Data seed mencakup 8 pasien COVID, 5 dokter, 5 perawat, 5 bangsal, 16 kamar, beserta data klinis lengkap (lab, radiologi, obat, tanda-tanda vital 10 pembacaan per pasien).

`VitalSignSeeder` menggunakan `DB::table()->insert()` dengan timestamp eksplisit (bukan `Model::create()`) agar data time-series grafik terurut dengan benar. Jangan ganti ke factory untuk tabel ini.

---

## Konfigurasi Environment

### Backend (`be/.env`)
```
DB_PORT=7000
DB_DATABASE=covid-be
```

### Frontend (`fe/.env`)
```
NEXT_PUBLIC_API_URL="http://127.0.0.1:8000/api"
```

`NEXT_PUBLIC_API_URL` adalah satu-satunya sumber URL API di seluruh frontend. Semua halaman menggunakan `` `${process.env.NEXT_PUBLIC_API_URL}/endpoint` `` secara langsung. `fe/next.config.js` juga membaca env ini untuk mengisi `remotePatterns` hostname pada konfigurasi gambar.

---

## Deployment (Vercel)

Frontend (`fe/`) di-deploy ke Vercel, backend (`be/`) harus berjalan di server terpisah (tidak bisa di Vercel).

**Pengaturan Vercel:**
- **Root Directory**: `fe/`
- **Environment Variable**: `NEXT_PUBLIC_API_URL` = URL backend production (contoh: `https://patientmonitoring.my.id/api`)
- Build command dan output directory dibiarkan default (Next.js auto-detect)

---

## Konvensi & Hal Penting

- **Commit messages**: Menggunakan Conventional Commits (divalidasi oleh CommitLint di frontend).
- **i18n**: Frontend mendukung `en` dan `id`, dikonfigurasi di `fe/next.config.js`. Teks antarmuka sebaiknya menggunakan sistem i18n.
- **CORS**: Backend mengizinkan semua origin (`'*'`) — hati-hati saat deploy production.
- **Code generator**: Backend menggunakan InfyOmLabs (`php artisan generate:crud`) untuk scaffold CRUD baru.
- **TypeScript**: Semua komponen frontend baru harus menggunakan TypeScript (`.tsx`/`.ts`), bukan JavaScript.
