import { useState } from 'react';

type Tab = 'tech' | 'flow' | 'features';

const techStack = [
  {
    name: 'Next.js 13',
    role: 'Frontend',
    desc: 'SPA berbasis React dengan SSR, routing otomatis, dan optimasi performa bawaan.',
    gradient: 'from-gray-800 to-gray-600',
    icon: '⚡',
  },
  {
    name: 'TypeScript',
    role: 'Bahasa',
    desc: 'JavaScript yang lebih aman dengan type safety — meminimalkan bug sebelum runtime.',
    gradient: 'from-blue-600 to-blue-400',
    icon: '🔷',
  },
  {
    name: 'Laravel 10',
    role: 'Backend API',
    desc: 'REST API robust dengan Eloquent ORM, middleware, dan validasi bawaan.',
    gradient: 'from-red-600 to-red-400',
    icon: '🔴',
  },
  {
    name: 'MySQL',
    role: 'Database',
    desc: 'Tabel time-series terpisah per sinyal vital — optimal untuk query agregat cepat.',
    gradient: 'from-orange-500 to-yellow-400',
    icon: '🗄️',
  },
  {
    name: 'Tailwind CSS',
    role: 'UI Styling',
    desc: 'Utility-first CSS — UI responsif & konsisten tanpa satu baris CSS kustom.',
    gradient: 'from-teal-500 to-cyan-400',
    icon: '🎨',
  },
  {
    name: 'Chart.js',
    role: 'Visualisasi',
    desc: 'Grafik interaktif doughnut, line, dan bar untuk monitoring vital sign real-time.',
    gradient: 'from-pink-500 to-rose-400',
    icon: '📊',
  },
  {
    name: 'IoT Device',
    role: 'Hardware',
    desc: 'Sensor fisik membaca HR, SpO2, Suhu, NIBP, dan Laju Napas — dikirim via API.',
    gradient: 'from-green-500 to-emerald-400',
    icon: '📡',
  },
  {
    name: 'Laravel Sanctum',
    role: 'Auth',
    desc: 'Token-based authentication — setiap request API divalidasi Bearer token.',
    gradient: 'from-purple-500 to-violet-400',
    icon: '🔐',
  },
];

const systemFlow = [
  {
    step: '01',
    title: 'Sensor IoT Membaca Data',
    desc: 'Perangkat medis IoT mengukur Heart Rate, SpO2, Suhu Tubuh, NIBP, dan Laju Pernapasan pasien secara kontinu.',
    borderColor: 'border-green-400',
    bg: 'bg-green-50',
    stepBg: 'bg-green-500',
    icon: '🏥',
  },
  {
    step: '02',
    title: 'Kirim ke Backend via REST API',
    desc: 'Data dikirim lewat HTTP POST ke endpoint Laravel (/api/multiple{type}) menggunakan bulk insert — efisien untuk traffic IoT tinggi.',
    borderColor: 'border-blue-400',
    bg: 'bg-blue-50',
    stepBg: 'bg-blue-500',
    icon: '📤',
  },
  {
    step: '03',
    title: 'Proses & Simpan ke Database',
    desc: 'Laravel memvalidasi payload, menyimpan ke tabel time-series MySQL terpisah per sinyal (heart_rates, spo2, temperatures, dll), dan menghitung EWS score pasien.',
    borderColor: 'border-orange-400',
    bg: 'bg-orange-50',
    stepBg: 'bg-orange-500',
    icon: '⚙️',
  },
  {
    step: '04',
    title: 'Frontend Polling Otomatis',
    desc: 'Next.js melakukan GET request ke API setiap 5 detik via setInterval — tanpa WebSocket, tanpa reload. Data terbaru selalu tersedia.',
    borderColor: 'border-purple-400',
    bg: 'bg-purple-50',
    stepBg: 'bg-purple-500',
    icon: '🔄',
  },
  {
    step: '05',
    title: 'Dashboard & Early Warning Alert',
    desc: 'Sistem menampilkan grafik real-time dan tabel EWS dengan 5 level warna (Merah → Biru) berdasarkan threshold kondisi klinis pasien. Dokter bisa langsung lihat siapa yang butuh perhatian.',
    borderColor: 'border-red-400',
    bg: 'bg-red-50',
    stepBg: 'bg-red-500',
    icon: '🚨',
  },
];

const features = [
  { icon: '📊', title: 'Real-time Monitoring', desc: 'Vital sign diperbarui otomatis setiap 5 detik tanpa reload halaman.' },
  { icon: '🚨', title: 'Early Warning System', desc: '5-level color alert otomatis berdasarkan threshold tanda vital klinis.' },
  { icon: '🏥', title: 'Master Data Lengkap', desc: 'Kelola pasien, dokter, perawat, bangsal, kamar, & perangkat IoT.' },
  { icon: '📋', title: 'Rekam Medis Digital', desc: 'Lab, radiologi, resep obat, dan hasil pemeriksaan tersimpan terstruktur.' },
  { icon: '📡', title: 'Bulk IoT Endpoint', desc: 'API khusus untuk ingest data batch dari banyak sensor secara bersamaan.' },
  { icon: '🔐', title: 'Token Authentication', desc: 'Sanctum Bearer token melindungi semua endpoint — siap produksi.' },
];

