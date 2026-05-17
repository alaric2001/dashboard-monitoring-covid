import axios from 'axios';

const baseUrl = process.env.NEXT_PUBLIC_API_URL ?? 'http://127.0.0.1:8000/api';

const getBaseUrl = () => {
  return baseUrl;
};

const getDefaultClient = () => {
  return axios.create();
};

const getAuthClient = () => {
  return axios.create({
    headers: {
      Authorization: `Bearer ${localStorage.getItem('access_token')}`, //TODO: get from redux
    },
  });
};

export { getAuthClient, getBaseUrl, getDefaultClient };
