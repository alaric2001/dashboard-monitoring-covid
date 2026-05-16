# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Ringkasan Proyek

Sistem monitoring pasien COVID berbasis web dengan IoT. Backend REST API (Laravel 10) dan frontend SPA (Next.js 13 + TypeScript). Dirancang untuk memantau tanda-tanda vital pasien secara real-time dari perangkat IoT.

---

## Perintah Development

### Backend (`be/`)

```bash
composer install
php artisan migrate
php artisan db:seed
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

> Perhatian: `fe/src/lib/http/client.ts` memiliki IP production yang di-hardcode (`52.74.21.105`). Selalu gunakan `NEXT_PUBLIC_API_URL` dari env untuk development lokal.

---

## Konvensi & Hal Penting

- **Commit messages**: Menggunakan Conventional Commits (divalidasi oleh CommitLint di frontend).
- **i18n**: Frontend mendukung `en` dan `id`, dikonfigurasi di `fe/next.config.js`. Teks antarmuka sebaiknya menggunakan sistem i18n.
- **CORS**: Backend mengizinkan semua origin (`'*'`) — hati-hati saat deploy production.
- **Code generator**: Backend menggunakan InfyOmLabs (`php artisan generate:crud`) untuk scaffold CRUD baru.
- **TypeScript**: Semua komponen frontend baru harus menggunakan TypeScript (`.tsx`/`.ts`), bukan JavaScript.
