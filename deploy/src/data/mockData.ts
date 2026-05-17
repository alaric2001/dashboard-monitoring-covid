const TS = [
  '2023-08-15 00:00:00', '2023-08-15 04:00:00', '2023-08-15 08:00:00',
  '2023-08-15 12:00:00', '2023-08-15 16:00:00', '2023-08-15 20:00:00',
  '2023-08-16 00:00:00', '2023-08-16 04:00:00', '2023-08-16 08:00:00',
  '2023-08-16 12:00:00',
];

function vitals(pid: number, hr: number[], rr: number[], spo2: number[], temp: number[], sys: number[], dia: number[]) {
  const b = (pid - 1) * 10 + 1;
  return {
    hr:   hr.map((v, i)   => ({ id: b + i, patient_id: pid, heart_beats: v,  patient_check: 0, created_at: TS[i] })),
    rr:   rr.map((v, i)   => ({ id: b + i, patient_id: pid, breaths: v,       patient_check: 0, created_at: TS[i] })),
    spo2: spo2.map((v, i) => ({ id: b + i, patient_id: pid, blood_oxygen: v,  patient_check: 0, created_at: TS[i] })),
    temp: temp.map((v, i) => ({ id: b + i, patient_id: pid, patient_temp: v,  patient_check: 0, created_at: TS[i] })),
    nibp: sys.map((v, i)  => ({ id: b + i, patient_id: pid, systolic: v, diastolic: dia[i], patient_check: 0, created_at: TS[i] })),
  };
}

export const DOCTORS = [
  { id: 1, name: 'Dr. Budi Santoso, Sp.P',    gender: 'Male',   birth_date: '1975-03-12', address: 'Jl. Raya Dago No. 45, Bandung',       contact: '081234567890', specialization: 'Pulmonologi' },
  { id: 2, name: 'Dr. Siti Rahayu, Sp.PD',    gender: 'Female', birth_date: '1980-07-28', address: 'Jl. Ciumbuleuit No. 112, Bandung',     contact: '082345678901', specialization: 'Penyakit Dalam' },
  { id: 3, name: 'Dr. Ahmad Fauzi, Sp.JP',     gender: 'Male',   birth_date: '1972-11-05', address: 'Jl. Sukajadi No. 88, Bandung',         contact: '083456789012', specialization: 'Jantung dan Pembuluh Darah' },
  { id: 4, name: 'Dr. Dewi Puspita, Sp.Rad',   gender: 'Female', birth_date: '1983-04-19', address: 'Jl. Setiabudi No. 67, Bandung',        contact: '084567890123', specialization: 'Radiologi' },
  { id: 5, name: 'Dr. Hendra Wijaya, Sp.An',   gender: 'Male',   birth_date: '1978-09-03', address: 'Jl. Tubagus Ismail No. 30, Bandung',  contact: '085678901234', specialization: 'Anestesiologi dan Terapi Intensif' },
];

export const NURSES = [
  { id: 1, name: 'Rina Kurniasih, S.Kep',  gender: 'Female', birth_date: '1990-02-14', address: 'Jl. Pasteur No. 22, Bandung',     contact: '086789012345', department: 'ICU COVID-19' },
  { id: 2, name: 'Agus Setiawan, S.Kep',   gender: 'Male',   birth_date: '1988-06-20', address: 'Jl. Kebon Jati No. 55, Bandung',  contact: '087890123456', department: 'Bangsal COVID-19' },
  { id: 3, name: 'Yuni Rahmawati, S.Kep',  gender: 'Female', birth_date: '1993-10-07', address: 'Jl. Cihampelas No. 80, Bandung',  contact: '088901234567', department: 'HCU' },
  { id: 4, name: 'Doni Prasetyo, S.Kep',   gender: 'Male',   birth_date: '1991-03-25', address: 'Jl. Dipatiukur No. 13, Bandung',  contact: '089012345678', department: 'Bangsal Isolasi' },
  { id: 5, name: 'Maya Lestari, S.Kep',    gender: 'Female', birth_date: '1995-08-11', address: 'Jl. Ganesha No. 9, Bandung',      contact: '081123456789', department: 'Bangsal Umum' },
];

