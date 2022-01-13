/** @type {import('next').NextConfig} */
module.exports = {
  reactStrictMode: true,
  experimental: {
    outputStandalone: true,
  },
  // See the docs: https://nextjs.org/docs/api-reference/next.config.js/headers
  async headers() {
    return [
      {
        // Match all paths
        source: '/:path*',
        headers: [
          {
            key: 'onion-location',
            // TODO: Enter correct onion address
            value: 'https://temp.onion',
          },
        ],
      },
    ];
  },
};
