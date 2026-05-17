import type { InternalAxiosRequestConfig, AxiosResponse } from 'axios';
import {
  DOCTORS,
  NURSES,
  WARDS,
  ROOMS,
  MEDICINES,
  LABS,
  RADIOLOGIES,
  PATIENTS,
  PATIENTS_TTV,
} from '@/data/mockData';

const PC_KEY = 'mock_pc_overrides';

function getOverrides(): Record<string, number> {
  if (typeof window === 'undefined') return {};
  try {
    return JSON.parse(localStorage.getItem(PC_KEY) || '{}');
  } catch {
    return {};
  }
}

function setOverride(type: string, vitalSignId: string, value: number): void {
  if (typeof window === 'undefined') return;
  const overrides = getOverrides();
  overrides[`${type}-${vitalSignId}`] = value;
  localStorage.setItem(PC_KEY, JSON.stringify(overrides));
}

function applyOverrides(patientsTtv: any[]): any[] {
  const overrides = getOverrides();
  if (Object.keys(overrides).length === 0) return patientsTtv;
  return patientsTtv.map((patient) => {
    const updated = { ...patient };
    (['hr', 'rr', 'spo2', 'temp', 'nibp'] as const).forEach((vt) => {
      updated[vt] = patient[vt].map((reading: any) => {
        const key = `${vt}-${reading.id}`;
        return key in overrides ? { ...reading, patient_check: overrides[key] } : reading;
      });
    });
    return updated;
  });
}

function route(url: string, method: string): any {
  // Strip protocol+host and /api prefix so we match just the path segment
  const path = url
    .replace(/^https?:\/\/[^/]+/, '')
    .replace(/^\/api/, '');

  // POST /login
  if (method === 'post' && /^\/login/.test(path)) {
    return {
      token: {
        access_token: 'mock-access-token-portfolio-demo',
        token_type: 'Bearer',
        expires_in: 86400,
      },
    };
  }

  // POST /update-patient-check/:patientId/:vitalSignId/:type/:value
  const pcMatch = path.match(/^\/update-patient-check\/\d+\/(\d+)\/(\w+)\/(\d+)/);
  if (method === 'post' && pcMatch) {
    const [, vitalSignId, type, value] = pcMatch;
    setOverride(type, vitalSignId, Number(value));
    return { message: 'Patient check updated successfully' };
  }

  // GET /patient-ttv/:id
  const ttvIdMatch = path.match(/^\/patient-ttv\/(\d+)/);
  if (ttvIdMatch) {
    const id = Number(ttvIdMatch[1]);
    return applyOverrides(PATIENTS_TTV).find((p) => p.id === id) ?? null;
  }

  // GET /patient-ttv
  if (/^\/patient-ttv/.test(path)) {
    return applyOverrides(PATIENTS_TTV);
  }

  // GET /patients/:id
  const patientIdMatch = path.match(/^\/patients\/(\d+)/);
  if (patientIdMatch) {
    const id = Number(patientIdMatch[1]);
    return PATIENTS.find((p) => p.id === id) ?? null;
  }

  if (/^\/patients/.test(path)) return PATIENTS;
  if (/^\/doctors/.test(path)) return DOCTORS;
  if (/^\/nurses/.test(path)) return NURSES;
  if (/^\/wards/.test(path)) return WARDS;
  if (/^\/rooms/.test(path)) return ROOMS;
  if (/^\/medicines/.test(path)) return MEDICINES;
  if (/^\/labs/.test(path)) return LABS;
  if (/^\/radiologies/.test(path)) return RADIOLOGIES;

  // Aggregate vitals endpoints
  if (/^\/last20hr/.test(path)) return PATIENTS_TTV.flatMap((p: any) => p.hr).slice(-20);
  if (/^\/last20rr/.test(path)) return PATIENTS_TTV.flatMap((p: any) => p.rr).slice(-20);
  if (/^\/last20spo2/.test(path)) return PATIENTS_TTV.flatMap((p: any) => p.spo2).slice(-20);
  if (/^\/last20temp/.test(path)) return PATIENTS_TTV.flatMap((p: any) => p.temp).slice(-20);
  if (/^\/last20nibp/.test(path)) return PATIENTS_TTV.flatMap((p: any) => p.nibp).slice(-20);

  if (/^\/vitalsign/.test(path)) {
    return PATIENTS_TTV.map((p: any) => ({
      patient_id: p.id,
      patient_name: p.patient_name,
      hr: p.hr,
      rr: p.rr,
      spo2: p.spo2,
      temp: p.temp,
      nibp: p.nibp,
    }));
  }

  return [];
}

export function setupMockAdapter(axiosInstance: any): void {
  axiosInstance.defaults.adapter = async (
    config: InternalAxiosRequestConfig
  ): Promise<AxiosResponse> => {
    const data = route(
      config.url || '',
      (config.method || 'get').toLowerCase()
    );
    return { data, status: 200, statusText: 'OK', headers: {}, config };
  };
}