export const WARDS = [
  { id: 1, ward_name: 'Bangsal COVID-19',    class: '1', desc: 'Bangsal khusus perawatan pasien COVID-19 dengan protokol isolasi ketat.',      facilities: 'Ventilator, monitor vital, oksigen sentral, nurse station 24 jam', rates: 850000 },
  { id: 2, ward_name: 'ICU COVID-19',        class: '1', desc: 'Unit Perawatan Intensif untuk pasien COVID-19 kondisi kritis.',                 facilities: 'Ventilator ICU, ECMO, monitor multi-parameter, infus pump, nurse 1:1', rates: 2500000 },
  { id: 3, ward_name: 'HCU (High Care Unit)',class: '1', desc: 'Unit perawatan tingkat tinggi untuk pasien COVID-19 kondisi berat tidak kritis.',facilities: 'Monitor vital, oksigen HFNC, infus pump, nurse station', rates: 1500000 },
  { id: 4, ward_name: 'Bangsal Isolasi',     class: '2', desc: 'Bangsal isolasi untuk pasien COVID-19 kondisi sedang.',                         facilities: 'Oksigen nasal kanul, monitor vital, kamar mandi dalam', rates: 500000 },
  { id: 5, ward_name: 'Bangsal Umum',        class: '3', desc: 'Bangsal umum untuk pasien COVID-19 kondisi ringan dan observasi.',               facilities: 'Oksigen portable, nurse station, fasilitas umum', rates: 250000 },
];

export const ROOMS = [
  { id: 1,  room_name: 'ICU-01',  ward_id: 2, patient_id: 2 },
  { id: 2,  room_name: 'ICU-02',  ward_id: 2, patient_id: 1 },
  { id: 3,  room_name: 'ICU-03',  ward_id: 2, patient_id: null },
  { id: 4,  room_name: 'HCU-01',  ward_id: 3, patient_id: 5 },
  { id: 5,  room_name: 'HCU-02',  ward_id: 3, patient_id: null },
  { id: 6,  room_name: 'HCU-03',  ward_id: 3, patient_id: null },
  { id: 7,  room_name: 'COV-A01', ward_id: 1, patient_id: 3 },
  { id: 8,  room_name: 'COV-A02', ward_id: 1, patient_id: 4 },
  { id: 9,  room_name: 'COV-A03', ward_id: 1, patient_id: 7 },
  { id: 10, room_name: 'COV-A04', ward_id: 1, patient_id: null },
  { id: 11, room_name: 'ISO-01',  ward_id: 4, patient_id: 6 },
  { id: 12, room_name: 'ISO-02',  ward_id: 4, patient_id: 8 },
  { id: 13, room_name: 'ISO-03',  ward_id: 4, patient_id: null },
  { id: 14, room_name: 'UMU-01',  ward_id: 5, patient_id: null },
  { id: 15, room_name: 'UMU-02',  ward_id: 5, patient_id: null },
  { id: 16, room_name: 'UMU-03',  ward_id: 5, patient_id: null },
];

