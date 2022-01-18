/** @type {import('next').NextConfig} */
module.exports = {
  reactStrictMode: true,
  experimental: {
    // https://nextjs.org/docs/advanced-features/output-file-tracing#automatically-copying-traced-files-experimental
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
            key: 'Onion-Location',
            // TODO: Enter correct onion address
            value:
              'http://devgiochydv35pcemcoxemgvg7ikdbdwn4ecx74djpwdsbytumlxfnyd.onion',
          },
        ],
      },
    ];
  },
};
