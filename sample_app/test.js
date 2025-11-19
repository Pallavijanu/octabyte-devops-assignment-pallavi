const http = require('http');

http.get({ hostname: 'localhost', port: 3000, path: '/health' }, (res) => {
  console.log('Health check status:', res.statusCode);
  process.exit(res.statusCode === 200 ? 0 : 1);
}).on('error', (e) => {
  console.error('Health check failed', e);
  process.exit(1);
});
