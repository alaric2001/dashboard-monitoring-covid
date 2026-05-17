import axios from 'axios';

const baseUrl = process.env.NEXT_PUBLIC_API_URL ?? 'http://127.0.0.1:8000/api';

const getBaseUrl = () => baseUrl;

// Propagate the mock adapter (set in _app.tsx) to new instances
const getDefaultClient = () =>
  axios.create({ adapter: axios.defaults.adapter });

const getAuthClient = () =>
  axios.create({
    adapter: axios.defaults.adapter,
    headers: {
      Authorization: `Bearer ${localStorage.getItem('access_token')}`,
    },
  });

export { getAuthClient, getBaseUrl, getDefaultClient };