export const MEDICINES = [
  { id: 1,  patient_id: 1, name: 'Remdesivir 100mg',           type: 'Antiviral',      stock: 10 },
  { id: 2,  patient_id: 1, name: 'Dexamethasone 6mg',          type: 'Kortikosteroid', stock: 14 },
  { id: 3,  patient_id: 1, name: 'Vitamin C 1000mg',           type: 'Suplemen',       stock: 30 },
  { id: 4,  patient_id: 2, name: 'Remdesivir 100mg',           type: 'Antiviral',      stock: 10 },
  { id: 5,  patient_id: 2, name: 'Methylprednisolone 125mg',   type: 'Kortikosteroid', stock: 14 },
  { id: 6,  patient_id: 2, name: 'Heparin 5000 IU',            type: 'Antikoagulan',   stock: 14 },
  { id: 7,  patient_id: 3, name: 'Favipiravir 200mg',          type: 'Antiviral',      stock: 28 },
  { id: 8,  patient_id: 3, name: 'Dexamethasone 6mg',          type: 'Kortikosteroid', stock: 10 },
  { id: 9,  patient_id: 3, name: 'Zinc 20mg',                  type: 'Suplemen',       stock: 14 },
  { id: 10, patient_id: 4, name: 'Favipiravir 200mg',          type: 'Antiviral',      stock: 28 },
  { id: 11, patient_id: 4, name: 'Paracetamol 500mg',          type: 'Antipiretik',    stock: 30 },
  { id: 12, patient_id: 4, name: 'Vitamin D3 1000 IU',         type: 'Suplemen',       stock: 14 },
  { id: 13, patient_id: 5, name: 'Remdesivir 100mg',           type: 'Antiviral',      stock: 10 },
  { id: 14, patient_id: 5, name: 'Dexamethasone 6mg',          type: 'Kortikosteroid', stock: 14 },
  { id: 15, patient_id: 5, name: 'Levofloxacin 750mg',         type: 'Antibiotik',     stock: 7  },
  { id: 16, patient_id: 6, name: 'Paracetamol 500mg',          type: 'Antipiretik',    stock: 30 },
  { id: 17, patient_id: 6, name: 'Vitamin C 500mg',            type: 'Suplemen',       stock: 30 },
  { id: 18, patient_id: 6, name: 'Zinc 20mg',                  type: 'Suplemen',       stock: 14 },
  { id: 19, patient_id: 7, name: 'Favipiravir 200mg',          type: 'Antiviral',      stock: 28 },
  { id: 20, patient_id: 7, name: 'Azithromycin 500mg',         type: 'Antibiotik',     stock: 5  },
  { id: 21, patient_id: 7, name: 'NAC (N-Acetylcysteine) 600mg',type: 'Mukolitik',     stock: 14 },
  { id: 22, patient_id: 8, name: 'Paracetamol 500mg',          type: 'Antipiretik',    stock: 30 },
  { id: 23, patient_id: 8, name: 'Vitamin D3 1000 IU',         type: 'Suplemen',       stock: 14 },
  { id: 24, patient_id: 8, name: 'Zinc 20mg',                  type: 'Suplemen',       stock: 14 },
];

