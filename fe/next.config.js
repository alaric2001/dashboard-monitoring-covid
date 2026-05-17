/** @type {import('next').NextConfig} */
function getApiRemotePattern() {
  const url = process.env.NEXT_PUBLIC_API_URL ?? 'http://52.74.21.105/api';
  try {
    const parsed = new URL(url.replace(/\/api$/, ''));
    return {
      protocol: parsed.protocol.replace(':', ''),
      hostname: parsed.hostname,
      port: parsed.port || '',
      pathname: '**',
    };
  } catch {
    return { protocol: 'http', hostname: '52.74.21.105', port: '', pathname: '**' };
  }
}

const nextConfig = {
  experimental: {
    appDir: true,
  },
  compiler: {
    styledComponents: true,
  },
  eslint: {
    dirs: ['src'],
  },

  reactStrictMode: false,
  swcMinify: true,

  i18n: {
    locales: ['en', 'id'],
    defaultLocale: 'en',
  },

  // Uncoment to add domain whitelist
  images: {
    // Temporary
    dangerouslyAllowSVG: true,
    remotePatterns: [
      {
        protocol: 'https',
        hostname: 'ui-avatars.com',
        port: '',
        pathname: '/api/**',
      },
      getApiRemotePattern(),
    ],
  },

  // SVGR
  webpack(config) {
    config.module.rules.push({
      test: /\.svg$/i,
      issuer: /\.[jt]sx?$/,
      use: [
        {
          loader: '@svgr/webpack',
          options: {
            typescript: true,
            icon: true,
          },
        },
      ],
    });

    config.devServer = {
      client: {
        overlay: false,
      },
    };

    return config;
  },
};

module.exports = nextConfig