export default function TechInfoModal() {
  const [isOpen, setIsOpen] = useState(false);
  const [activeTab, setActiveTab] = useState<Tab>('tech');

  const tabs: { key: Tab; label: string }[] = [
    { key: 'tech', label: '⚙️ Tech Stack' },
    { key: 'flow', label: '🔄 Alur Sistem' },
    { key: 'features', label: '✨ Fitur Utama' },
  ];

  return (
    <>
      {/* Floating Button */}
      <button
        onClick={() => setIsOpen(true)}
        className='fixed bottom-6 right-6 z-50 flex items-center gap-2 rounded-full px-4 py-3 text-white font-semibold text-sm tracking-wide shadow-lg transition-all duration-300 hover:scale-105 hover:shadow-cyan-400/50'
        style={{
          background: 'linear-gradient(135deg, #1d4ed8, #0891b2)',
          boxShadow: '0 0 24px rgba(6, 182, 212, 0.45)',
        }}
      >
        <span className='relative flex h-2.5 w-2.5'>
          <span className='animate-ping absolute inline-flex h-full w-full rounded-full bg-white opacity-75'></span>
          <span className='relative inline-flex rounded-full h-2.5 w-2.5 bg-white'></span>
        </span>
        Tentang Proyek
        <svg className='w-4 h-4' fill='currentColor' viewBox='0 0 20 20'>
          <path
            fillRule='evenodd'
            d='M18 10a8 8 0 11-16 0 8 8 0 0116 0zm-7-4a1 1 0 11-2 0 1 1 0 012 0zM9 9a1 1 0 000 2v3a1 1 0 001 1h1a1 1 0 100-2v-3a1 1 0 00-1-1H9z'
            clipRule='evenodd'
          />
        </svg>
      </button>

      {/* Modal Overlay */}
      {isOpen && (
        <div
          className='fixed inset-0 z-[200] flex items-center justify-center p-4'
          style={{ backgroundColor: 'rgba(0,0,0,0.65)', backdropFilter: 'blur(4px)' }}
          onClick={(e) => {
            if (e.target === e.currentTarget) setIsOpen(false);
          }}
        >
          <div className='bg-white rounded-2xl shadow-2xl w-full max-w-3xl max-h-[90vh] overflow-hidden flex flex-col'>
            {/* Header */}
            <div
              className='p-6 text-white relative'
              style={{ background: 'linear-gradient(135deg, #1e3a8a 0%, #1d4ed8 50%, #0891b2 100%)' }}
            >
              <button
                onClick={() => setIsOpen(false)}
                className='absolute top-4 right-4 text-white/60 hover:text-white transition-colors'
                aria-label='Tutup'
              >
                <svg className='w-5 h-5' fill='none' stroke='currentColor' viewBox='0 0 24 24'>
                  <path strokeLinecap='round' strokeLinejoin='round' strokeWidth={2} d='M6 18L18 6M6 6l12 12' />
                </svg>
              </button>

              <div className='flex items-start gap-3 mb-1'>
                <span className='text-4xl select-none'>🏥</span>
                <div>
                  <h2 className='text-xl font-bold leading-tight'>COVID-19 Patient Monitoring System</h2>
                  <p className='text-blue-200 text-xs mt-0.5'>
                    Sistem pemantauan tanda vital berbasis IoT &amp; web — real-time, scalable, siap produksi.
                  </p>
                </div>
              </div>

              {/* Stat pills */}
              <div className='flex flex-wrap gap-2 mt-4 mb-5'>
                {['8 Pasien', '5 Dokter', '16 Kamar', '5 Vital Sign', 'Real-time 5s'].map((s) => (
                  <span
                    key={s}
                    className='px-2.5 py-0.5 rounded-full text-xs font-medium'
                    style={{ background: 'rgba(255,255,255,0.15)' }}
                  >
                    {s}
                  </span>
                ))}
              </div>

              {/* Tabs */}
              <div className='flex gap-2'>
                {tabs.map((tab) => (
                  <button
                    key={tab.key}
                    onClick={() => setActiveTab(tab.key)}
                    className={`px-4 py-1.5 rounded-full text-xs font-semibold transition-all duration-200 ${
                      activeTab === tab.key
                        ? 'bg-white text-blue-700 shadow'
                        : 'text-white/75 hover:text-white hover:bg-white/20'
                    }`}
                  >
                    {tab.label}
                  </button>
                ))}
              </div>
            </div>

            {/* Content */}
            <div className='overflow-y-auto flex-1 p-6'>
              {/* ── Tech Stack ── */}
              {activeTab === 'tech' && (
                <div>
                  <p className='text-gray-500 text-xs mb-4'>
                    Dibangun di atas teknologi modern yang <strong className='text-gray-700'>battle-tested</strong> — pilihan stack yang mencerminkan standar industri saat ini.
                  </p>
                  <div className='grid grid-cols-1 sm:grid-cols-2 gap-3'>
                    {techStack.map((t) => (
                      <div
                        key={t.name}
                        className='flex items-start gap-3 p-3 rounded-xl border border-gray-100 hover:border-blue-200 hover:shadow-sm transition-all'
                      >
                        <div
                          className={`w-10 h-10 rounded-lg bg-gradient-to-br ${t.gradient} flex items-center justify-center text-base flex-shrink-0`}
                        >
                          {t.icon}
                        </div>
                        <div>
                          <div className='flex flex-wrap items-center gap-1.5 mb-0.5'>
                            <span className='font-bold text-gray-800 text-sm'>{t.name}</span>
                            <span className='text-[10px] bg-gray-100 text-gray-500 px-1.5 py-0.5 rounded-full leading-none'>
                              {t.role}
                            </span>
                          </div>
                          <p className='text-gray-500 text-xs leading-relaxed'>{t.desc}</p>
                        </div>
                      </div>
                    ))}
                  </div>
                </div>
              )}

              {/* ── Alur Sistem ── */}
              {activeTab === 'flow' && (
                <div>
                  <p className='text-gray-500 text-xs mb-4'>
                    Dari sensor fisik hingga layar dashboard —{' '}
                    <strong className='text-gray-700'>begini cara sistem ini bekerja end-to-end.</strong>
                  </p>
                  <div className='flex flex-col gap-1'>
                    {systemFlow.map((s, idx) => (
                      <div key={s.step}>
                        <div
                          className={`flex items-start gap-4 p-4 rounded-xl border-l-4 ${s.borderColor} ${s.bg}`}
                        >
                          <div
                            className={`${s.stepBg} text-white text-xs font-bold w-8 h-8 rounded-full flex items-center justify-center flex-shrink-0`}
                          >
                            {s.step}
                          </div>
                          <div>
                            <div className='flex items-center gap-1.5 mb-1'>
                              <span className='text-base'>{s.icon}</span>
                              <span className='font-bold text-gray-800 text-sm'>{s.title}</span>
                            </div>
                            <p className='text-gray-600 text-xs leading-relaxed'>{s.desc}</p>
                          </div>
                        </div>
                        {idx < systemFlow.length - 1 && (
                          <div className='flex justify-center py-0.5'>
                            <svg className='w-4 h-4 text-gray-300' fill='currentColor' viewBox='0 0 20 20'>
                              <path
                                fillRule='evenodd'
                                d='M5.293 7.293a1 1 0 011.414 0L10 10.586l3.293-3.293a1 1 0 111.414 1.414l-4 4a1 1 0 01-1.414 0l-4-4a1 1 0 010-1.414z'
                                clipRule='evenodd'
                              />
                            </svg>
                          </div>
                        )}
                      </div>
                    ))}
                  </div>
                </div>
              )}

              {/* ── Fitur Utama ── */}
              {activeTab === 'features' && (
                <div>
                  <p className='text-gray-500 text-xs mb-4'>
                    Fitur-fitur yang membuat sistem ini{' '}
                    <strong className='text-gray-700'>siap digunakan di lingkungan rumah sakit nyata.</strong>
                  </p>
                  <div className='grid grid-cols-1 sm:grid-cols-2 gap-3'>
                    {features.map((f) => (
                      <div
                        key={f.title}
                        className='p-4 rounded-xl bg-gradient-to-br from-gray-50 to-blue-50 border border-blue-100 hover:shadow-sm transition-all'
                      >
                        <div className='text-2xl mb-2'>{f.icon}</div>
                        <div className='font-bold text-gray-800 text-sm mb-1'>{f.title}</div>
                        <p className='text-gray-500 text-xs leading-relaxed'>{f.desc}</p>
                      </div>
                    ))}
                  </div>
                </div>
              )}
            </div>

            {/* Footer */}
            <div className='px-6 py-3 bg-gray-50 border-t border-gray-100 flex items-center justify-between'>
              <div className='flex items-center gap-2'>
                <span className='w-2 h-2 rounded-full bg-green-400 animate-pulse inline-block'></span>
                <span className='text-gray-400 text-xs'>Sistem aktif &amp; real-time</span>
              </div>
              <span className='text-gray-400 text-xs'>
                Built by{' '}
                <a
                  href='https://github.com/alaric2001'
                  target='_blank'
                  rel='noopener noreferrer'
                  className='font-semibold text-blue-600 hover:underline'
                >
                  alaric2001
                </a>{' '}
                · Telkom University
              </span>
            </div>
          </div>
        </div>
      )}
    </>
  );
}