export const LABS = [
  { id: 1,  patient_id: 1, lab_name: 'Lab Klinik RS Telkom', test_type: 'RT-PCR SARS-CoV-2',    result: 'Positif',                          sample_collection_date: '2023-08-01', dispatch_to_lab_date: '2023-08-01', sample_received_date: '2023-08-01', processed_date: '2023-08-02' },
  { id: 2,  patient_id: 1, lab_name: 'Lab Klinik RS Telkom', test_type: 'D-Dimer',              result: '3.2 mg/L (Meningkat)',              sample_collection_date: '2023-08-01', dispatch_to_lab_date: '2023-08-01', sample_received_date: '2023-08-01', processed_date: '2023-08-01' },
  { id: 3,  patient_id: 1, lab_name: 'Lab Klinik RS Telkom', test_type: 'CRP',                  result: '85 mg/L (Meningkat)',               sample_collection_date: '2023-08-01', dispatch_to_lab_date: '2023-08-01', sample_received_date: '2023-08-01', processed_date: '2023-08-01' },
  { id: 4,  patient_id: 2, lab_name: 'Lab Klinik RS Telkom', test_type: 'RT-PCR SARS-CoV-2',    result: 'Positif',                          sample_collection_date: '2023-08-02', dispatch_to_lab_date: '2023-08-02', sample_received_date: '2023-08-02', processed_date: '2023-08-03' },
  { id: 5,  patient_id: 2, lab_name: 'Lab Klinik RS Telkom', test_type: 'Troponin I',            result: '0.42 ng/mL (Meningkat Signifikan)',sample_collection_date: '2023-08-02', dispatch_to_lab_date: '2023-08-02', sample_received_date: '2023-08-02', processed_date: '2023-08-02' },
  { id: 6,  patient_id: 2, lab_name: 'Lab Klinik RS Telkom', test_type: 'Ferritin',             result: '1250 ng/mL (Meningkat)',            sample_collection_date: '2023-08-02', dispatch_to_lab_date: '2023-08-02', sample_received_date: '2023-08-02', processed_date: '2023-08-02' },
  { id: 7,  patient_id: 3, lab_name: 'Lab Klinik RS Telkom', test_type: 'RT-PCR SARS-CoV-2',    result: 'Positif',                          sample_collection_date: '2023-08-03', dispatch_to_lab_date: '2023-08-03', sample_received_date: '2023-08-03', processed_date: '2023-08-04' },
  { id: 8,  patient_id: 3, lab_name: 'Lab Klinik RS Telkom', test_type: 'Darah Lengkap (CBC)',   result: 'Leukosit 11.200/uL, Limfosit 18%', sample_collection_date: '2023-08-03', dispatch_to_lab_date: '2023-08-03', sample_received_date: '2023-08-03', processed_date: '2023-08-03' },
  { id: 9,  patient_id: 4, lab_name: 'Lab Klinik RS Telkom', test_type: 'RT-PCR SARS-CoV-2',    result: 'Positif',                          sample_collection_date: '2023-08-05', dispatch_to_lab_date: '2023-08-05', sample_received_date: '2023-08-05', processed_date: '2023-08-06' },
  { id: 10, patient_id: 4, lab_name: 'Lab Klinik RS Telkom', test_type: 'CRP',                  result: '42 mg/L (Meningkat Sedang)',        sample_collection_date: '2023-08-05', dispatch_to_lab_date: '2023-08-05', sample_received_date: '2023-08-05', processed_date: '2023-08-05' },
  { id: 11, patient_id: 5, lab_name: 'Lab Klinik RS Telkom', test_type: 'RT-PCR SARS-CoV-2',    result: 'Positif',                          sample_collection_date: '2023-08-06', dispatch_to_lab_date: '2023-08-06', sample_received_date: '2023-08-06', processed_date: '2023-08-07' },
  { id: 12, patient_id: 5, lab_name: 'Lab Klinik RS Telkom', test_type: 'D-Dimer',              result: '2.8 mg/L (Meningkat)',              sample_collection_date: '2023-08-06', dispatch_to_lab_date: '2023-08-06', sample_received_date: '2023-08-06', processed_date: '2023-08-06' },
  { id: 13, patient_id: 6, lab_name: 'Lab Klinik RS Telkom', test_type: 'RT-PCR SARS-CoV-2',    result: 'Positif',                          sample_collection_date: '2023-08-07', dispatch_to_lab_date: '2023-08-07', sample_received_date: '2023-08-07', processed_date: '2023-08-08' },
  { id: 14, patient_id: 6, lab_name: 'Lab Klinik RS Telkom', test_type: 'Darah Lengkap (CBC)',   result: 'Dalam batas normal',               sample_collection_date: '2023-08-07', dispatch_to_lab_date: '2023-08-07', sample_received_date: '2023-08-07', processed_date: '2023-08-07' },
  { id: 15, patient_id: 7, lab_name: 'Lab Klinik RS Telkom', test_type: 'RT-PCR SARS-CoV-2',    result: 'Positif',                          sample_collection_date: '2023-08-08', dispatch_to_lab_date: '2023-08-08', sample_received_date: '2023-08-08', processed_date: '2023-08-09' },
  { id: 16, patient_id: 7, lab_name: 'Lab Klinik RS Telkom', test_type: 'Procalcitonin',        result: '0.8 ng/mL (Meningkat Ringan)',      sample_collection_date: '2023-08-08', dispatch_to_lab_date: '2023-08-08', sample_received_date: '2023-08-08', processed_date: '2023-08-08' },
  { id: 17, patient_id: 8, lab_name: 'Lab Klinik RS Telkom', test_type: 'RT-PCR SARS-CoV-2',    result: 'Positif',                          sample_collection_date: '2023-08-09', dispatch_to_lab_date: '2023-08-09', sample_received_date: '2023-08-09', processed_date: '2023-08-10' },
  { id: 18, patient_id: 8, lab_name: 'Lab Klinik RS Telkom', test_type: 'Darah Lengkap (CBC)',   result: 'Dalam batas normal',               sample_collection_date: '2023-08-09', dispatch_to_lab_date: '2023-08-09', sample_received_date: '2023-08-09', processed_date: '2023-08-09' },
];

export const RADIOLOGIES = [
  { id: 1, patient_id: 1, doctor_id: 4, radiology_exam: 'Rontgen Thorax AP',              approved_date: '2023-08-01', processed_date: '2023-08-01', result: 'Infiltrat bilateral, ground glass opacity (+). Kesan: Pneumonia COVID-19 berat.' },
  { id: 2, patient_id: 1, doctor_id: 4, radiology_exam: 'CT Scan Thorax dengan Kontras',   approved_date: '2023-08-02', processed_date: '2023-08-02', result: 'GGO bilateral extensive, crazy-paving pattern. Keterlibatan >75% parenkim paru. Kesan: COVID-19 pneumonia berat.' },
  { id: 3, patient_id: 2, doctor_id: 4, radiology_exam: 'Rontgen Thorax AP',              approved_date: '2023-08-02', processed_date: '2023-08-02', result: 'Konsolidasi bilateral, kardiomegali. Kesan: Pneumonia COVID-19 kritis + gagal jantung.' },
  { id: 4, patient_id: 2, doctor_id: 4, radiology_exam: 'Ekokardiografi',                 approved_date: '2023-08-03', processed_date: '2023-08-03', result: 'EF 40%, hipokinesis global. Tanda miokarditis.' },
  { id: 5, patient_id: 3, doctor_id: 4, radiology_exam: 'Rontgen Thorax AP',              approved_date: '2023-08-03', processed_date: '2023-08-03', result: 'GGO bilateral ringan-sedang, predominan perifer. Kesan: Pneumonia COVID-19 sedang.' },
  { id: 6, patient_id: 4, doctor_id: 4, radiology_exam: 'Rontgen Thorax AP',              approved_date: '2023-08-05', processed_date: '2023-08-05', result: 'GGO bilateral ringan, tidak ada konsolidasi. Kesan: Pneumonia COVID-19 ringan-sedang.' },
  { id: 7, patient_id: 5, doctor_id: 4, radiology_exam: 'Rontgen Thorax AP',              approved_date: '2023-08-06', processed_date: '2023-08-06', result: 'Infiltrat bilateral luas, GGO, diafragma mendatar. Kesan: Pneumonia COVID-19 berat.' },
  { id: 8, patient_id: 6, doctor_id: 4, radiology_exam: 'Rontgen Thorax AP',              approved_date: '2023-08-07', processed_date: '2023-08-07', result: 'GGO minimal perifer bilateral. Kesan: Pneumonia COVID-19 ringan.' },
  { id: 9, patient_id: 7, doctor_id: 4, radiology_exam: 'Rontgen Thorax AP',              approved_date: '2023-08-08', processed_date: '2023-08-08', result: 'GGO bilateral sedang, distribusi perifer. Kesan: Pneumonia COVID-19 sedang.' },
  { id: 10,patient_id: 8, doctor_id: 4, radiology_exam: 'Rontgen Thorax AP',              approved_date: '2023-08-09', processed_date: '2023-08-09', result: 'GGO minimal, hampir tidak tampak. Kesan: Pneumonia COVID-19 sangat ringan.' },
];

// ─── Patient base info ───────────────────────────────────────────────────────
const BASE_PATIENTS = [
  { id: 1, patient_name: 'Ahmad Hidayat',      admission_date: '2023-08-01', discharge_date: null, gender: 'Male',   birth: '1978-03-15', id_card: '3273011503780001', address: 'Jl. Merdeka No. 12, Bandung',         contact: '081211112222', education: 'University',   occupation: 'Wiraswasta',              photo: null, referred: 'RS Hasan Sadikin',      next_of_kin_name: 'Fatimah Hidayat',    relationship: 'Spouse', next_of_kin_address: 'Jl. Merdeka No. 12, Bandung',        next_of_kin_contact: '081233334444' },
  { id: 2, patient_name: 'Siti Aminah',        admission_date: '2023-08-02', discharge_date: null, gender: 'Female', birth: '1956-07-22', id_card: '3273012207560002', address: 'Jl. Sudirman No. 45, Bandung',        contact: '082222223333', education: 'High School',  occupation: 'Ibu Rumah Tangga',        photo: null, referred: 'Puskesmas Coblong',     next_of_kin_name: 'Iwan Setiawan',      relationship: 'Child',  next_of_kin_address: 'Jl. Sudirman No. 47, Bandung',       next_of_kin_contact: '082244445555' },
  { id: 3, patient_name: 'Rizki Pradipta',     admission_date: '2023-08-03', discharge_date: null, gender: 'Male',   birth: '1995-11-08', id_card: '3273010811950003', address: 'Jl. Dipatiukur No. 7, Bandung',       contact: '083333334444', education: 'College',      occupation: 'Mahasiswa',               photo: null, referred: 'IGD RS Telkom',         next_of_kin_name: 'Hendra Pradipta',    relationship: 'Parent', next_of_kin_address: 'Jl. Dipatiukur No. 7, Bandung',      next_of_kin_contact: '083355556666' },
  { id: 4, patient_name: 'Nur Fadilah',        admission_date: '2023-08-05', discharge_date: null, gender: 'Female', birth: '1982-04-12', id_card: '3273011204820004', address: 'Jl. Cihampelas No. 33, Bandung',      contact: '084444445555', education: 'University',   occupation: 'Guru',                    photo: null, referred: 'Klinik Pratama Sehat',  next_of_kin_name: 'Rahmat Fadilah',     relationship: 'Spouse', next_of_kin_address: 'Jl. Cihampelas No. 33, Bandung',     next_of_kin_contact: '084466667777' },
  { id: 5, patient_name: 'Bambang Suryanto',   admission_date: '2023-08-06', discharge_date: null, gender: 'Male',   birth: '1963-09-30', id_card: '3273013009630005', address: 'Jl. Pasteur No. 78, Bandung',         contact: '085555556666', education: 'High School',  occupation: 'Pegawai Negeri Sipil',    photo: null, referred: 'RS Borromeus',         next_of_kin_name: 'Sri Suryanto',       relationship: 'Spouse', next_of_kin_address: 'Jl. Pasteur No. 78, Bandung',        next_of_kin_contact: '085577778888' },
  { id: 6, patient_name: 'Dewi Anggraini',     admission_date: '2023-08-07', discharge_date: null, gender: 'Female', birth: '1990-06-17', id_card: '3273011706900006', address: 'Jl. Sukajadi No. 21, Bandung',        contact: '086666667777', education: 'College',      occupation: 'Karyawan Swasta',         photo: null, referred: 'IGD RS Telkom',         next_of_kin_name: 'Rudi Anggraini',     relationship: 'Spouse', next_of_kin_address: 'Jl. Sukajadi No. 21, Bandung',       next_of_kin_contact: '086688889999' },
  { id: 7, patient_name: 'Wahyu Hidayatullah', admission_date: '2023-08-08', discharge_date: null, gender: 'Male',   birth: '1974-02-25', id_card: '3273012502740007', address: 'Jl. Tubagus Ismail No. 50, Bandung',  contact: '087777778888', education: 'Master',       occupation: 'Dosen',                   photo: null, referred: 'Puskesmas Sukasari',    next_of_kin_name: 'Ani Hidayatullah',   relationship: 'Spouse', next_of_kin_address: 'Jl. Tubagus Ismail No. 50, Bandung', next_of_kin_contact: '087799990000' },
  { id: 8, patient_name: 'Rini Susanti',       admission_date: '2023-08-09', discharge_date: null, gender: 'Female', birth: '1987-12-03', id_card: '3273010312870008', address: 'Jl. Ganesha No. 15, Bandung',         contact: '088888889999', education: 'University',   occupation: 'Apoteker',                photo: null, referred: 'IGD RS Telkom',         next_of_kin_name: 'Andi Susanti',       relationship: 'Spouse', next_of_kin_address: 'Jl. Ganesha No. 15, Bandung',        next_of_kin_contact: '088800001111' },
];

export const PATIENTS = BASE_PATIENTS;

// ─── Examination data (per patient) ─────────────────────────────────────────
const EXAMS: Record<number, object> = {
  1: { id: 1, weight: 72, height: 170, blood: 'O+', notes: 'Pasien mengalami sesak napas berat, saturasi oksigen turun signifikan. Perlu monitoring ketat.',          covid_case: 1, patient_id: 1, doctor_id: 1, doctor: DOCTORS[0] },
  2: { id: 2, weight: 58, height: 155, blood: 'A+', notes: 'Pasien lansia kondisi kritis. Komorbiditas diabetes dan hipertensi. Pasang ventilator.',                   covid_case: 1, patient_id: 2, doctor_id: 5, doctor: DOCTORS[4] },
  3: { id: 3, weight: 68, height: 175, blood: 'B+', notes: 'Pasien muda, kondisi sedang. Oksigen tambahan via nasal kanul. Prognosis baik.',                           covid_case: 1, patient_id: 3, doctor_id: 2, doctor: DOCTORS[1] },
  4: { id: 4, weight: 55, height: 160, blood: 'AB+',notes: 'Kondisi sedang, demam persisten. Respon terapi antipiretik cukup baik.',                                   covid_case: 1, patient_id: 4, doctor_id: 2, doctor: DOCTORS[1] },
  5: { id: 5, weight: 85, height: 168, blood: 'O-', notes: 'Pasien berat badan berlebih, kondisi berat. Komorbiditas obesitas memperburuk kondisi.',                    covid_case: 1, patient_id: 5, doctor_id: 1, doctor: DOCTORS[0] },
  6: { id: 6, weight: 52, height: 158, blood: 'A-', notes: 'Kondisi ringan, tidak memerlukan oksigen tambahan. Target pulang 3-5 hari.',                               covid_case: 0, patient_id: 6, doctor_id: 2, doctor: DOCTORS[1] },
  7: { id: 7, weight: 76, height: 172, blood: 'B-', notes: 'Kondisi sedang, demam dan batuk produktif. Respon terapi antiviral baik.',                                 covid_case: 1, patient_id: 7, doctor_id: 1, doctor: DOCTORS[0] },
  8: { id: 8, weight: 50, height: 162, blood: 'O+', notes: 'Kondisi ringan, gejala utama anosmia dan batuk kering. Saturasi oksigen stabil.',                          covid_case: 0, patient_id: 8, doctor_id: 2, doctor: DOCTORS[1] },
};

// ─── Vital signs raw data ────────────────────────────────────────────────────
const RAW_VITALS: Record<number, ReturnType<typeof vitals>> = {
  1: vitals(1, [118,115,113,116,112,108,105,102,98,95],  [26,25,25,24,23,22,21,21,20,19],  [89,90,90,91,91,92,93,93,94,94],  [39.2,39.0,38.8,38.7,38.5,38.3,38.1,37.9,37.8,37.6], [145,143,141,139,137,135,133,131,129,128], [95,93,91,90,88,87,85,84,83,82]),
  2: vitals(2, [132,128,135,130,125,133,127,131,128,130],[32,30,31,29,32,30,28,31,30,29],  [86,88,85,87,89,86,88,87,90,89],  [40.1,39.8,40.2,40.0,39.7,39.9,40.1,39.8,39.6,39.9],[155,158,152,160,156,153,158,155,150,157],[100,102,98,105,101,99,103,100,97,102]),
  3: vitals(3, [98,96,97,95,94,96,93,94,92,91],          [22,21,22,20,21,20,19,20,19,18],  [93,93,92,94,93,94,95,94,95,95],  [38.5,38.4,38.2,38.1,38.0,37.9,37.8,37.7,37.6,37.5],[128,126,127,125,124,123,122,121,120,119],[84,83,83,82,81,80,80,79,79,78]),
  4: vitals(4, [92,90,91,89,90,88,87,88,86,85],          [21,20,21,19,20,19,18,19,18,17],  [94,94,93,95,94,95,95,96,95,96],  [38.3,38.1,38.0,37.9,37.8,37.7,37.6,37.5,37.4,37.3],[122,120,121,119,118,117,118,116,115,115],[80,79,80,78,77,76,77,76,75,75]),
  5: vitals(5, [121,118,120,116,115,117,113,115,112,110],[28,26,27,25,26,24,25,23,24,22],  [88,89,88,90,89,91,90,92,91,92],  [39.5,39.3,39.1,39.0,38.8,38.7,38.5,38.4,38.2,38.1],[148,146,144,142,140,138,137,135,134,132],[97,95,94,92,91,90,89,88,87,85]),
  6: vitals(6, [82,81,83,80,81,79,80,78,79,78],          [18,17,18,17,16,17,16,16,15,15],  [96,96,95,97,96,97,97,96,97,98],  [37.8,37.7,37.6,37.5,37.4,37.3,37.2,37.2,37.1,37.0],[118,117,118,116,115,116,114,115,113,112],[76,75,76,74,73,74,73,72,72,71]),
  7: vitals(7, [100,98,99,97,96,97,95,96,94,93],         [23,22,22,21,21,20,20,19,19,18],  [92,92,93,92,93,94,93,94,95,94],  [38.6,38.4,38.3,38.1,38.0,37.9,37.8,37.7,37.6,37.5],[130,128,129,127,126,125,124,123,122,121],[85,84,84,83,82,81,80,80,79,79]),
  8: vitals(8, [78,77,78,76,77,75,76,74,75,74],          [17,16,17,16,15,16,15,15,14,14],  [97,97,96,98,97,98,97,98,98,97],  [37.5,37.4,37.4,37.3,37.2,37.2,37.1,37.1,37.0,37.0],[115,114,115,113,112,113,111,112,110,110],[73,72,73,71,70,71,70,69,69,68]),
};

// EWS indicator per patient
const EWS: Record<number, string> = { 1:'red', 2:'red', 3:'yellow', 4:'yellow', 5:'red', 6:'green', 7:'orange', 8:'green' };
const ROOMS_MAP: Record<number, string> = { 1:'ICU-02', 2:'ICU-01', 3:'COV-A01', 4:'COV-A02', 5:'HCU-01', 6:'ISO-01', 7:'COV-A03', 8:'ISO-02' };

// Build the rich patient-ttv response
export const PATIENTS_TTV = BASE_PATIENTS.map((p) => {
  const v = RAW_VITALS[p.id];
  const last = 9; // index of latest reading
  return {
    ...p,
    patient_room: ROOMS_MAP[p.id] ?? null,
    indicator: EWS[p.id] ?? 'green',
    // Alert fields: latest reading values
    alert_hr_date:         TS[last],
    alert_patient_hr:      v.hr[last].heart_beats,
    alert_rr_date:         TS[last],
    alert_patient_rr:      v.rr[last].breaths,
    alert_temp_date:       TS[last],
    alert_patient_temp:    v.temp[last].patient_temp,
    alert_spo2_date:       TS[last],
    alert_patient_spo2:    v.spo2[last].blood_oxygen,
    alert_nibp_date:       TS[last],
    alert_patient_systolic:  v.nibp[last].systolic,
    alert_patient_diastolic: v.nibp[last].diastolic,
    // Nested vitals
    hr:   v.hr,
    rr:   v.rr,
    spo2: v.spo2,
    temp: v.temp,
    nibp: v.nibp,
    // Examination
    examination: [EXAMS[p.id]],
  };
});
